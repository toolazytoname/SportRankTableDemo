//
//  SPBaseSectionController.h
//  SportRankTableDemo
//
//  Created by SINA on 14/10/30.
//  Copyright (c) 2014年 Sport. All rights reserved.
//
@class SPBaseDataViewController;

#import <UIKit/UIKit.h>
#import "SPBaseDataRequest.h"
#import "SPDataRequest.h"

@protocol SPBaseSectionDelegate <NSObject>
/**
 数据加载完了，执行的委托方法
 */
/**
 *  数据加载完，执行的委托方法
 *
 *  @param controller self
 */
-(void)dataReadyOfController:(id)controller;
/**
 *  删除转圈动画
 *
 *  @param controller self
 */
-(void)removeHDOfController:(id)controller;
@end


@interface SPBaseSectionController : NSObject
/**
 *  请求网络数据
 *
 *  @param request request
 */
-(void)addRequest:(BaseDataRequest *)request;

/**
 *  取消网络请求
 */
- (void) cancelAllRequests;

/**
 *  委托
 */
@property(assign, nonatomic)id<SPBaseSectionDelegate> baseSectionDelegate;

/**
 *  传入参数
 */
@property (nonatomic,strong) id param;

/**
 *  数据列表
 */
@property(nonatomic,strong)NSMutableArray *dataList;

/**
 *  请求队列
 */
@property (nonatomic, retain) NSMutableArray *requestQueue;

/**
 *  请求数据
 */
-(void)requestData;

/**
 *  返回带title的headview
 *
 */
- (UIView *)returnTitlesHeadViewInSection:(NSInteger)section WithController:(SPBaseDataViewController *)controller;

/**
 *  返回headView的高度
 *
 */
- (CGFloat )returnTitlesHeadViewHeightInSection:(NSInteger)section WithController:(SPBaseDataViewController *)controller;

#pragma mark - tableview delegate and datasource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section controller:(SPBaseDataViewController *)controller;
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section controller:(SPBaseDataViewController *)controller;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath controller:(SPBaseDataViewController *)controller;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section controller:(SPBaseDataViewController *)controller;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath controller:(SPBaseDataViewController *)controller;
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView controller:(SPBaseDataViewController *)controller;
@end
