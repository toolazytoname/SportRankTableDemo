//
//  SPFootballTopScoreList.h
//  SportRankTableDemo
//
//  Created by SINA on 14/11/3.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPItemDataBaseSectionController.h"

/**
 *  射手榜
 */
@interface SPFootballTopScoreList : SPItemDataBaseSectionController
-(void)requestFootballPlayerRank:(NSString *)item;
@end
