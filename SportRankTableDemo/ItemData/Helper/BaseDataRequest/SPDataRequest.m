//
//  SPDataRequest.m
//  SportsHD
//
//  Created by 李金龙 on 14-2-13.
//  Copyright (c) 2014年 lose.hero. All rights reserved.
//

#import "SPDataRequest.h"
#import "BaseDataRequest.h"
#import "NSDictionary+Safe.h"
#import "NSArray+Safe.h"
#import "DataModels.h"





/*
 获取NBA球队排名，分东部排名，西部排名
 */
@implementation SPNBABasketballOrderRequest : SPBaseDataRequest
-(NSString *)getURL
{
    return @"http://platform.sina.com.cn/sports_all/client_api?";
}


-(SPHTTPRequestMethod)getHttpRequestMethod
{
    return SPHTTPRequestMethodGET;
}

-(void)dataProcess
{
    [super dataProcess];
    id resultData = [[self.resultDataDic objectForKey:@"result"] objectForKey:@"data"];
    [self getBestTeamName:@"west" resultData:resultData];
    [self getBestTeamName:@"east" resultData:resultData];
}

-(void)getBestTeamName:(NSString *)side resultData:(id)resultData
{
    if ([resultData isKindOfClass:[NSDictionary class]]) {
        NSArray *dataList = [resultData objectForKeyNotNull:side];
        if (dataList) {
            NSString *listKey = [NSString stringWithFormat:@"SP%@TeamListKey",side];
            NSMutableArray *dataReturnList = [NSMutableArray array];
            [dataList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    [dataReturnList addObject:[SPNbaTeamOrder modelObjectWithDictionary:obj]];
                }
                
            }];
            if (dataReturnList && dataReturnList.count > 0) {
                [self.resultDataDic setObject:dataReturnList forKey:listKey];
            }
            NSDictionary *bestTeamDic = [dataList safeObjectAtIndex:0];
            if (bestTeamDic && [bestTeamDic isKindOfClass:[NSDictionary class]]) {
                NSString *bestTeam = [bestTeamDic objectForKeyNotNull:@"name_cn"];
                if (bestTeam) {
                    [self.resultDataDic setObject:bestTeam forKey:side];
                }
            }
            
        }
    }
}
@end


@implementation SPNBAPlayerRankRequest : SPBaseDataRequest
-(NSString *)getURL
{
    return @"http://platform.sina.com.cn/sports_all/client_api?";
}
-(SPHTTPRequestMethod)getHttpRequestMethod
{
    return SPHTTPRequestMethodGET;
}

-(void)dataProcess
{
    [super dataProcess];
    NSArray *itemArray = [[[self.resultDataDic objectForKeyNotNull:@"result"] objectForKeyNotNull:@"data"] objectForKeyNotNull:@"data"];
    NSMutableArray *returnDataArray = [NSMutableArray array];
    if (itemArray && [itemArray isKindOfClass:[NSArray class]]) {
        [itemArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                SPNBAPlayerOrderItem *item = [SPNBAPlayerOrderItem modelObjectWithDictionary:obj];
                [returnDataArray addObject:item];
            }
        }];
    }
    if (returnDataArray && returnDataArray.count >0) {
        [self.resultDataDic setObject:returnDataArray forKey:SPNBAPlayerRankKey];
    }
    
}
@end


@implementation SPWordCupTeamRankRequest : SPBaseDataRequest
-(NSString *)getURL
{
    return @"http://platform.sina.com.cn/sports_all/client_api?";
}
-(SPHTTPRequestMethod)getHttpRequestMethod
{
    return SPHTTPRequestMethodGET;
}

-(void)dataProcess
{
    [super dataProcess];
    //获取的一个字典
    NSMutableArray *resultList = [NSMutableArray array];
    NSDictionary *itemDic = [[self.resultDataDic objectForKeyNotNull:@"result"] objectForKeyNotNull:@"data"] ;
    NSArray *keys = [itemDic allKeys];
    
    keys = [keys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [keys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSArray *teamArray =  [itemDic objectForKeyNotNull:obj];
        NSString *objString = [NSString stringWithFormat:@"%@组",obj];
        [resultList addObject:objString];
        [resultList addObjectsFromArray: [SPFootballTeamOrderItem modelsWithDicArray:teamArray]];
    }];
    if (resultList) {
        [self.resultDataDic setObject:resultList forKey:SPWordCupTeamRankKey];
    }
}
@end


@implementation SPFootballPlayerRankRequest : SPBaseDataRequest
-(NSString *)getURL
{
    return @"http://platform.sina.com.cn/sports_all/client_api?";
}
-(SPHTTPRequestMethod)getHttpRequestMethod
{
    return SPHTTPRequestMethodGET;
}

-(void)dataProcess
{
    [super dataProcess];
    NSArray *itemArray = [[self.resultDataDic objectForKeyNotNull:@"result"] objectForKeyNotNull:@"data"] ;
    NSMutableArray *returnDataArray = [NSMutableArray array];
    if (itemArray && [itemArray isKindOfClass:[NSArray class]]) {
        [itemArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                SPFootBallPlayerRankItem *item = [SPFootBallPlayerRankItem modelObjectWithDictionary:obj];
                [returnDataArray addObject:item];
            }
        }];
    }
    if (returnDataArray && returnDataArray.count >0) {
        [self.resultDataDic setObject:returnDataArray forKey:SPFootballPlayerRankKey];
    }
    
    
}
@end


@implementation SPFootballTeamRankRequest : SPBaseDataRequest
-(NSString *)getURL
{
    return @"http://platform.sina.com.cn/sports_all/client_api?";
}
-(SPHTTPRequestMethod)getHttpRequestMethod
{
    return SPHTTPRequestMethodGET;
}

-(void)dataProcess
{
    [super dataProcess];
    NSDictionary *itemDic = [[self.resultDataDic objectForKeyNotNull:@"result"] objectForKeyNotNull:@"data"] ;
    if ([itemDic isKindOfClass:[NSDictionary class]]) {
        NSArray *itemArray = [[itemDic allValues] lastObject];
        NSMutableArray *returnDataArray = [NSMutableArray array];
        if (itemArray && [itemArray isKindOfClass:[NSArray class]]) {
            [itemArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    SPFootballTeamOrderItem *item = [SPFootballTeamOrderItem modelObjectWithDictionary:obj];
                    [returnDataArray addObject:item];
                }
            }];
        }
        if (returnDataArray && returnDataArray.count >0) {
            [self.resultDataDic setObject:returnDataArray forKey:SPFootballTeamRankKey];
        }
    }
    
    
}
@end






