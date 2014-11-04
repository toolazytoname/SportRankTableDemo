//
//  SPFootballSaves.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/3.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPFootballSaves.h"

@implementation SPFootballSaves
-(void)requestData
{
    [self requestFootballPlayerRank:@"6" limit:@"10"];
}
@end
