//
//  SPNBAPlayerOrderItem.m
//
//  Created by   on 14-5-16
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "SPNBAPlayerOrderItem.h"


NSString *const kSPNBAPlayerOrderItemStat = @"stat";
NSString *const kSPNBAPlayerOrderItemStatpercentage = @"statpercentage";
NSString *const kSPNBAPlayerOrderItemTeamName = @"team_name";
NSString *const kSPNBAPlayerOrderItemLastName = @"last_name";
NSString *const kSPNBAPlayerOrderItemPlayerId = @"player_id";
NSString *const kSPNBAPlayerOrderItemTeamNameCn = @"team_name_cn";
NSString *const kSPNBAPlayerOrderItemFullnameCn = @"fullname_cn";
NSString *const kSPNBAPlayerOrderItemTeamId = @"team_id";
NSString *const kSPNBAPlayerOrderItemLastNameCn = @"last_name_cn";
NSString *const kSPNBAPlayerOrderItemRanking = @"ranking";
NSString *const kSPNBAPlayerOrderItemFirstName = @"first_name";


@interface SPNBAPlayerOrderItem ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SPNBAPlayerOrderItem

@synthesize stat = _stat;
@synthesize statpercentage = _statpercentage;
@synthesize teamName = _teamName;
@synthesize lastName = _lastName;
@synthesize playerId = _playerId;
@synthesize teamNameCn = _teamNameCn;
@synthesize fullnameCn = _fullnameCn;
@synthesize teamId = _teamId;
@synthesize lastNameCn = _lastNameCn;
@synthesize ranking = _ranking;
@synthesize firstName = _firstName;


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
        self.stat = [self objectOrNilForKey:kSPNBAPlayerOrderItemStat fromDictionary:dict];
        self.teamName = [self objectOrNilForKey:kSPNBAPlayerOrderItemTeamName fromDictionary:dict];
        self.lastName = [self objectOrNilForKey:kSPNBAPlayerOrderItemLastName fromDictionary:dict];
        self.playerId = [self objectOrNilForKey:kSPNBAPlayerOrderItemPlayerId fromDictionary:dict];
        self.teamNameCn = [self objectOrNilForKey:kSPNBAPlayerOrderItemTeamNameCn fromDictionary:dict];
        self.fullnameCn = [self objectOrNilForKey:kSPNBAPlayerOrderItemFullnameCn fromDictionary:dict];
        self.teamId = [self objectOrNilForKey:kSPNBAPlayerOrderItemTeamId fromDictionary:dict];
        self.lastNameCn = [self objectOrNilForKey:kSPNBAPlayerOrderItemLastNameCn fromDictionary:dict];
        self.ranking = [self objectOrNilForKey:kSPNBAPlayerOrderItemRanking fromDictionary:dict];
        self.firstName = [self objectOrNilForKey:kSPNBAPlayerOrderItemFirstName fromDictionary:dict];
        
        self.statpercentage =[NSString stringWithFormat:@"%.1f",self.stat.floatValue * 100] ;
        if (self.statpercentage&& self.statpercentage.length > 0) {
            self.statpercentage = [self.statpercentage stringByAppendingString:@"%"];
        }

        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.stat forKey:kSPNBAPlayerOrderItemStat];
    [mutableDict setValue:self.statpercentage forKey:kSPNBAPlayerOrderItemStatpercentage];
    [mutableDict setValue:self.teamName forKey:kSPNBAPlayerOrderItemTeamName];
    [mutableDict setValue:self.lastName forKey:kSPNBAPlayerOrderItemLastName];
    [mutableDict setValue:self.playerId forKey:kSPNBAPlayerOrderItemPlayerId];
    [mutableDict setValue:self.teamNameCn forKey:kSPNBAPlayerOrderItemTeamNameCn];
    [mutableDict setValue:self.fullnameCn forKey:kSPNBAPlayerOrderItemFullnameCn];
    [mutableDict setValue:self.teamId forKey:kSPNBAPlayerOrderItemTeamId];
    [mutableDict setValue:self.lastNameCn forKey:kSPNBAPlayerOrderItemLastNameCn];
    [mutableDict setValue:self.ranking forKey:kSPNBAPlayerOrderItemRanking];
    [mutableDict setValue:self.firstName forKey:kSPNBAPlayerOrderItemFirstName];
    
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
    
    self.stat = [aDecoder decodeObjectForKey:kSPNBAPlayerOrderItemStat];
    self.statpercentage = [aDecoder decodeObjectForKey:kSPNBAPlayerOrderItemStatpercentage];
    self.teamName = [aDecoder decodeObjectForKey:kSPNBAPlayerOrderItemTeamName];
    self.lastName = [aDecoder decodeObjectForKey:kSPNBAPlayerOrderItemLastName];
    self.playerId = [aDecoder decodeObjectForKey:kSPNBAPlayerOrderItemPlayerId];
    self.teamNameCn = [aDecoder decodeObjectForKey:kSPNBAPlayerOrderItemTeamNameCn];
    self.fullnameCn = [aDecoder decodeObjectForKey:kSPNBAPlayerOrderItemFullnameCn];
    self.teamId = [aDecoder decodeObjectForKey:kSPNBAPlayerOrderItemTeamId];
    self.lastNameCn = [aDecoder decodeObjectForKey:kSPNBAPlayerOrderItemLastNameCn];
    self.ranking = [aDecoder decodeObjectForKey:kSPNBAPlayerOrderItemRanking];
    self.firstName = [aDecoder decodeObjectForKey:kSPNBAPlayerOrderItemFirstName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_stat forKey:kSPNBAPlayerOrderItemStat];
    [aCoder encodeObject:_statpercentage forKey:kSPNBAPlayerOrderItemStatpercentage];
    [aCoder encodeObject:_teamName forKey:kSPNBAPlayerOrderItemTeamName];
    [aCoder encodeObject:_lastName forKey:kSPNBAPlayerOrderItemLastName];
    [aCoder encodeObject:_playerId forKey:kSPNBAPlayerOrderItemPlayerId];
    [aCoder encodeObject:_teamNameCn forKey:kSPNBAPlayerOrderItemTeamNameCn];
    [aCoder encodeObject:_fullnameCn forKey:kSPNBAPlayerOrderItemFullnameCn];
    [aCoder encodeObject:_teamId forKey:kSPNBAPlayerOrderItemTeamId];
    [aCoder encodeObject:_lastNameCn forKey:kSPNBAPlayerOrderItemLastNameCn];
    [aCoder encodeObject:_ranking forKey:kSPNBAPlayerOrderItemRanking];
    [aCoder encodeObject:_firstName forKey:kSPNBAPlayerOrderItemFirstName];
}

- (id)copyWithZone:(NSZone *)zone
{
    SPNBAPlayerOrderItem *copy = [[SPNBAPlayerOrderItem alloc] init];
    
    if (copy) {
        
        copy.stat = [self.stat copyWithZone:zone];
        copy.statpercentage = [self.statpercentage copyWithZone:zone];
        copy.teamName = [self.teamName copyWithZone:zone];
        copy.lastName = [self.lastName copyWithZone:zone];
        copy.playerId = [self.playerId copyWithZone:zone];
        copy.teamNameCn = [self.teamNameCn copyWithZone:zone];
        copy.fullnameCn = [self.fullnameCn copyWithZone:zone];
        copy.teamId = [self.teamId copyWithZone:zone];
        copy.lastNameCn = [self.lastNameCn copyWithZone:zone];
        copy.ranking = [self.ranking copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
    }
    
    return copy;
}


@end
