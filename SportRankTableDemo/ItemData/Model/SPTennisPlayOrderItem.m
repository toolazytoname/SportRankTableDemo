//
//  SPTennisPlayOrderItem.m
//
//  Created by 懒得起名  on 14/11/5
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "SPTennisPlayOrderItem.h"


NSString *const kSPTennisPlayOrderItemId = @"id";
NSString *const kSPTennisPlayOrderItemNation1 = @"nation1";
NSString *const kSPTennisPlayOrderItemMatchcount = @"matchcount";
NSString *const kSPTennisPlayOrderItemChange = @"change";
NSString *const kSPTennisPlayOrderItemType = @"type";
NSString *const kSPTennisPlayOrderItemRank = @"rank";
NSString *const kSPTennisPlayOrderItemPrevrank = @"prevrank";
NSString *const kSPTennisPlayOrderItemPlayerid1 = @"playerid1";
NSString *const kSPTennisPlayOrderItemNation2 = @"nation2";
NSString *const kSPTennisPlayOrderItemPlayername1 = @"playername1";
NSString *const kSPTennisPlayOrderItemScore = @"score";
NSString *const kSPTennisPlayOrderItemPlayername2 = @"playername2";
NSString *const kSPTennisPlayOrderItemPlayerid2 = @"playerid2";


@interface SPTennisPlayOrderItem ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SPTennisPlayOrderItem

