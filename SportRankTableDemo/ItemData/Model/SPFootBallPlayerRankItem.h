//
//  SPFootBallPlayerRankItem.h
//
//  Created by   on 14-5-16
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBaseModel.h"

@interface SPFootBallPlayerRankItem : SPBaseModel <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *item1;
@property (nonatomic, strong) NSString *item6;
@property (nonatomic, strong) NSString *item;
@property (nonatomic, strong) NSString *teamName;
@property (nonatomic, strong) NSString *leagueCn;
@property (nonatomic, strong) NSString *item5;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *item4;
@property (nonatomic, strong) NSString *playerName;
@property (nonatomic, strong) NSString *sPFootBallPlayerRankItemIdentifier;
@property (nonatomic, strong) NSString *playerId;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *itemCn;
@property (nonatomic, strong) NSString *num;
@property (nonatomic, strong) NSString *lastModify;
@property (nonatomic, strong) NSString *item3;
@property (nonatomic, strong) NSString *league;
@property (nonatomic, strong) NSString *item2;
@property (nonatomic, strong) NSString *item7;
@property (nonatomic, strong) NSString *slTeamId;
@property (nonatomic, strong) NSString *playerTeam;
@property (nonatomic, strong) NSString *teamId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
