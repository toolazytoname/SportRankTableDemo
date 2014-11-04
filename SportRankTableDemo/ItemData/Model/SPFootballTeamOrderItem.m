//
//  SPFootballTeamOrderItem.m
//
//  Created by   on 14-5-16
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "SPFootballTeamOrderItem.h"


NSString *const kSPFootballTeamOrderItemAwayGoal = @"away_goal";
NSString *const kSPFootballTeamOrderItemLosegoal = @"losegoal";
NSString *const kSPFootballTeamOrderItemManCtrl = @"man_ctrl";
NSString *const kSPFootballTeamOrderItemAwayWin = @"away_win";
NSString *const kSPFootballTeamOrderItemAwayLosegoal = @"away_losegoal";
NSString *const kSPFootballTeamOrderItemAwayTruegoal = @"away_truegoal";
NSString *const kSPFootballTeamOrderItemAwayScore = @"away_score";
NSString *const kSPFootballTeamOrderItemSlId = @"sl_id";
NSString *const kSPFootballTeamOrderItemHomeDraw = @"home_draw";
NSString *const kSPFootballTeamOrderItemCount = @"count";
NSString *const kSPFootballTeamOrderItemHomeScore = @"home_score";
NSString *const kSPFootballTeamOrderItemHomeWin = @"home_win";
NSString *const kSPFootballTeamOrderItemHomeLose = @"home_lose";
NSString *const kSPFootballTeamOrderItemDraw = @"draw";
NSString *const kSPFootballTeamOrderItemAwayDraw = @"away_draw";
NSString *const kSPFootballTeamOrderItemTeamOrder = @"team_order";
NSString *const kSPFootballTeamOrderItemLose = @"lose";
NSString *const kSPFootballTeamOrderItemAwayLose = @"away_lose";
NSString *const kSPFootballTeamOrderItemGroup = @"group";
NSString *const kSPFootballTeamOrderItemScore = @"score";
NSString *const kSPFootballTeamOrderItemOptaId = @"opta_id";
NSString *const kSPFootballTeamOrderItemTruegoal = @"truegoal";
NSString *const kSPFootballTeamOrderItemHomeTruegoal = @"home_truegoal";
NSString *const kSPFootballTeamOrderItemHomeLosegoal = @"home_losegoal";
NSString *const kSPFootballTeamOrderItemTeamCn = @"team_cn";
NSString *const kSPFootballTeamOrderItemLeagueId = @"league_id";
NSString *const kSPFootballTeamOrderItemGoal = @"goal";
NSString *const kSPFootballTeamOrderItemHomeGoal = @"home_goal";
NSString *const kSPFootballTeamOrderItemTeamId = @"team_id";
NSString *const kSPFootballTeamOrderItemWin = @"win";


@interface SPFootballTeamOrderItem ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SPFootballTeamOrderItem

