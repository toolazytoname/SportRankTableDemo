//
//  SPTennisPlayOrderItem.h
//
//  Created by 懒得起名  on 14/11/5
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBaseModel.h"


@interface SPTennisPlayOrderItem : SPBaseModel <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *sPTennisPlayOrderItemIdentifier;
@property (nonatomic, strong) NSString *nation1;
@property (nonatomic, strong) NSString *matchcount;
@property (nonatomic, strong) id change;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *rank;
@property (nonatomic, strong) NSString *prevrank;
@property (nonatomic, strong) NSString *playerid1;
@property (nonatomic, strong) id nation2;
@property (nonatomic, strong) NSString *playername1;
@property (nonatomic, strong) NSString *score;
@property (nonatomic, strong) id playername2;
@property (nonatomic, strong) NSString *playerid2;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
