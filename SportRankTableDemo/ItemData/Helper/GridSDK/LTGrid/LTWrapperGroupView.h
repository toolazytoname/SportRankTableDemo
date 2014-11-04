//
//  LTWrapperGroupView.h
//  LinkTableView
//
//  Created by Static Ga on 14-7-24.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTBaseView.h"
#import "LTGridWrapperView.h"

@class LTGridComponentDataSource;
/**
 *  表格--多个列组成一张表
 */
@interface LTWrapperGroupView : LTBaseView

- (void)fillUpGroupViewWithColumnsData:(LTColumns *)data ;//通过表格数据源，填充表格数据

@end
