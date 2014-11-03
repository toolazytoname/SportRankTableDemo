//
//  SPNBAWestSection.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/3.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPNBAWestSection.h"

@implementation SPNBAWestSection
- (void)requestDidFinishLoad:(BaseDataRequest*)request
{
    self.dataList = [request.resultDataDic objectForKey:SPwestTeamListKey];
    //请求得到结果之后，执行委托方法，刷新tableview
    if ([self.baseSectionDelegate respondsToSelector:@selector(dataReadyOfController:)]) {
        [self.baseSectionDelegate dataReadyOfController:self];
    }
}

@end
