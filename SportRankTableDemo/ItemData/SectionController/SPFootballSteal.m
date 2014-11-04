//
//  SPFootballSteal.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/3.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPFootballSteal.h"

@implementation SPFootballSteal
-(void)requestData
{
    [self requestFootballPlayerRank:@"7" limit:@"10"];
}
@end
