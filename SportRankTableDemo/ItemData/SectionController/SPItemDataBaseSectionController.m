//
//  ItemDataBaseSectionController.m
//  SportRankTableDemo
//
//  Created by SINA on 14/10/30.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPItemDataBaseSectionController.h"

@interface SPItemDataBaseSectionController()
@end

@implementation SPItemDataBaseSectionController
-(id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark - tableview delegate and datasource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section controller:(SPBaseDataViewController *)controller
{
    CGFloat height = [self returnTitlesHeadViewHeightInSection:section WithController:controller];
    return height;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section controller:(SPBaseDataViewController *)controller
{
    UIView *headView = [self returnTitlesHeadViewInSection:section WithController:controller];
    return headView;
}

@end
