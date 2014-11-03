//
//  NSArray+Safe.m
//  NewsHD
//
//  Created by sgl on 1/2/13.
//  Copyright (c) 2013 Sina. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)
- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    }
    
    return [self objectAtIndex:index];
}

@end
