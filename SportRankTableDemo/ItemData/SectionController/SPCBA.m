//
//  SPCBA.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/4.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPCBA.h"
#import "SPBaseDataViewController.h"

@implementation SPCBA
- (void)refreshUIWithFormData:(LTForm *)form headerForm:(LTForm *)headerForm{
    [self.sectionsArray removeAllObjects];
    [self.formArray removeAllObjects];
    
    [self.sectionsArray addObject:headerForm];
    [self.formArray addObject:form];
    
    //请求得到结果之后，执行委托方法，刷新tableview
    if ([self.baseSectionDelegate respondsToSelector:@selector(dataReadyOfController:)]) {
        [self.baseSectionDelegate dataReadyOfController:self];
    }
}

-(void)requestData
{
    [self requestCBATeamRank];
}

-(void)requestCBATeamRank
{
    self.sectionsArray = [[NSMutableArray alloc] init];
    self.formArray = [[NSMutableArray alloc] init];
    NSString *data_from = self.param.itemDataFrom;
    if(data_from)
    {
        NSDictionary *paramDic = @{@"app_key": PlatFormAppKey,
                                   @"_sport_t_": @"basketball",
                                   @"_sport_a_": @"teamOrder",
                                   @"_sport_s_": data_from
                                   };
        [self addRequest:[SPCBATeamRankRequest requestWithDelegate:self parameters:paramDic isUseCache:YES]];
    }
    
}

#pragma mark - 网络请求
- (void)requestDidStartLoad:(BaseDataRequest*)request
{}
- (void)requestDidFinishLoad:(BaseDataRequest*)request
{
    
    self.dataList = [request.resultDataDic objectForKey:SPCBATeamRankKey];
    
    NSArray *headSectionTitles = @[@"排名"];
    NSArray *headSectionWidths = @[@"38"];
    NSArray *headSectionFields = @[];
    NSString *headSectionHeight = @"20";
    
    NSArray *headColumnsDatas = @[@"球队",@"胜",@"负", @"胜率",@"主场战绩",@"客场战绩",@"每场得分",@"每场丢分",@"连胜/连负"];
    
    //    71 35
    NSArray *headColumnsWidths = @[@"64", @"38", @"38", @"46", @"68", @"68", @"58", @"58", @"48"];
    
    NSArray *headColumnsFields = @[];
    NSString *headColumnsHeight = @"20";
    
    
    NSArray *formSectionTitles = @[];
    NSArray *formSectionWidths = @[@"38"];
    NSArray *formSectionFields = @[@"order"];
    NSString *formSectionHeight = @"20";
    
    NSArray *formColumnsDatas = @[];
    NSArray *formColumnsWidths = headColumnsWidths;
    NSArray *formColumnsFields = @[@"name",@"win",@"lose",@"shenglv",@"hostScore",@"gusetScore",@"score_average",@"lose_score_average",@"state"];
    NSString *formColumnsHeight = @"20";
    
    
    
    LTForm *headerForm = [[LTForm alloc] init];
    headerForm.sections = @[[LTFormTool createSectionsWithTitles:headSectionTitles sectionWidths:headSectionWidths sectionFields:headSectionFields gridHeight:headSectionHeight]];
    headerForm.columns = @[[LTFormTool createColumnDatas:headColumnsDatas widthWidths:headColumnsWidths withFields:headColumnsFields gridHeight:headColumnsHeight]];
    
    LTForm * form = [[LTForm alloc] init];
    form.sections = @[[LTFormTool createSectionsWithTitles:formSectionTitles sectionWidths:formSectionWidths sectionFields:formSectionFields gridHeight:formSectionHeight]];
    form.columns = @[[LTFormTool createColumnDatas:formColumnsDatas widthWidths:formColumnsWidths withFields:formColumnsFields gridHeight:formColumnsHeight]];
    
    __block __weak typeof(self) weakSelf = self;
    [LTDataProcessor parserData:self.dataList inQueue:NULL withTemplateForm:form headerForm:headerForm withBlock:^(LTForm *form, LTForm *headerForm) {
        [weakSelf refreshUIWithFormData:form headerForm:headerForm];
        
        if ([weakSelf.baseSectionDelegate respondsToSelector:@selector(dataReadyOfController:)]) {
            [weakSelf.baseSectionDelegate dataReadyOfController:weakSelf];
        }
    }];
    
}



- (void)request:(BaseDataRequest*)request didFailLoadWithError:(NSError*)error
{}
#pragma mark - tableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section controller:(SPBaseDataViewController *)controller
{
    if (self.dataList.count > 0 && self.formArray.count > 0) {
        return 1;
    }
    else
    {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath controller:(SPBaseDataViewController *)controller
{
    static NSString *formCellIdentifier = @"LTFormCellIdentify";
    LTFormCell *cell = [tableView dequeueReusableCellWithIdentifier:formCellIdentifier];
    if (!cell) {
        cell = [[LTFormCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:formCellIdentifier];
    }
    
    cell.section = indexPath.section;
    if (self.formArray.count > 0) {
        [cell setViewWithModel:[self.formArray safeObjectAtIndex:0]];
    }
    
    return cell;
}
#pragma mark - tableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath controller:(SPBaseDataViewController *)controller
{
    if (self.dataList.count > 0 && self.formArray.count > 0) {
        float height = [LTFormTool calculateFormHeightWithData:[self.formArray safeObjectAtIndex:0]];
        return height;
    }
    return 0;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section controller:(SPBaseDataViewController *)controller
{
    if (self.dataList.count > 0 && self.formArray.count > 0) {
        return 40;
    }
    else
    {
        return 0;
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section controller:(SPBaseDataViewController *)controller
{
    NSString *title = [controller titleNameAtSection:section];
    if (self.sectionsArray.count == 0 || self.dataList.count == 0) {
        return nil;
    }
    LTGridHeaderView *headerView = [[LTGridHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [headerView setViewWithModel:[self.sectionsArray safeObjectAtIndex:0]];
    headerView.titleLabel.text = title;
    headerView.titleLabel.backgroundColor = [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1];
    headerView.tag = 1000 + section;
    return headerView;
}

@end
