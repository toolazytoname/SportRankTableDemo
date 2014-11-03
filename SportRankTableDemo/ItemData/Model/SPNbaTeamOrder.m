//
//  SPNbaTeamOrder.m
//
//  Created by   on 14-5-9
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "SPNbaTeamOrder.h"


NSString *const kEastId = @"id";
NSString *const kEastNameCn = @"name_cn";
NSString *const kEastState = @"state";
NSString *const kEastWinsLosseesPercent = @"wins_lossees_percent";
NSString *const kEastGames = @"games";
NSString *const kEastPercentage = @"percentage";
NSString *const kEastRank = @"rank";
NSString *const kEastWins = @"wins";
NSString *const kEastNumber = @"number";
NSString *const kEastLosses = @"losses";
NSString *const kEastConference = @"conference";
NSString *const kEastKindCn = @"kind_cn";
NSString *const kEastKind = @"kind";
NSString *const kEastName = @"name";



@interface SPNbaTeamOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SPNbaTeamOrder

@synthesize eastIdentifier = _eastIdentifier;
@synthesize nameCn = _nameCn;
@synthesize state = _state;
@synthesize winsLosseesPercent = _winsLosseesPercent;
@synthesize games = _games;
@synthesize percentage = _percentage;
@synthesize rank = _rank;
@synthesize wins = _wins;
@synthesize number = _number;
@synthesize losses = _losses;
@synthesize conference = _conference;
@synthesize kindCn = _kindCn;
@synthesize kind = _kind;
@synthesize name = _name;


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
        self.eastIdentifier = [self objectOrNilForKey:kEastId fromDictionary:dict];
        self.nameCn = [self objectOrNilForKey:kEastNameCn fromDictionary:dict];
        self.winsLosseesPercent = [[self objectOrNilForKey:kEastWinsLosseesPercent fromDictionary:dict] doubleValue];
        self.games = [self objectOrNilForKey:kEastGames fromDictionary:dict];
        self.rank = [self objectOrNilForKey:kEastRank fromDictionary:dict];
        self.wins = [self objectOrNilForKey:kEastWins fromDictionary:dict];
        self.number = [self objectOrNilForKey:kEastNumber fromDictionary:dict];
        self.losses = [self objectOrNilForKey:kEastLosses fromDictionary:dict];
        self.conference = [self objectOrNilForKey:kEastConference fromDictionary:dict];
        self.kindCn = [self objectOrNilForKey:kEastKindCn fromDictionary:dict];
        self.kind = [self objectOrNilForKey:kEastKind fromDictionary:dict];
        self.name = [self objectOrNilForKey:kEastName fromDictionary:dict];
        
        self.percentage =[NSString stringWithFormat:@"%.1f",self.winsLosseesPercent * 100] ;
        if (self.percentage&& self.percentage.length > 0) {
            self.percentage = [self.percentage stringByAppendingString:@"%"];
        }
        
        if (self.games && self.kindCn) {
            self.state = [NSString stringWithFormat:@"%@%@",self.games,self.kindCn];
        }
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.eastIdentifier forKey:kEastId];
    [mutableDict setValue:self.nameCn forKey:kEastNameCn];
    [mutableDict setValue:self.state forKey:kEastState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.winsLosseesPercent] forKey:kEastWinsLosseesPercent];
    [mutableDict setValue:self.games forKey:kEastGames];
    [mutableDict setValue:self.percentage forKey:kEastPercentage];
    [mutableDict setValue:self.rank forKey:kEastRank];
    [mutableDict setValue:self.wins forKey:kEastWins];
    [mutableDict setValue:self.number forKey:kEastNumber];
    [mutableDict setValue:self.losses forKey:kEastLosses];
    [mutableDict setValue:self.conference forKey:kEastConference];
    [mutableDict setValue:self.kindCn forKey:kEastKindCn];
    [mutableDict setValue:self.kind forKey:kEastKind];
    [mutableDict setValue:self.name forKey:kEastName];
    
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
    
    self.eastIdentifier = [aDecoder decodeObjectForKey:kEastId];
    self.nameCn = [aDecoder decodeObjectForKey:kEastNameCn];
    self.state = [aDecoder decodeObjectForKey:kEastState];
    self.winsLosseesPercent = [aDecoder decodeDoubleForKey:kEastWinsLosseesPercent];
    self.games = [aDecoder decodeObjectForKey:kEastGames];
    self.percentage = [aDecoder decodeObjectForKey:kEastPercentage];
    self.rank = [aDecoder decodeObjectForKey:kEastRank];
    self.wins = [aDecoder decodeObjectForKey:kEastWins];
    self.number = [aDecoder decodeObjectForKey:kEastNumber];
    self.losses = [aDecoder decodeObjectForKey:kEastLosses];
    self.conference = [aDecoder decodeObjectForKey:kEastConference];
    self.kindCn = [aDecoder decodeObjectForKey:kEastKindCn];
    self.kind = [aDecoder decodeObjectForKey:kEastKind];
    self.name = [aDecoder decodeObjectForKey:kEastName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_eastIdentifier forKey:kEastId];
    [aCoder encodeObject:_nameCn forKey:kEastNameCn];
    [aCoder encodeObject:_state forKey:kEastState];
    [aCoder encodeDouble:_winsLosseesPercent forKey:kEastWinsLosseesPercent];
    [aCoder encodeObject:_games forKey:kEastGames];
    [aCoder encodeObject:_percentage forKey:kEastPercentage];
    [aCoder encodeObject:_rank forKey:kEastRank];
    [aCoder encodeObject:_wins forKey:kEastWins];
    [aCoder encodeObject:_number forKey:kEastNumber];
    [aCoder encodeObject:_losses forKey:kEastLosses];
    [aCoder encodeObject:_conference forKey:kEastConference];
    [aCoder encodeObject:_kindCn forKey:kEastKindCn];
    [aCoder encodeObject:_kind forKey:kEastKind];
    [aCoder encodeObject:_name forKey:kEastName];
}

- (id)copyWithZone:(NSZone *)zone
{
    SPNbaTeamOrder *copy = [[SPNbaTeamOrder alloc] init];
    
    if (copy) {
        
        copy.eastIdentifier = [self.eastIdentifier copyWithZone:zone];
        copy.nameCn = [self.nameCn copyWithZone:zone];
        copy.state = [self.state copyWithZone:zone];
        copy.winsLosseesPercent = self.winsLosseesPercent;
        copy.games = [self.games copyWithZone:zone];
        copy.percentage = [self.percentage copyWithZone:zone];
        copy.rank = [self.rank copyWithZone:zone];
        copy.wins = [self.wins copyWithZone:zone];
        copy.number = [self.number copyWithZone:zone];
        copy.losses = [self.losses copyWithZone:zone];
        copy.conference = [self.conference copyWithZone:zone];
        copy.kindCn = [self.kindCn copyWithZone:zone];
        copy.kind = [self.kind copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
