//
//  SPFootBallPlayerRankItem.m
//
//  Created by   on 14-5-16
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "SPFootBallPlayerRankItem.h"


NSString *const kSPFootBallPlayerRankItemItem1 = @"item1";
NSString *const kSPFootBallPlayerRankItemItem6 = @"item6";
NSString *const kSPFootBallPlayerRankItemItem = @"item";
NSString *const kSPFootBallPlayerRankItemTeamName = @"team_name";
NSString *const kSPFootBallPlayerRankItemLeagueCn = @"league_cn";
NSString *const kSPFootBallPlayerRankItemItem5 = @"item5";
NSString *const kSPFootBallPlayerRankItemYear = @"year";
NSString *const kSPFootBallPlayerRankItemItem4 = @"item4";
NSString *const kSPFootBallPlayerRankItemPlayerName = @"player_name";
NSString *const kSPFootBallPlayerRankItemId = @"id";
NSString *const kSPFootBallPlayerRankItemPlayerId = @"player_id";
NSString *const kSPFootBallPlayerRankItemPic = @"pic";
NSString *const kSPFootBallPlayerRankItemItemCn = @"item_cn";
NSString *const kSPFootBallPlayerRankItemNum = @"num";
NSString *const kSPFootBallPlayerRankItemLastModify = @"last_modify";
NSString *const kSPFootBallPlayerRankItemItem3 = @"item3";
NSString *const kSPFootBallPlayerRankItemLeague = @"league";
NSString *const kSPFootBallPlayerRankItemItem2 = @"item2";
NSString *const kSPFootBallPlayerRankItemItem7 = @"item7";
NSString *const kSPFootBallPlayerRankItemSlTeamId = @"sl_team_id";
NSString *const kSPFootBallPlayerRankItemPlayerTeam = @"player_team";
NSString *const kSPFootBallPlayerRankItemTeamId = @"team_id";


@interface SPFootBallPlayerRankItem ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SPFootBallPlayerRankItem

