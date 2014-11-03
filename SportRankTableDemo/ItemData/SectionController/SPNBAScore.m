//
//  SPNBAScore.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/3.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPNBAScore.h"

@implementation SPNBAScore
-(void)requestData
{
    [self requestNBAPlayerRank:@"1"];
}
-(void)requestNBAPlayerRank:(NSString *)category
{
    NSString *data_from = self.param.itemDataFrom;
    if(data_from && [data_from isEqualToString:@"nba"])
    {
        NSDictionary *paramDic = @{@"app_key": PlatFormAppKey,
                                   @"_sport_t_": @"basketball",
                                   @"_sport_a_": @"playerorder",
                                   @"start":@"0",
                                   @"end":@"5",
                                   @"type": @"place",
                                   @"_sport_s_": data_from,
                                   @"category":category
                                   };
        [self addRequest:[SPNBAPlayerRankRequest requestWithDelegate:self parameters:paramDic isUseCache:YES]];
    }
    
}
#pragma mark - 网络请求
- (void)requestDidStartLoad:(BaseDataRequest*)request
{}
- (void)requestDidFinishLoad:(BaseDataRequest*)request
{
    self.dataList = [request.resultDataDic objectForKey:SPNBAPlayerRankKey];
    //请求得到结果之后，执行委托方法，刷新tableview
    if ([self.baseSectionDelegate respondsToSelector:@selector(dataReadyOfController:)]) {
        [self.baseSectionDelegate dataReadyOfController:self];
    }
}
- (void)request:(BaseDataRequest*)request didFailLoadWithError:(NSError*)error
{}



@end
