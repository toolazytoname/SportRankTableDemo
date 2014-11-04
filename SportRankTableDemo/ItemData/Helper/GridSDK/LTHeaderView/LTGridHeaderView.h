//
//  LTGridHeaderView.h
//  LinkTableView
//
//  Created by Static Ga on 14-7-28.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTBaseView.h"

@class LinkTableView;
/**
 *  竖向tableView（最外层）的headerView
 */
@interface LTGridHeaderView : LTBaseView

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) LinkTableView *linkTableView;
@property (nonatomic, strong) NSIndexPath *idx;

- (void)setViewWithModel:(id)model;
@end
