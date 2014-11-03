//
//  NSArray+Safe.h
//  NewsHD
//
//  Created by sgl on 1/2/13.
//  Copyright (c) 2013 Sina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Safe)
- (id)safeObjectAtIndex:(NSUInteger)index;
@end
