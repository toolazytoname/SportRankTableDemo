//
//  LTFormTool.m
//  LinkTableView
//
//  Created by Static Ga on 14-7-28.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTFormTool.h"
#import "LTDataModels.h"
#import "LTDataProcessor.h"

@implementation LTFormTool

+ (CGFloat)calculateFormHeightWithData:(LTForm *)data {
    CGFloat height = 0;
    if (data && (NSNull *)data != [NSNull null]) {
        if (data.sections && data.sections.count > 0) {
            LTColumns *dataSouce = [data.sections firstObject];
            if (dataSouce.columnsData && dataSouce.columnsData.count > 0) {
                NSArray *eachColumData = [dataSouce.columnsData firstObject];
                height += eachColumData.count * [dataSouce.gridHeight floatValue];
            }
        }
    }
    return height;
}

+ (LTSections *)createSectionsWithTitles:(NSArray *)sectionTitles sectionWidths:(NSArray *)widths sectionFields:(NSArray *)fields gridHeight:(NSString *)gridHeight{
    
    LTSections *sections = [[LTSections alloc] init];
    
    NSArray *sectionsItem = nil;
    NSMutableArray *columnsData = [[NSMutableArray alloc] init];
    for (NSString *title in sectionTitles) {
        sectionsItem = [NSArray arrayWithObject:title];
        [columnsData addObject:sectionsItem];
    }
    
    sections.columnsData = columnsData;
    sections.widths = widths;
    sections.field = fields;
    sections.gridHeight = gridHeight;
    
    return sections;
}

+ (LTColumns *)createColumnDatas:(NSArray *)columnsDataValues widthWidths:(NSArray *)widths withFields:(NSArray *)fields gridHeight:(NSString *)gridHeight{
    LTColumns *columns = [[LTColumns alloc] init];
    
    columns.widths = widths;
    columns.field = fields;
    NSArray *columnsItems = nil;
    NSMutableArray *columnsData = [[NSMutableArray alloc] init];
    for (NSString *title in columnsDataValues) {
        columnsItems = [NSArray arrayWithObject:title];
        [columnsData addObject:columnsItems];
    }
    columns.columnsData = columnsData;
    columns.gridHeight = gridHeight;
    return columns;
}

@end