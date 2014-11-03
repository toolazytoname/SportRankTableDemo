//
//  SPDataRequest.h
//  SportsHD
//
//  Created by 李金龙 on 14-2-13.
//  Copyright (c) 2014年 lose.hero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBaseDataRequest.h"




/*
 获取NBA球队排名，分东部排名，西部排名
 */
//获取NBA 排名，分东部和西部
#define SPeastTeamListKey @"SPeastTeamListKey"
#define SPwestTeamListKey @"SPwestTeamListKey"
@interface SPNBABasketballOrderRequest : SPBaseDataRequest

@end

/*
 获取NBA球员比分榜
 */
#define SPNBAPlayerRankKey @"SPNBAPlayerRankKey" //NBA 球员排行榜
@interface SPNBAPlayerRankRequest : SPBaseDataRequest

@end


/*
 获取足球球队排行榜,积分榜，分组
 */
#define SPWordCupTeamRankKey @"SPWordCupTeamRankKey"
@interface SPWordCupTeamRankRequest : SPBaseDataRequest

@end

/*
 获取足球球员排行榜
 */
#define SPFootballPlayerRankKey @"SPFootballPlayerRankKey"
@interface SPFootballPlayerRankRequest : SPBaseDataRequest

@end


/*
 获取足球球队排行榜，积分榜，不分组
 */
#define SPFootballTeamRankKey @"SPFootballTeamRankKey"
@interface SPFootballTeamRankRequest : SPBaseDataRequest

@end
