//
//  LinkTableView.h
//  LinkTableView
//
//  Created by Static Ga on 14-7-23.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTBaseView.h"
#import "LinkTableViewDataSource.h"
#import "LinkTableViewDelegate.h"

@interface LinkTableView : LTBaseView

@property (nonatomic, assign) id<LinkTableViewDataSource>dataSource;
@property (nonatomic, assign) id<LinkTableViewDelegate>delegate;

@property (nonatomic, strong) UIColor *separatorColor;//设置表格分隔线色值

@property (nonatomic) UITableViewCellSeparatorStyle separatorStyle;
@property(nonatomic,getter=isScrollEnabled) BOOL          scrollEnabled;

- (id)initWithFrame:(CGRect)frame;
- (void)reloadData;//刷新数据
- (void)scrollTo:(CGPoint)offset animated:(BOOL)animated;
- (void)enableBounces;//Default NO
- (void)resetSize:(CGSize)size;
@end
