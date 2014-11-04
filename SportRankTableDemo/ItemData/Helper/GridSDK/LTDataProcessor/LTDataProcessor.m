//
//  LTDataProcessor.m
//  LinkTableView
//
//  Created by Static Ga on 14-7-23.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTDataProcessor.h"

#define C_TestSection_Count 1

@implementation LTDataProcessor

#pragma mark - public

+ (void)parserData:(NSArray *)dicArray inQueue:(dispatch_queue_t)queue withTemplatePath:(NSString *)formTemplatePath headerTemplatePath:(NSString *)headerTemplatePath withBlock:(LTFormDataProcessorBlock)block {
    dispatch_async(queue ?: dispatch_get_main_queue(), ^{
        @autoreleasepool {
            
            NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:formTemplatePath];
            NSDictionary *headerDic = [NSDictionary dictionaryWithContentsOfFile:headerTemplatePath];

            LTFormParser *parser = [LTFormParser modelObjectWithDictionary:dic];
            LTFormParser *headerParser = [LTFormParser modelObjectWithDictionary:headerDic];
            
            [LTDataProcessor parserData:dicArray withTemplateForm:parser.form headerForm:headerParser.form withBlock:block];

        }
        
    });
    
}

+ (void)parserData:(NSArray *)dicArray inQueue:(dispatch_queue_t)queue withTemplateForm:(LTForm *)tmplateForm headerForm:(LTForm *)headerForm withBlock:(LTFormDataProcessorBlock)block {
    dispatch_async(queue ?: dispatch_get_main_queue(), ^{
        @autoreleasepool {
            [LTDataProcessor parserData:dicArray withTemplateForm:tmplateForm headerForm:headerForm withBlock:block];
        }
    });
}

+ (void)parserData:(NSArray *)dicArray inQueue:(dispatch_queue_t)queue withTemplate:(NSDictionary *)templateDic headerTemplate:(NSDictionary *)headerTemplate withBlock:(LTFormDataProcessorBlock)block {
    //解析模板
    LTFormParser *parser = [LTFormParser modelObjectWithDictionary:templateDic];
    
    LTForm *form = parser.form;
    //解析header模板
    LTFormParser *headerParser = [LTFormParser modelObjectWithDictionary:headerTemplate];
    dispatch_async(queue ?: dispatch_get_main_queue(), ^{
        @autoreleasepool {
            [LTDataProcessor parserData:dicArray withTemplateForm:form headerForm:headerParser.form withBlock:block];
        }
    });
    
}

#pragma mark - private

+ (void)parserData:(NSArray *)dicArray  withTemplateForm:(LTForm *)tmplateForm headerForm:(LTForm *)headerForm withBlock:(LTFormDataProcessorBlock)block {
    LTSections *sections = [tmplateForm.sections objectAtIndex:0];
    NSMutableArray *sectionsValues = [[NSMutableArray alloc] init];
    
    //JSON数据填充模板
    [sections.field enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *filedStr = obj;
        NSMutableArray *tmp = [NSMutableArray array];
        
        [dicArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSDictionary *dic = obj;
            id vaule = [dic objectForKey:filedStr];
            if (vaule) {
                [tmp addObject:vaule];
            }else {
                [tmp addObject:@""];
            }
        }];
        
        [sectionsValues addObject:tmp];
    }];
    sections.columnsData = sectionsValues;
    
    //JSON数据填充模板
    [tmplateForm.columns enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        LTColumns *columns = obj;
        
        NSMutableArray *columnsValues = [[NSMutableArray alloc] init];
        
        [columns.field enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSString *filedStr = obj;
            NSMutableArray *tmp = [NSMutableArray array];
            
            [dicArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                NSDictionary *dic = obj;
                id vaule = [dic objectForKey:filedStr];
                if (vaule) {
                    [tmp addObject:vaule];
                }else {
                    [tmp addObject:@""];
                }
            }];
            
            [columnsValues addObject:tmp];
        }];
        
        columns.columnsData = columnsValues;
    }];
    
    
    if ([NSThread isMainThread]) {
        if (block) {
            block(tmplateForm,headerForm);
        }
    }else {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block(tmplateForm,headerForm);
            }
        });
    }

}


@end