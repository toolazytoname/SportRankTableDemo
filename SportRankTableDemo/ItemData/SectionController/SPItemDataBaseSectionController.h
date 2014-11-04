//
//  ItemDataBaseSectionController.h
//  SportRankTableDemo
//
//  Created by SINA on 14/10/30.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPMenuItem.h"
#define PlatFormAppKey @"2923419926"
#import "SPDataRequest.h"
#import "SPBaseSectionController.h"
#import "NSDictionary+Safe.h"
#import "NSArray+Safe.h"




@interface SPItemDataBaseSectionController : SPBaseSectionController<DataRequestDelegate>

@property (nonatomic,strong) SPMenuItem* param;

@end
