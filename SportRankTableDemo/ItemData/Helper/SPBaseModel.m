//
//  SPBaseModel.m
//  MakeModels
//
//  Created by Static Ga on 14-3-20.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "SPBaseModel.h"

@implementation SPBaseModel

- (NSDictionary *)dictionaryRepresentation {
    NSLog(@"baseDic");
    return nil;
}
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        
    }
    return self;
}

+ (NSArray *)modelsWithDicArray:(NSArray *)arr {
    NSMutableArray *returnedArr = [NSMutableArray array];
    @autoreleasepool {
        for (NSDictionary *dic in arr) {
            
            SEL selector = @selector(modelObjectWithDictionary:);
            
            if ([[self class] respondsToSelector:selector]) {
                [returnedArr addObject :[[self class] performSelector:selector withObject:dic]];
            }
        }
    }
    return returnedArr;
}
@end
