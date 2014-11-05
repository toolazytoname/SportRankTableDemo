//
//  SPTennisATP.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/5.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPTennisATP.h"

@implementation SPTennisATP


-(void)requestData
{
    [self requestTennisOrder:@"atps" country:nil];
}
-(void)requestTennisOrder:(NSString *)category country:(NSString *)country
{
    
    NSString *data_from = self.param.itemDataFrom;
    if(data_from && data_from.length > 0  && category && category.length > 0)
    {
        NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"app_key": PlatFormAppKey,
                                                                                        @"_sport_t_": @"tennis",
                                                                                        @"_sport_a_": @"playerorder",
                                                                                        @"start": @"0",
                                                                                        @"end":@"10",
                                                                                        @"_sport_s_": data_from,
                                                                                        @"category":category
                                                                                        }] ;
        if (country && country.length > 0) {
            [paramDic setObject:country forKey:@"country"];
        }
        [self addRequest:[SPTennisOrderRequest requestWithDelegate:self parameters:paramDic isUseCache:YES]];
    }
}

#pragma mark - 网络请求
- (void)requestDidStartLoad:(BaseDataRequest*)request
{}
- (void)requestDidFinishLoad:(BaseDataRequest*)request
{
    self.dataList = [request.resultDataDic objectForKey:SPTennisOrderKey];
    //请求得到结果之后，执行委托方法，刷新tableview
    if ([self.baseSectionDelegate respondsToSelector:@selector(dataReadyOfController:)]) {
        [self.baseSectionDelegate dataReadyOfController:self];
    }
}
- (void)request:(BaseDataRequest*)request didFailLoadWithError:(NSError*)error
{}
@end
