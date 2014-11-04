//
//  LTSections.h
//
//  Created by Ga Static on 14-7-30
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  section
 */

@interface LTSections : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *widths;
@property (nonatomic, strong) NSString *gridHeight;
@property (nonatomic, strong) NSArray *field;
@property (nonatomic, strong) NSArray *columnsData;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