@synthesize awayGoal = _awayGoal;
@synthesize losegoal = _losegoal;
@synthesize manCtrl = _manCtrl;
@synthesize awayWin = _awayWin;
@synthesize awayLosegoal = _awayLosegoal;
@synthesize awayTruegoal = _awayTruegoal;
@synthesize awayScore = _awayScore;
@synthesize slId = _slId;
@synthesize homeDraw = _homeDraw;
@synthesize count = _count;
@synthesize homeScore = _homeScore;
@synthesize homeWin = _homeWin;
@synthesize homeLose = _homeLose;
@synthesize draw = _draw;
@synthesize awayDraw = _awayDraw;
@synthesize teamOrder = _teamOrder;
@synthesize lose = _lose;
@synthesize awayLose = _awayLose;
@synthesize group = _group;
@synthesize score = _score;
@synthesize optaId = _optaId;
@synthesize truegoal = _truegoal;
@synthesize homeTruegoal = _homeTruegoal;
@synthesize homeLosegoal = _homeLosegoal;
@synthesize teamCn = _teamCn;
@synthesize leagueId = _leagueId;
@synthesize goal = _goal;
@synthesize homeGoal = _homeGoal;
@synthesize teamId = _teamId;
@synthesize win = _win;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.awayGoal = [self objectOrNilForKey:kSPFootballTeamOrderItemAwayGoal fromDictionary:dict];
            self.losegoal = [self objectOrNilForKey:kSPFootballTeamOrderItemLosegoal fromDictionary:dict];
            self.manCtrl = [self objectOrNilForKey:kSPFootballTeamOrderItemManCtrl fromDictionary:dict];
            self.awayWin = [self objectOrNilForKey:kSPFootballTeamOrderItemAwayWin fromDictionary:dict];
            self.awayLosegoal = [self objectOrNilForKey:kSPFootballTeamOrderItemAwayLosegoal fromDictionary:dict];
            self.awayTruegoal = [self objectOrNilForKey:kSPFootballTeamOrderItemAwayTruegoal fromDictionary:dict];
            self.awayScore = [self objectOrNilForKey:kSPFootballTeamOrderItemAwayScore fromDictionary:dict];
            self.slId = [self objectOrNilForKey:kSPFootballTeamOrderItemSlId fromDictionary:dict];
            self.homeDraw = [self objectOrNilForKey:kSPFootballTeamOrderItemHomeDraw fromDictionary:dict];
            self.count = [self objectOrNilForKey:kSPFootballTeamOrderItemCount fromDictionary:dict];
            self.homeScore = [self objectOrNilForKey:kSPFootballTeamOrderItemHomeScore fromDictionary:dict];
            self.homeWin = [self objectOrNilForKey:kSPFootballTeamOrderItemHomeWin fromDictionary:dict];
            self.homeLose = [self objectOrNilForKey:kSPFootballTeamOrderItemHomeLose fromDictionary:dict];
            self.draw = [self objectOrNilForKey:kSPFootballTeamOrderItemDraw fromDictionary:dict];
            self.awayDraw = [self objectOrNilForKey:kSPFootballTeamOrderItemAwayDraw fromDictionary:dict];
            self.teamOrder = [self objectOrNilForKey:kSPFootballTeamOrderItemTeamOrder fromDictionary:dict];
            self.lose = [self objectOrNilForKey:kSPFootballTeamOrderItemLose fromDictionary:dict];
            self.awayLose = [self objectOrNilForKey:kSPFootballTeamOrderItemAwayLose fromDictionary:dict];
            self.group = [self objectOrNilForKey:kSPFootballTeamOrderItemGroup fromDictionary:dict];
            self.score = [self objectOrNilForKey:kSPFootballTeamOrderItemScore fromDictionary:dict];
            self.optaId = [self objectOrNilForKey:kSPFootballTeamOrderItemOptaId fromDictionary:dict];
            self.truegoal = [self objectOrNilForKey:kSPFootballTeamOrderItemTruegoal fromDictionary:dict];
            self.homeTruegoal = [self objectOrNilForKey:kSPFootballTeamOrderItemHomeTruegoal fromDictionary:dict];
            self.homeLosegoal = [self objectOrNilForKey:kSPFootballTeamOrderItemHomeLosegoal fromDictionary:dict];
            self.teamCn = [self objectOrNilForKey:kSPFootballTeamOrderItemTeamCn fromDictionary:dict];
            self.leagueId = [self objectOrNilForKey:kSPFootballTeamOrderItemLeagueId fromDictionary:dict];
            self.goal = [self objectOrNilForKey:kSPFootballTeamOrderItemGoal fromDictionary:dict];
            self.homeGoal = [self objectOrNilForKey:kSPFootballTeamOrderItemHomeGoal fromDictionary:dict];
            self.teamId = [self objectOrNilForKey:kSPFootballTeamOrderItemTeamId fromDictionary:dict];
            self.win = [self objectOrNilForKey:kSPFootballTeamOrderItemWin fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.awayGoal forKey:kSPFootballTeamOrderItemAwayGoal];
    [mutableDict setValue:self.losegoal forKey:kSPFootballTeamOrderItemLosegoal];
    [mutableDict setValue:self.manCtrl forKey:kSPFootballTeamOrderItemManCtrl];
    [mutableDict setValue:self.awayWin forKey:kSPFootballTeamOrderItemAwayWin];
    [mutableDict setValue:self.awayLosegoal forKey:kSPFootballTeamOrderItemAwayLosegoal];
    [mutableDict setValue:self.awayTruegoal forKey:kSPFootballTeamOrderItemAwayTruegoal];
    [mutableDict setValue:self.awayScore forKey:kSPFootballTeamOrderItemAwayScore];
    [mutableDict setValue:self.slId forKey:kSPFootballTeamOrderItemSlId];
    [mutableDict setValue:self.homeDraw forKey:kSPFootballTeamOrderItemHomeDraw];
    [mutableDict setValue:self.count forKey:kSPFootballTeamOrderItemCount];
    [mutableDict setValue:self.homeScore forKey:kSPFootballTeamOrderItemHomeScore];
    [mutableDict setValue:self.homeWin forKey:kSPFootballTeamOrderItemHomeWin];
    [mutableDict setValue:self.homeLose forKey:kSPFootballTeamOrderItemHomeLose];
    [mutableDict setValue:self.draw forKey:kSPFootballTeamOrderItemDraw];
    [mutableDict setValue:self.awayDraw forKey:kSPFootballTeamOrderItemAwayDraw];
    [mutableDict setValue:self.teamOrder forKey:kSPFootballTeamOrderItemTeamOrder];
    [mutableDict setValue:self.lose forKey:kSPFootballTeamOrderItemLose];
    [mutableDict setValue:self.awayLose forKey:kSPFootballTeamOrderItemAwayLose];
    [mutableDict setValue:self.group forKey:kSPFootballTeamOrderItemGroup];
    [mutableDict setValue:self.score forKey:kSPFootballTeamOrderItemScore];
    [mutableDict setValue:self.optaId forKey:kSPFootballTeamOrderItemOptaId];
    [mutableDict setValue:self.truegoal forKey:kSPFootballTeamOrderItemTruegoal];
    [mutableDict setValue:self.homeTruegoal forKey:kSPFootballTeamOrderItemHomeTruegoal];
    [mutableDict setValue:self.homeLosegoal forKey:kSPFootballTeamOrderItemHomeLosegoal];
    [mutableDict setValue:self.teamCn forKey:kSPFootballTeamOrderItemTeamCn];
    [mutableDict setValue:self.leagueId forKey:kSPFootballTeamOrderItemLeagueId];
    [mutableDict setValue:self.goal forKey:kSPFootballTeamOrderItemGoal];
    [mutableDict setValue:self.homeGoal forKey:kSPFootballTeamOrderItemHomeGoal];
    [mutableDict setValue:self.teamId forKey:kSPFootballTeamOrderItemTeamId];
    [mutableDict setValue:self.win forKey:kSPFootballTeamOrderItemWin];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.awayGoal = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemAwayGoal];
    self.losegoal = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemLosegoal];
    self.manCtrl = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemManCtrl];
    self.awayWin = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemAwayWin];
    self.awayLosegoal = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemAwayLosegoal];
    self.awayTruegoal = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemAwayTruegoal];
    self.awayScore = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemAwayScore];
    self.slId = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemSlId];
    self.homeDraw = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemHomeDraw];
    self.count = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemCount];
    self.homeScore = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemHomeScore];
    self.homeWin = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemHomeWin];
    self.homeLose = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemHomeLose];
    self.draw = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemDraw];
    self.awayDraw = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemAwayDraw];
    self.teamOrder = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemTeamOrder];
    self.lose = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemLose];
    self.awayLose = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemAwayLose];
    self.group = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemGroup];
    self.score = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemScore];
    self.optaId = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemOptaId];
    self.truegoal = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemTruegoal];
    self.homeTruegoal = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemHomeTruegoal];
    self.homeLosegoal = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemHomeLosegoal];
    self.teamCn = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemTeamCn];
    self.leagueId = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemLeagueId];
    self.goal = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemGoal];
    self.homeGoal = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemHomeGoal];
    self.teamId = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemTeamId];
    self.win = [aDecoder decodeObjectForKey:kSPFootballTeamOrderItemWin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_awayGoal forKey:kSPFootballTeamOrderItemAwayGoal];
    [aCoder encodeObject:_losegoal forKey:kSPFootballTeamOrderItemLosegoal];
    [aCoder encodeObject:_manCtrl forKey:kSPFootballTeamOrderItemManCtrl];
    [aCoder encodeObject:_awayWin forKey:kSPFootballTeamOrderItemAwayWin];
    [aCoder encodeObject:_awayLosegoal forKey:kSPFootballTeamOrderItemAwayLosegoal];
    [aCoder encodeObject:_awayTruegoal forKey:kSPFootballTeamOrderItemAwayTruegoal];
    [aCoder encodeObject:_awayScore forKey:kSPFootballTeamOrderItemAwayScore];
    [aCoder encodeObject:_slId forKey:kSPFootballTeamOrderItemSlId];
    [aCoder encodeObject:_homeDraw forKey:kSPFootballTeamOrderItemHomeDraw];
    [aCoder encodeObject:_count forKey:kSPFootballTeamOrderItemCount];
    [aCoder encodeObject:_homeScore forKey:kSPFootballTeamOrderItemHomeScore];
    [aCoder encodeObject:_homeWin forKey:kSPFootballTeamOrderItemHomeWin];
    [aCoder encodeObject:_homeLose forKey:kSPFootballTeamOrderItemHomeLose];
    [aCoder encodeObject:_draw forKey:kSPFootballTeamOrderItemDraw];
    [aCoder encodeObject:_awayDraw forKey:kSPFootballTeamOrderItemAwayDraw];
    [aCoder encodeObject:_teamOrder forKey:kSPFootballTeamOrderItemTeamOrder];
    [aCoder encodeObject:_lose forKey:kSPFootballTeamOrderItemLose];
    [aCoder encodeObject:_awayLose forKey:kSPFootballTeamOrderItemAwayLose];
    [aCoder encodeObject:_group forKey:kSPFootballTeamOrderItemGroup];
    [aCoder encodeObject:_score forKey:kSPFootballTeamOrderItemScore];
    [aCoder encodeObject:_optaId forKey:kSPFootballTeamOrderItemOptaId];
    [aCoder encodeObject:_truegoal forKey:kSPFootballTeamOrderItemTruegoal];
    [aCoder encodeObject:_homeTruegoal forKey:kSPFootballTeamOrderItemHomeTruegoal];
    [aCoder encodeObject:_homeLosegoal forKey:kSPFootballTeamOrderItemHomeLosegoal];
    [aCoder encodeObject:_teamCn forKey:kSPFootballTeamOrderItemTeamCn];
    [aCoder encodeObject:_leagueId forKey:kSPFootballTeamOrderItemLeagueId];
    [aCoder encodeObject:_goal forKey:kSPFootballTeamOrderItemGoal];
    [aCoder encodeObject:_homeGoal forKey:kSPFootballTeamOrderItemHomeGoal];
    [aCoder encodeObject:_teamId forKey:kSPFootballTeamOrderItemTeamId];
    [aCoder encodeObject:_win forKey:kSPFootballTeamOrderItemWin];
}

