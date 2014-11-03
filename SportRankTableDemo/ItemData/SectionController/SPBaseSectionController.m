//
//  SPBaseSectionController.m
//  SportRankTableDemo
//
//  Created by SINA on 14/10/30.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPBaseSectionController.h"
#import "SPMatchDataHeadView.h"
#import "SPBaseDataTableviewCell.h"
#import "SPBaseDataViewController.h"
#import "SPItemDataTitlesHeadView.h"
@interface SPBaseSectionController ()

@end

@implementation SPBaseSectionController

-(id)init
{
    self = [super init];
    if (self) {
        self.requestQueue = [NSMutableArray array];
    }
    return self;
}

-(void)requestData
{}

#pragma mark - tableview delegate and datasource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section controller:(SPBaseDataViewController *)controller
{
    if (self.dataList.count == 0) {
        return 0;
    }
    return 22.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section controller:(SPBaseDataViewController *)controller
{
    NSString *title =  [controller titleNameAtSection:section];
    SPMatchDataHeadView *sectionView = [[SPMatchDataHeadView alloc] init];
    sectionView.sectionTitle.text = title;
    return sectionView;
}

- (UIView *)returnTitlesHeadViewInSection:(NSInteger)section WithController:(SPBaseDataViewController *)controller
{
    NSString *title =  [controller titleNameAtSection:section];
    NSArray *widthArray = [controller widthsAtSection:section];
    NSArray *titlesArray = [controller titlesAtSection:section];
    SPItemDataTitlesHeadView *titlesHeadView = [[SPItemDataTitlesHeadView alloc] initWithTitles:titlesArray title:title widths:widthArray];
    return titlesHeadView;
}

- (CGFloat )returnTitlesHeadViewHeightInSection:(NSInteger)section WithController:(SPBaseDataViewController *)controller
{
    if (self.dataList.count == 0) {
        return 0;
    }
    return 44.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath controller:(SPBaseDataViewController *)controller
{
    NSString* cellName = [controller cellNameAtIndexPath:indexPath];
    Class cellClass = NSClassFromString(cellName);
    CGFloat height = [cellClass getRowHeight];
    return height;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section controller:(SPBaseDataViewController *)controller
{
    return  self.dataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath controller:(SPBaseDataViewController *)controller
{
    NSString* cellName = [controller cellNameAtIndexPath:indexPath];
    NSString* identifier = cellName;
    NSArray *keys = [controller keysAtSection:indexPath.section];
    Class cellClass = NSClassFromString(cellName);
    NSArray *widthArray = [controller widthsAtSection:indexPath.section];
    
    SPBaseDataTableviewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier widths:widthArray];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    id item = [self.dataList objectAtIndex:indexPath.row];
    [cell updateCellWithItem:item indexPath:indexPath param:self.param keys:keys width:widthArray];
    return cell;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView controller:(SPBaseDataViewController *)controller
//{
//    return 0;
//}
#pragma mark Utils
-(void)addRequest:(BaseDataRequest *)request
{
    if (request && [request isKindOfClass:[BaseDataRequest class]])
    {
        if (!self.requestQueue) {
            NSLog(@"self.requestQueue 为 nil");
        }
        [self.requestQueue addObject:request];
    }
}

- (void) cancelAllRequests
{
    [self.requestQueue makeObjectsPerformSelector:@selector(cancel)];
    [self.requestQueue removeAllObjects];
}
- (void)requestDidStartLoad:(BaseDataRequest*)request
{}
- (void)requestDidFinishLoad:(BaseDataRequest*)request
{}
- (void)request:(BaseDataRequest*)request didFailLoadWithError:(NSError*)error
{}


-(void)dealloc
{
    [_param release];
    [_dataList release];
    [super dealloc];
}


@end
