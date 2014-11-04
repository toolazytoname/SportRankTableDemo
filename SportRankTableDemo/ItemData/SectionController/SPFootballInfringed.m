//
//  SPFootballInfringed.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/3.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPFootballInfringed.h"

@implementation SPFootballInfringed
-(void)requestData
{
    [self requestFootballPlayerRank:@"9" limit:@"10"];
}
@end
