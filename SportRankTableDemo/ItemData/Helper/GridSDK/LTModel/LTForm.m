//
//  LTForm.m
//
//  Created by Ga Static on 14-7-30
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "LTForm.h"
#import "LTColumns.h"
#import "LTSections.h"


NSString *const kLTFormTitle = @"title";
NSString *const kLTFormColumns = @"columns";
NSString *const kLTFormFormHeight = @"formHeight";
NSString *const kLTFormSections = @"sections";


@interface LTForm ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LTForm

@synthesize title = _title;
@synthesize columns = _columns;
@synthesize formHeight = _formHeight;
@synthesize sections = _sections;


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
            self.title = [self objectOrNilForKey:kLTFormTitle fromDictionary:dict];
    NSObject *receivedLTColumns = [dict objectForKey:kLTFormColumns];
    NSMutableArray *parsedLTColumns = [NSMutableArray array];
    if ([receivedLTColumns isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLTColumns) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLTColumns addObject:[LTColumns modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLTColumns isKindOfClass:[NSDictionary class]]) {
       [parsedLTColumns addObject:[LTColumns modelObjectWithDictionary:(NSDictionary *)receivedLTColumns]];
    }

    self.columns = [NSArray arrayWithArray:parsedLTColumns];
            self.formHeight = [self objectOrNilForKey:kLTFormFormHeight fromDictionary:dict];
    NSObject *receivedLTSections = [dict objectForKey:kLTFormSections];
    NSMutableArray *parsedLTSections = [NSMutableArray array];
    if ([receivedLTSections isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLTSections) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLTSections addObject:[LTSections modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLTSections isKindOfClass:[NSDictionary class]]) {
       [parsedLTSections addObject:[LTSections modelObjectWithDictionary:(NSDictionary *)receivedLTSections]];
    }

    self.sections = [NSArray arrayWithArray:parsedLTSections];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kLTFormTitle];
    NSMutableArray *tempArrayForColumns = [NSMutableArray array];
    for (NSObject *subArrayObject in self.columns) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForColumns addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForColumns addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForColumns] forKey:kLTFormColumns];
    [mutableDict setValue:self.formHeight forKey:kLTFormFormHeight];
    NSMutableArray *tempArrayForSections = [NSMutableArray array];
    for (NSObject *subArrayObject in self.sections) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSections addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSections addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSections] forKey:kLTFormSections];

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

    self.title = [aDecoder decodeObjectForKey:kLTFormTitle];
    self.columns = [aDecoder decodeObjectForKey:kLTFormColumns];
    self.formHeight = [aDecoder decodeObjectForKey:kLTFormFormHeight];
    self.sections = [aDecoder decodeObjectForKey:kLTFormSections];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kLTFormTitle];
    [aCoder encodeObject:_columns forKey:kLTFormColumns];
    [aCoder encodeObject:_formHeight forKey:kLTFormFormHeight];
    [aCoder encodeObject:_sections forKey:kLTFormSections];
}

- (id)copyWithZone:(NSZone *)zone
{
    LTForm *copy = [[LTForm alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.columns = [self.columns copyWithZone:zone];
        copy.formHeight = [self.formHeight copyWithZone:zone];
        copy.sections = [self.sections copyWithZone:zone];
    }
    
    return copy;
}


@end
