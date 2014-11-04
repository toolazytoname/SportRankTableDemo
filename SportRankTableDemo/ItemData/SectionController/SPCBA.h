//
//  SPCBA.h
//  SportRankTableDemo
//
//  Created by SINA on 14/11/4.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPItemDataBaseSectionController.h"

#import "LTFormCell.h"
#import "LTGridHeaderView.h"
#import "LTDataProcessor.h"
#import "LTFormTool.h"


@interface SPCBA : SPItemDataBaseSectionController
- (void)refreshUIWithFormData:(LTForm *)form headerForm:(LTForm *)headerForm;
@property (nonatomic, strong) NSMutableArray *sectionsArray;
@property (nonatomic, strong) NSMutableArray *formArray;

-(NSMutableArray *)headColumnsDatas:(NSInteger)scoreCount;
@end
