//
//  LTGridView.h
//  LinkTableView
//
//  Created by Static Ga on 14-7-23.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTBaseView.h"
/**
 *  表格中的单元格
 */
@interface LTGridView : LTBaseView
@property (nonatomic, strong) UILabel *contentLabel;
- (id)initWithFrame:(CGRect)frame content:(NSString *)tmpContent;
@end
