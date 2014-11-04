//
//  LTFormTool.h
//  LinkTableView
//
//  Created by Static Ga on 14-7-28.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTDataModels.h"
#import "LTDataProcessor.h"
#import <CoreGraphics/CoreGraphics.h>
/**
 *  表工具类
 */

@interface LTFormTool : NSObject
/**
 *  计算一张表的高度
 *
 *  @param data 表数据包装器
 *  
 *  默认以最左列（section列）的高度，为整张表的高度
 *
 *  @return 表高度
 */

+ (CGFloat)calculateFormHeightWithData:(LTForm *)data;
+ (LTSections *)createSectionsWithTitles:(NSArray *)sectionTitles sectionWidths:(NSArray *)widths sectionFields:(NSArray *)fields gridHeight:(NSString *)gridHeight;
+ (LTColumns *)createColumnDatas:(NSArray *)columnsDataValues widthWidths:(NSArray *)widths withFields:(NSArray *)fields gridHeight:(NSString *)gridHeight;
@end
