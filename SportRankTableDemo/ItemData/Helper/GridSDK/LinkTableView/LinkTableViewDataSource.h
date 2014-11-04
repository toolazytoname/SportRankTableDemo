//
//  LinkTableViewDataSource.h
//  LinkTableView
//
//  Created by Static Ga on 14-7-23.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTDataModels.h"

@class LinkTableView, LTGridView, LTGridComponentDataSource;

@protocol LinkTableViewDataSource <NSObject>

@required

- (NSUInteger)numberOfSectionsInLinkTableView:(LinkTableView*)linkTableView;

- (LTColumns *)columnsDataSourceForSection:(NSInteger)section;//section 下表格数据源
- (LTColumns *)columnsDataSourceForHeaderInSection:(NSInteger)section;//section headerView数据源

@end
