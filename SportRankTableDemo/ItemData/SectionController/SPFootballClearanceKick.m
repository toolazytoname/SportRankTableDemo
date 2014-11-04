//
//  SPFootballClearanceKick.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/3.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPFootballClearanceKick.h"

@implementation SPFootballClearanceKick
-(void)requestData
{
    [self requestFootballPlayerRank:@"10" limit:@"10"];
}
@end
