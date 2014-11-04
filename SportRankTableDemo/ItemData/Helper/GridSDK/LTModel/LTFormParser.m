//
//  LTFormParser.m
//
//  Created by Ga Static on 14-7-30
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "LTFormParser.h"
#import "LTForm.h"


NSString *const kLTFormParserForm = @"form";


@interface LTFormParser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LTFormParser

@synthesize form = _form;


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
            self.form = [LTForm modelObjectWithDictionary:[dict objectForKey:kLTFormParserForm]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.form dictionaryRepresentation] forKey:kLTFormParserForm];

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

    self.form = [aDecoder decodeObjectForKey:kLTFormParserForm];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_form forKey:kLTFormParserForm];
}

- (id)copyWithZone:(NSZone *)zone
{
    LTFormParser *copy = [[LTFormParser alloc] init];
    
    if (copy) {

        copy.form = [self.form copyWithZone:zone];
    }
    
    return copy;
}


@end
