//
//  SPMenuItem.h
//  SportsHD
//
//  Created by 李金龙 on 14-4-15.
//  Copyright (c) 2014年 lose.hero. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "SPMenuTeam.h"

@interface SPMenuItem : NSObject
@property (nonatomic,assign) BOOL isOpen;
@property (nonatomic,strong) NSString *itemName;
@property (nonatomic,strong) NSString *itemLogo;
@property (nonatomic,strong) NSString *itemID;
@property (nonatomic,strong) NSString *itemType;
@property (nonatomic,strong) NSMutableArray *teamsArray;
@property (nonatomic,strong) NSMutableArray *tempTeamsArray;
@property (nonatomic,strong) NSString *itemDataFrom;
-(id)initWithDic:(NSDictionary *)dic;
@end
