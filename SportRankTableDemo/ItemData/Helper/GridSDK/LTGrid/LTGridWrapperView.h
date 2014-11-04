//
//  LTGridWrapperView.h
//  LinkTableView
//
//  Created by Static Ga on 14-7-23.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTBaseView.h"

typedef struct {
    CGFloat gridWidth;//内部grid宽度
    CGFloat gridHeight;//内部grid高度
    NSUInteger rows;//行数
    NSUInteger columns;//列数
}GridViewWrapperInfo;
/**
 *  表格中的一列（多个单元格组成一列）
 */
@interface LTGridWrapperView : LTBaseView

- (void)fillUpWrapperWithGridsDataArray:(NSArray *)gridsData widthInfo:(GridViewWrapperInfo)info;

@end
