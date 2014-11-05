//
//  SPTennisWTA.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/5.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPTennisWTA.h"

@implementation SPTennisWTA
-(void)requestData
{
    [self requestTennisOrder:@"wtas" country:nil];
}

@end
