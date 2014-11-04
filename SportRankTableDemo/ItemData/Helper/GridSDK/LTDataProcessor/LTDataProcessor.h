//
//  LTDataProcessor.h
//  LinkTableView
//
//  Created by Static Ga on 14-7-23.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTDataModels.h"

/**
 *  解析回调block
 *
 *  @param form       表格-cell中
 *  @param headerForm 表格-headerView上
 */
typedef void(^LTFormDataProcessorBlock)(LTForm *form, LTForm *headerForm);

/**
 *  数据解析
 */
@interface LTDataProcessor : NSObject

/**
 *  通过plist文件生成表格
 *
 *  @param dicArray           数据源JSON
 *  @param queue              操作Queue
 *  @param formTemplatePath   表plist路径
 *  @param headerTemplatePath 表头plist路径
 *  @param block              回调block
 */
+ (void)parserData:(NSArray *)dicArray inQueue:(dispatch_queue_t)queue withTemplatePath:(NSString *)formTemplatePath headerTemplatePath:(NSString *)headerTemplatePath withBlock:(LTFormDataProcessorBlock)block;

/**
 *  通过配置字典，生成表格
 *
 *  @param dicArray       数据源JSON
 *  @param queue          操作Queue
 *  @param templateDic    表的配置字典
 *  @param headerTemplate 表头的配置字典
 *  @param block          回调block
 */
+ (void)parserData:(NSArray *)dicArray inQueue:(dispatch_queue_t)queue withTemplate:(NSDictionary *)templateDic headerTemplate:(NSDictionary *)headerTemplate withBlock:(LTFormDataProcessorBlock)block ;

/**
 *  通过form对象，生成表格
 *
 *  @param dicArray    数据源JSON
 *  @param queue       操作Queue
 *  @param tmplateForm 表form
 *  @param headerForm  表头form
 *  @param block       回调block
 */
+ (void)parserData:(NSArray *)dicArray inQueue:(dispatch_queue_t)queue withTemplateForm:(LTForm *)tmplateForm headerForm:(LTForm *)headerForm withBlock:(LTFormDataProcessorBlock)block;

@end
