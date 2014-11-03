//
//  SPBaseModel.h
//  MakeModels
//
//  Created by Static Ga on 14-3-20.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  BaseClass
 */

@interface SPBaseModel : NSObject
/**
 *  将Model属性转换为key-value字典
 *
 *  @return Dictionary
 */
- (NSDictionary *)dictionaryRepresentation;

/**
 *  初始化
 *
 *  @param dict json字典
 *
 *  @return 单个Model对象
 */
- (instancetype)initWithDictionary:(NSDictionary *)dict;

/**
 *  解析传进来的参数arr，返回包含Models数组
 *
 *  @param arr ：含多个字典Dictionary的数组
 *
 *  @return Models 数组 
 */
+ (NSArray *)modelsWithDicArray:(NSArray *)arr;

@end
