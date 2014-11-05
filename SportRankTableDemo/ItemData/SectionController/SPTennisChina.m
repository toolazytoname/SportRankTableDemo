//
//  SPTennisChina.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/5.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPTennisChina.h"
#import "NSString+URLEncode.h"

@implementation SPTennisChina
-(void)requestData
{
    [self requestTennisOrder:@"wtas" country:[@"中国" URLEncodedString]];
}


@end
