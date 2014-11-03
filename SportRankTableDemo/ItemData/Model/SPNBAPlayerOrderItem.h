//
//  SPNBAPlayerOrderItem.h
//
//  Created by   on 14-5-16
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBaseModel.h"


@interface SPNBAPlayerOrderItem : SPBaseModel <NSCoding, NSCopying>


@property (nonatomic, strong) NSString *stat;
@property (nonatomic, strong) NSString *statpercentage;
@property (nonatomic, strong) NSString *teamName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *playerId;
@property (nonatomic, strong) NSString *teamNameCn;
@property (nonatomic, strong) NSString *fullnameCn;
@property (nonatomic, strong) NSString *teamId;
@property (nonatomic, strong) NSString *lastNameCn;
@property (nonatomic, strong) NSString *ranking;
@property (nonatomic, strong) NSString *firstName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
