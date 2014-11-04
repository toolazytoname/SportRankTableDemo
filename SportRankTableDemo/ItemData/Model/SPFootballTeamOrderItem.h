//
//  SPFootballTeamOrderItem.h
//
//  Created by   on 14-5-16
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBaseModel.h"



@interface SPFootballTeamOrderItem : SPBaseModel <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *awayGoal;
@property (nonatomic, strong) NSString *losegoal;
@property (nonatomic, strong) NSString *manCtrl;
@property (nonatomic, strong) NSString *awayWin;
@property (nonatomic, strong) NSString *awayLosegoal;
@property (nonatomic, strong) NSString *awayTruegoal;
@property (nonatomic, strong) NSString *awayScore;
@property (nonatomic, strong) NSString *slId;
@property (nonatomic, strong) NSString *homeDraw;
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) NSString *homeScore;
@property (nonatomic, strong) NSString *homeWin;
@property (nonatomic, strong) NSString *homeLose;
@property (nonatomic, strong) NSString *draw;
@property (nonatomic, strong) NSString *awayDraw;
@property (nonatomic, assign) NSString *teamOrder;
@property (nonatomic, strong) NSString *lose;
@property (nonatomic, strong) NSString *awayLose;
@property (nonatomic, strong) NSString *group;
@property (nonatomic, strong) NSString *score;
@property (nonatomic, strong) NSString *optaId;
@property (nonatomic, strong) NSString *truegoal;
@property (nonatomic, strong) NSString *homeTruegoal;
@property (nonatomic, strong) NSString *homeLosegoal;
@property (nonatomic, strong) NSString *teamCn;
@property (nonatomic, strong) NSString *leagueId;
@property (nonatomic, strong) NSString *goal;
@property (nonatomic, strong) NSString *homeGoal;
@property (nonatomic, strong) NSString *teamId;
@property (nonatomic, strong) NSString *win;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
