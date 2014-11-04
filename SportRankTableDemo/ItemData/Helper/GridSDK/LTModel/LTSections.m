//
//  LTSections.m
//
//  Created by Ga Static on 14-7-30
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "LTSections.h"


NSString *const kLTSectionsWidths = @"widths";
NSString *const kLTSectionsGridHeight = @"gridHeight";
NSString *const kLTSectionsField = @"field";
NSString *const kLTSectionsColumnsData = @"columnsData";


@interface LTSections ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LTSections

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
            self.widths = [self objectOrNilForKey:kLTSectionsWidths fromDictionary:dict];
            self.gridHeight = [self objectOrNilForKey:kLTSectionsGridHeight fromDictionary:dict];
            self.field = [self objectOrNilForKey:kLTSectionsField fromDictionary:dict];
            self.columnsData = [self objectOrNilForKey:kLTSectionsColumnsData fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWidths] forKey:kLTSectionsWidths];
    [mutableDict setValue:self.gridHeight forKey:kLTSectionsGridHeight];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForField] forKey:kLTSectionsField];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForColumnsData] forKey:kLTSectionsColumnsData];

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

    self.widths = [aDecoder decodeObjectForKey:kLTSectionsWidths];
    self.gridHeight = [aDecoder decodeObjectForKey:kLTSectionsGridHeight];
    self.field = [aDecoder decodeObjectForKey:kLTSectionsField];
    self.columnsData = [aDecoder decodeObjectForKey:kLTSectionsColumnsData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_widths forKey:kLTSectionsWidths];
    [aCoder encodeObject:_gridHeight forKey:kLTSectionsGridHeight];
    [aCoder encodeObject:_field forKey:kLTSectionsField];
    [aCoder encodeObject:_columnsData forKey:kLTSectionsColumnsData];
}

- (id)copyWithZone:(NSZone *)zone
{
    LTSections *copy = [[LTSections alloc] init];
    
    if (copy) {

        copy.widths = [self.widths copyWithZone:zone];
        copy.gridHeight = [self.gridHeight copyWithZone:zone];
        copy.field = [self.field copyWithZone:zone];
        copy.columnsData = [self.columnsData copyWithZone:zone];
    }
    
    return copy;
}


@end
