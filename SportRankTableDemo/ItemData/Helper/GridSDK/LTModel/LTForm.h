//
//  LTForm.h
//
//  Created by Ga Static on 14-7-30
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  表
 */

@interface LTForm : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *columns;
@property (nonatomic, strong) NSString *formHeight;
@property (nonatomic, strong) NSArray *sections;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
