//
//  LTFormParser.h
//
//  Created by Ga Static on 14-7-30
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  解析表模板
 */

@class LTForm;

@interface LTFormParser : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) LTForm *form;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
