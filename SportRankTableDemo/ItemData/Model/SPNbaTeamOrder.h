//
//  SPNbaTeamOrder.h
//
//  Created by   on 14-5-9
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBaseModel.h"



@interface SPNbaTeamOrder : SPBaseModel <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *eastIdentifier;
@property (nonatomic, strong) NSString *nameCn;
@property (nonatomic, assign) double winsLosseesPercent;
@property (nonatomic, strong) NSString *games;
@property (nonatomic, strong) NSString *rank;
@property (nonatomic, strong) NSString *wins;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *losses;
@property (nonatomic, strong) NSString *conference;
@property (nonatomic, strong) NSString *kindCn;
@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) NSString *name;
//胜率
@property (nonatomic, strong) NSString *percentage;
//状态，连胜 或者 连败 几场
@property (nonatomic, strong) NSString *state;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
