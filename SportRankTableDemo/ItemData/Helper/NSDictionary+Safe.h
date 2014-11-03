//
//  NSDictionary+Safe.h
//  NewsHD
//
//  Created by sgl on 13-1-11.
//  Copyright (c) 2013年 Sina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)
- (id)objectForKeyNotNull:(id)key;
-(NSString *)JSONString;
@end
