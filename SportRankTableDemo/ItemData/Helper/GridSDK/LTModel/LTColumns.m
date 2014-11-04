//
//  LTColumns.m
//
//  Created by Ga Static on 14-7-30
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "LTColumns.h"


NSString *const kLTColumnsWidths = @"widths";
NSString *const kLTColumnsGridHeight = @"gridHeight";
NSString *const kLTColumnsField = @"field";
NSString *const kLTColumnsColumnsData = @"columnsData";


@interface LTColumns ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LTColumns

@synthesize widths = _widths;
@synthesize gridHeight = _gridHeight;
@synthesize field = _field;
@synthesize columnsData = _columnsData;


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
            self.widths = [self objectOrNilForKey:kLTColumnsWidths fromDictionary:dict];
            self.gridHeight = [self objectOrNilForKey:kLTColumnsGridHeight fromDictionary:dict];
            self.field = [self objectOrNilForKey:kLTColumnsField fromDictionary:dict];
            self.columnsData = [self objectOrNilForKey:kLTColumnsColumnsData fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForWidths = [NSMutableArray array];
    for (NSObject *subArrayObject in self.widths) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWidths addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForWidths addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWidths] forKey:kLTColumnsWidths];
    [mutableDict setValue:self.gridHeight forKey:kLTColumnsGridHeight];
    NSMutableArray *tempArrayForField = [NSMutableArray array];
    for (NSObject *subArrayObject in self.field) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForField addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForField addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForField] forKey:kLTColumnsField];
    NSMutableArray *tempArrayForColumnsData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.columnsData) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForColumnsData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForColumnsData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForColumnsData] forKey:kLTColumnsColumnsData];

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

    self.widths = [aDecoder decodeObjectForKey:kLTColumnsWidths];
    self.gridHeight = [aDecoder decodeObjectForKey:kLTColumnsGridHeight];
    self.field = [aDecoder decodeObjectForKey:kLTColumnsField];
    self.columnsData = [aDecoder decodeObjectForKey:kLTColumnsColumnsData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_widths forKey:kLTColumnsWidths];
    [aCoder encodeObject:_gridHeight forKey:kLTColumnsGridHeight];
    [aCoder encodeObject:_field forKey:kLTColumnsField];
    [aCoder encodeObject:_columnsData forKey:kLTColumnsColumnsData];
}

- (id)copyWithZone:(NSZone *)zone
{
    LTColumns *copy = [[LTColumns alloc] init];
    
    if (copy) {

        copy.widths = [self.widths copyWithZone:zone];
        copy.gridHeight = [self.gridHeight copyWithZone:zone];
        copy.field = [self.field copyWithZone:zone];
        copy.columnsData = [self.columnsData copyWithZone:zone];
    }
    
    return copy;
}


@end