@synthesize sPTennisPlayOrderItemIdentifier = _sPTennisPlayOrderItemIdentifier;
@synthesize nation1 = _nation1;
@synthesize matchcount = _matchcount;
@synthesize change = _change;
@synthesize type = _type;
@synthesize rank = _rank;
@synthesize prevrank = _prevrank;
@synthesize playerid1 = _playerid1;
@synthesize nation2 = _nation2;
@synthesize playername1 = _playername1;
@synthesize score = _score;
@synthesize playername2 = _playername2;
@synthesize playerid2 = _playerid2;


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
            self.sPTennisPlayOrderItemIdentifier = [self objectOrNilForKey:kSPTennisPlayOrderItemId fromDictionary:dict];
            self.nation1 = [self objectOrNilForKey:kSPTennisPlayOrderItemNation1 fromDictionary:dict];
            self.matchcount = [self objectOrNilForKey:kSPTennisPlayOrderItemMatchcount fromDictionary:dict];
            self.change = [self objectOrNilForKey:kSPTennisPlayOrderItemChange fromDictionary:dict];
            self.type = [self objectOrNilForKey:kSPTennisPlayOrderItemType fromDictionary:dict];
            self.rank = [self objectOrNilForKey:kSPTennisPlayOrderItemRank fromDictionary:dict];
            self.prevrank = [self objectOrNilForKey:kSPTennisPlayOrderItemPrevrank fromDictionary:dict];
            self.playerid1 = [self objectOrNilForKey:kSPTennisPlayOrderItemPlayerid1 fromDictionary:dict];
            self.nation2 = [self objectOrNilForKey:kSPTennisPlayOrderItemNation2 fromDictionary:dict];
            self.playername1 = [self objectOrNilForKey:kSPTennisPlayOrderItemPlayername1 fromDictionary:dict];
            self.score = [self objectOrNilForKey:kSPTennisPlayOrderItemScore fromDictionary:dict];
            self.playername2 = [self objectOrNilForKey:kSPTennisPlayOrderItemPlayername2 fromDictionary:dict];
            self.playerid2 = [self objectOrNilForKey:kSPTennisPlayOrderItemPlayerid2 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.sPTennisPlayOrderItemIdentifier forKey:kSPTennisPlayOrderItemId];
    [mutableDict setValue:self.nation1 forKey:kSPTennisPlayOrderItemNation1];
    [mutableDict setValue:self.matchcount forKey:kSPTennisPlayOrderItemMatchcount];
    [mutableDict setValue:self.change forKey:kSPTennisPlayOrderItemChange];
    [mutableDict setValue:self.type forKey:kSPTennisPlayOrderItemType];
    [mutableDict setValue:self.rank forKey:kSPTennisPlayOrderItemRank];
    [mutableDict setValue:self.prevrank forKey:kSPTennisPlayOrderItemPrevrank];
    [mutableDict setValue:self.playerid1 forKey:kSPTennisPlayOrderItemPlayerid1];
    [mutableDict setValue:self.nation2 forKey:kSPTennisPlayOrderItemNation2];
    [mutableDict setValue:self.playername1 forKey:kSPTennisPlayOrderItemPlayername1];
    [mutableDict setValue:self.score forKey:kSPTennisPlayOrderItemScore];
    [mutableDict setValue:self.playername2 forKey:kSPTennisPlayOrderItemPlayername2];
    [mutableDict setValue:self.playerid2 forKey:kSPTennisPlayOrderItemPlayerid2];

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

    self.sPTennisPlayOrderItemIdentifier = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemId];
    self.nation1 = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemNation1];
    self.matchcount = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemMatchcount];
    self.change = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemChange];
    self.type = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemType];
    self.rank = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemRank];
    self.prevrank = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemPrevrank];
    self.playerid1 = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemPlayerid1];
    self.nation2 = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemNation2];
    self.playername1 = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemPlayername1];
    self.score = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemScore];
    self.playername2 = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemPlayername2];
    self.playerid2 = [aDecoder decodeObjectForKey:kSPTennisPlayOrderItemPlayerid2];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sPTennisPlayOrderItemIdentifier forKey:kSPTennisPlayOrderItemId];
    [aCoder encodeObject:_nation1 forKey:kSPTennisPlayOrderItemNation1];
    [aCoder encodeObject:_matchcount forKey:kSPTennisPlayOrderItemMatchcount];
    [aCoder encodeObject:_change forKey:kSPTennisPlayOrderItemChange];
    [aCoder encodeObject:_type forKey:kSPTennisPlayOrderItemType];
    [aCoder encodeObject:_rank forKey:kSPTennisPlayOrderItemRank];
    [aCoder encodeObject:_prevrank forKey:kSPTennisPlayOrderItemPrevrank];
    [aCoder encodeObject:_playerid1 forKey:kSPTennisPlayOrderItemPlayerid1];
    [aCoder encodeObject:_nation2 forKey:kSPTennisPlayOrderItemNation2];
    [aCoder encodeObject:_playername1 forKey:kSPTennisPlayOrderItemPlayername1];
    [aCoder encodeObject:_score forKey:kSPTennisPlayOrderItemScore];
    [aCoder encodeObject:_playername2 forKey:kSPTennisPlayOrderItemPlayername2];
    [aCoder encodeObject:_playerid2 forKey:kSPTennisPlayOrderItemPlayerid2];
}

- (id)copyWithZone:(NSZone *)zone
{
    SPTennisPlayOrderItem *copy = [[SPTennisPlayOrderItem alloc] init];
    
    if (copy) {

        copy.sPTennisPlayOrderItemIdentifier = [self.sPTennisPlayOrderItemIdentifier copyWithZone:zone];
        copy.nation1 = [self.nation1 copyWithZone:zone];
        copy.matchcount = [self.matchcount copyWithZone:zone];
        copy.change = [self.change copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.rank = [self.rank copyWithZone:zone];
        copy.prevrank = [self.prevrank copyWithZone:zone];
        copy.playerid1 = [self.playerid1 copyWithZone:zone];
        copy.nation2 = [self.nation2 copyWithZone:zone];
        copy.playername1 = [self.playername1 copyWithZone:zone];
        copy.score = [self.score copyWithZone:zone];
        copy.playername2 = [self.playername2 copyWithZone:zone];
        copy.playerid2 = [self.playerid2 copyWithZone:zone];
    }
    
    return copy;
}


@end
