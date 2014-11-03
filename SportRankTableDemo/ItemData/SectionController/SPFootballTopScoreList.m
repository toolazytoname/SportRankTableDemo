//
//  SPFootballTopScoreList.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/3.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPFootballTopScoreList.h"

@implementation SPFootballTopScoreList
-(void)requestData
{
    [self requestFootballPlayerRank:@"13"];
}
-(void)requestFootballPlayerRank:(NSString *)item
{
    
    NSString *data_from = self.param.itemDataFrom;
    NSString *itemID = self.param.itemID;
    if(data_from && item && itemID)
    {
        NSDictionary *paramDic = @{@"app_key": PlatFormAppKey,
                                   @"_sport_t_": @"football",
                                   @"_sport_a_": @"playerorder",
                                   @"type": itemID,
                                   @"_sport_s_": data_from,
                                   @"item":item,
                                   @"limit":@"10"
                                   };
        [self addRequest:[SPFootballPlayerRankRequest requestWithDelegate:self parameters:paramDic isUseCache:YES]];
    }
    
}

#pragma mark - 网络请求
- (void)requestDidStartLoad:(BaseDataRequest*)request
{}
- (void)requestDidFinishLoad:(BaseDataRequest*)request
{
    self.dataList = [request.resultDataDic objectForKey:SPFootballPlayerRankKey];
    //请求得到结果之后，执行委托方法，刷新tableview
    if ([self.baseSectionDelegate respondsToSelector:@selector(dataReadyOfController:)]) {
        [self.baseSectionDelegate dataReadyOfController:self];
    }
}
- (void)request:(BaseDataRequest*)request didFailLoadWithError:(NSError*)error
{}


@end