@synthesize item1 = _item1;
@synthesize item6 = _item6;
@synthesize item = _item;
@synthesize teamName = _teamName;
@synthesize leagueCn = _leagueCn;
@synthesize item5 = _item5;
@synthesize year = _year;
@synthesize item4 = _item4;
@synthesize playerName = _playerName;
@synthesize sPFootBallPlayerRankItemIdentifier = _sPFootBallPlayerRankItemIdentifier;
@synthesize playerId = _playerId;
@synthesize pic = _pic;
@synthesize itemCn = _itemCn;
@synthesize num = _num;
@synthesize lastModify = _lastModify;
@synthesize item3 = _item3;
@synthesize league = _league;
@synthesize item2 = _item2;
@synthesize item7 = _item7;
@synthesize slTeamId = _slTeamId;
@synthesize playerTeam = _playerTeam;
@synthesize teamId = _teamId;


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
            self.item1 = [self objectOrNilForKey:kSPFootBallPlayerRankItemItem1 fromDictionary:dict];
            self.item6 = [self objectOrNilForKey:kSPFootBallPlayerRankItemItem6 fromDictionary:dict];
            self.item = [self objectOrNilForKey:kSPFootBallPlayerRankItemItem fromDictionary:dict];
            self.teamName = [self objectOrNilForKey:kSPFootBallPlayerRankItemTeamName fromDictionary:dict];
            self.leagueCn = [self objectOrNilForKey:kSPFootBallPlayerRankItemLeagueCn fromDictionary:dict];
            self.item5 = [self objectOrNilForKey:kSPFootBallPlayerRankItemItem5 fromDictionary:dict];
            self.year = [self objectOrNilForKey:kSPFootBallPlayerRankItemYear fromDictionary:dict];
            self.item4 = [self objectOrNilForKey:kSPFootBallPlayerRankItemItem4 fromDictionary:dict];
            self.playerName = [self objectOrNilForKey:kSPFootBallPlayerRankItemPlayerName fromDictionary:dict];
            self.sPFootBallPlayerRankItemIdentifier = [self objectOrNilForKey:kSPFootBallPlayerRankItemId fromDictionary:dict];
            self.playerId = [self objectOrNilForKey:kSPFootBallPlayerRankItemPlayerId fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kSPFootBallPlayerRankItemPic fromDictionary:dict];
            self.itemCn = [self objectOrNilForKey:kSPFootBallPlayerRankItemItemCn fromDictionary:dict];
            self.num = [self objectOrNilForKey:kSPFootBallPlayerRankItemNum fromDictionary:dict];
            self.lastModify = [self objectOrNilForKey:kSPFootBallPlayerRankItemLastModify fromDictionary:dict];
            self.item3 = [self objectOrNilForKey:kSPFootBallPlayerRankItemItem3 fromDictionary:dict];
            self.league = [self objectOrNilForKey:kSPFootBallPlayerRankItemLeague fromDictionary:dict];
            self.item2 = [self objectOrNilForKey:kSPFootBallPlayerRankItemItem2 fromDictionary:dict];
            self.item7 = [self objectOrNilForKey:kSPFootBallPlayerRankItemItem7 fromDictionary:dict];
            self.slTeamId = [self objectOrNilForKey:kSPFootBallPlayerRankItemSlTeamId fromDictionary:dict];
            self.playerTeam = [self objectOrNilForKey:kSPFootBallPlayerRankItemPlayerTeam fromDictionary:dict];
            self.teamId = [self objectOrNilForKey:kSPFootBallPlayerRankItemTeamId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.item1 forKey:kSPFootBallPlayerRankItemItem1];
    [mutableDict setValue:self.item6 forKey:kSPFootBallPlayerRankItemItem6];
    [mutableDict setValue:self.item forKey:kSPFootBallPlayerRankItemItem];
    [mutableDict setValue:self.teamName forKey:kSPFootBallPlayerRankItemTeamName];
    [mutableDict setValue:self.leagueCn forKey:kSPFootBallPlayerRankItemLeagueCn];
    [mutableDict setValue:self.item5 forKey:kSPFootBallPlayerRankItemItem5];
    [mutableDict setValue:self.year forKey:kSPFootBallPlayerRankItemYear];
    [mutableDict setValue:self.item4 forKey:kSPFootBallPlayerRankItemItem4];
    [mutableDict setValue:self.playerName forKey:kSPFootBallPlayerRankItemPlayerName];
    [mutableDict setValue:self.sPFootBallPlayerRankItemIdentifier forKey:kSPFootBallPlayerRankItemId];
    [mutableDict setValue:self.playerId forKey:kSPFootBallPlayerRankItemPlayerId];
    [mutableDict setValue:self.pic forKey:kSPFootBallPlayerRankItemPic];
    [mutableDict setValue:self.itemCn forKey:kSPFootBallPlayerRankItemItemCn];
    [mutableDict setValue:self.num forKey:kSPFootBallPlayerRankItemNum];
    [mutableDict setValue:self.lastModify forKey:kSPFootBallPlayerRankItemLastModify];
    [mutableDict setValue:self.item3 forKey:kSPFootBallPlayerRankItemItem3];
    [mutableDict setValue:self.league forKey:kSPFootBallPlayerRankItemLeague];
    [mutableDict setValue:self.item2 forKey:kSPFootBallPlayerRankItemItem2];
    [mutableDict setValue:self.item7 forKey:kSPFootBallPlayerRankItemItem7];
    [mutableDict setValue:self.slTeamId forKey:kSPFootBallPlayerRankItemSlTeamId];
    [mutableDict setValue:self.playerTeam forKey:kSPFootBallPlayerRankItemPlayerTeam];
    [mutableDict setValue:self.teamId forKey:kSPFootBallPlayerRankItemTeamId];

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

    self.item1 = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemItem1];
    self.item6 = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemItem6];
    self.item = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemItem];
    self.teamName = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemTeamName];
    self.leagueCn = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemLeagueCn];
    self.item5 = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemItem5];
    self.year = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemYear];
    self.item4 = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemItem4];
    self.playerName = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemPlayerName];
    self.sPFootBallPlayerRankItemIdentifier = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemId];
    self.playerId = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemPlayerId];
    self.pic = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemPic];
    self.itemCn = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemItemCn];
    self.num = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemNum];
    self.lastModify = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemLastModify];
    self.item3 = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemItem3];
    self.league = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemLeague];
    self.item2 = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemItem2];
    self.item7 = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemItem7];
    self.slTeamId = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemSlTeamId];
    self.playerTeam = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemPlayerTeam];
    self.teamId = [aDecoder decodeObjectForKey:kSPFootBallPlayerRankItemTeamId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_item1 forKey:kSPFootBallPlayerRankItemItem1];
    [aCoder encodeObject:_item6 forKey:kSPFootBallPlayerRankItemItem6];
    [aCoder encodeObject:_item forKey:kSPFootBallPlayerRankItemItem];
    [aCoder encodeObject:_teamName forKey:kSPFootBallPlayerRankItemTeamName];
    [aCoder encodeObject:_leagueCn forKey:kSPFootBallPlayerRankItemLeagueCn];
    [aCoder encodeObject:_item5 forKey:kSPFootBallPlayerRankItemItem5];
    [aCoder encodeObject:_year forKey:kSPFootBallPlayerRankItemYear];
    [aCoder encodeObject:_item4 forKey:kSPFootBallPlayerRankItemItem4];
    [aCoder encodeObject:_playerName forKey:kSPFootBallPlayerRankItemPlayerName];
    [aCoder encodeObject:_sPFootBallPlayerRankItemIdentifier forKey:kSPFootBallPlayerRankItemId];
    [aCoder encodeObject:_playerId forKey:kSPFootBallPlayerRankItemPlayerId];
    [aCoder encodeObject:_pic forKey:kSPFootBallPlayerRankItemPic];
    [aCoder encodeObject:_itemCn forKey:kSPFootBallPlayerRankItemItemCn];
    [aCoder encodeObject:_num forKey:kSPFootBallPlayerRankItemNum];
    [aCoder encodeObject:_lastModify forKey:kSPFootBallPlayerRankItemLastModify];
    [aCoder encodeObject:_item3 forKey:kSPFootBallPlayerRankItemItem3];
    [aCoder encodeObject:_league forKey:kSPFootBallPlayerRankItemLeague];
    [aCoder encodeObject:_item2 forKey:kSPFootBallPlayerRankItemItem2];
    [aCoder encodeObject:_item7 forKey:kSPFootBallPlayerRankItemItem7];
    [aCoder encodeObject:_slTeamId forKey:kSPFootBallPlayerRankItemSlTeamId];
    [aCoder encodeObject:_playerTeam forKey:kSPFootBallPlayerRankItemPlayerTeam];
    [aCoder encodeObject:_teamId forKey:kSPFootBallPlayerRankItemTeamId];
}

