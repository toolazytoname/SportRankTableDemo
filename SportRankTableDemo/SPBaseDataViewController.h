//
//  SPBaseDataViewController.h
//  SportRankTableDemo
//
//  Created by SINA on 14/10/30.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPBaseSectionController.h"
#import "NSDictionary+Safe.h"
#import "NSArray+Safe.h"


@interface SPBaseDataViewController : UIViewController
/**
 *  传入参数
 */
@property (retain, nonatomic) id viewControllerParam;
/**
 *  section Controller 的实例数组
 */
@property(nonatomic,retain) NSMutableArray* instances;
/**
 *  从配置文件读取的section配置
 */
@property(nonatomic,retain) NSArray* sections;
@property (strong, nonatomic) IBOutlet UITableView *dataTableView;

/**
 *  取消请求
 */
-(void)cancelAllRequests;

#pragma mark - Tool
-(NSString*)classNameAtsection:(NSInteger)section;
-(NSString *)cellNameAtIndexPath:(NSIndexPath *)indexPath;
-(NSString*)titleNameAtSection:(NSInteger)section;
-(NSArray *)keysAtSection:(NSInteger)section;
-(NSArray *)widthsAtSection:(NSInteger)section;
-(NSArray *)titlesAtSection:(NSInteger)section;
@end
