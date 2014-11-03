//
//  SPMenuItem.m
//  SportsHD
//
//  Created by 李金龙 on 14-4-15.
//  Copyright (c) 2014年 lose.hero. All rights reserved.
//

#import "SPMenuItem.h"
//#import "SPMenuTeam.h"
@implementation SPMenuItem
-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        self.itemName = [dic objectForKey:@"name"];
        self.itemLogo = [dic objectForKey:@"logo"];
        self.itemID = [dic objectForKey:@"id"];
        self.itemType = [dic objectForKey:@"type"];
        self.teamsArray = [NSMutableArray array];
        
//        NSArray *teamTopData = [[dic objectForKey:@"team"] objectForKey:@"top"];
//        [self addTeamData:teamTopData];
//        NSArray *teamMoreData = [[dic objectForKey:@"team"] objectForKey:@"more"];
//        [self addTeamData:teamMoreData];
    
        self.tempTeamsArray = [self.teamsArray mutableCopy];
    }
    
    return self;
}

//-(void)addTeamData:(NSArray *)dataArray
//{
//    for (NSDictionary *teamDic in dataArray)
//    {
//        SPMenuTeam *team = [[SPMenuTeam alloc] initWithDic:teamDic];
//        [self.teamsArray addObject:team];
//    }
//
//}

-(void)setIsOpen:(BOOL)isOpen
{
    _isOpen = isOpen;
    if (_isOpen)
    {
        self.teamsArray = [self.tempTeamsArray mutableCopy];
    }else
    {
        [self.teamsArray removeAllObjects];
    }
}
@end