- (id)copyWithZone:(NSZone *)zone
{
    SPFootBallPlayerRankItem *copy = [[SPFootBallPlayerRankItem alloc] init];
    
    if (copy) {

        copy.item1 = [self.item1 copyWithZone:zone];
        copy.item6 = [self.item6 copyWithZone:zone];
        copy.item = [self.item copyWithZone:zone];
        copy.teamName = [self.teamName copyWithZone:zone];
        copy.leagueCn = [self.leagueCn copyWithZone:zone];
        copy.item5 = [self.item5 copyWithZone:zone];
        copy.year = [self.year copyWithZone:zone];
        copy.item4 = [self.item4 copyWithZone:zone];
        copy.playerName = [self.playerName copyWithZone:zone];
        copy.sPFootBallPlayerRankItemIdentifier = [self.sPFootBallPlayerRankItemIdentifier copyWithZone:zone];
        copy.playerId = [self.playerId copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.itemCn = [self.itemCn copyWithZone:zone];
        copy.num = [self.num copyWithZone:zone];
        copy.lastModify = [self.lastModify copyWithZone:zone];
        copy.item3 = [self.item3 copyWithZone:zone];
        copy.league = [self.league copyWithZone:zone];
        copy.item2 = [self.item2 copyWithZone:zone];
        copy.item7 = [self.item7 copyWithZone:zone];
        copy.slTeamId = [self.slTeamId copyWithZone:zone];
        copy.playerTeam = [self.playerTeam copyWithZone:zone];
        copy.teamId = [self.teamId copyWithZone:zone];
    }
    
    return copy;
}


@end
