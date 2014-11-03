//
//  NSDictionary+Safe.m
//  NewsHD
//
//  Created by sgl on 13-1-11.
//  Copyright (c) 2013年 Sina. All rights reserved.
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)
- (id)objectForKeyNotNull:(id)key
{
    id r = [self objectForKey:key];
    if (r == [NSNull null]) {
        return nil;
    }
    return r;
}

-(NSString *)JSONString
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"bv_jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}
@end