- (id)copyWithZone:(NSZone *)zone
{
    SPFootballTeamOrderItem *copy = [[SPFootballTeamOrderItem alloc] init];
    
    if (copy) {

        copy.awayGoal = [self.awayGoal copyWithZone:zone];
        copy.losegoal = [self.losegoal copyWithZone:zone];
        copy.manCtrl = [self.manCtrl copyWithZone:zone];
        copy.awayWin = [self.awayWin copyWithZone:zone];
        copy.awayLosegoal = [self.awayLosegoal copyWithZone:zone];
        copy.awayTruegoal = [self.awayTruegoal copyWithZone:zone];
        copy.awayScore = [self.awayScore copyWithZone:zone];
        copy.slId = [self.slId copyWithZone:zone];
        copy.homeDraw = [self.homeDraw copyWithZone:zone];
        copy.count = [self.count copyWithZone:zone];
        copy.homeScore = [self.homeScore copyWithZone:zone];
        copy.homeWin = [self.homeWin copyWithZone:zone];
        copy.homeLose = [self.homeLose copyWithZone:zone];
        copy.draw = [self.draw copyWithZone:zone];
        copy.awayDraw = [self.awayDraw copyWithZone:zone];
        copy.teamOrder = self.teamOrder;
        copy.lose = [self.lose copyWithZone:zone];
        copy.awayLose = [self.awayLose copyWithZone:zone];
        copy.group = [self.group copyWithZone:zone];
        copy.score = [self.score copyWithZone:zone];
        copy.optaId = [self.optaId copyWithZone:zone];
        copy.truegoal = [self.truegoal copyWithZone:zone];
        copy.homeTruegoal = [self.homeTruegoal copyWithZone:zone];
        copy.homeLosegoal = [self.homeLosegoal copyWithZone:zone];
        copy.teamCn = [self.teamCn copyWithZone:zone];
        copy.leagueId = [self.leagueId copyWithZone:zone];
        copy.goal = [self.goal copyWithZone:zone];
        copy.homeGoal = [self.homeGoal copyWithZone:zone];
        copy.teamId = [self.teamId copyWithZone:zone];
        copy.win = [self.win copyWithZone:zone];
    }
    
    return copy;
}


@end
