//
//  SPRootDataRequest.h
//  SportsHD
//
//  Created by 李金龙 on 14-2-13.
//  Copyright (c) 2014年 lose.hero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequestDelegate.h"
#import "SPRequestResult.h"
@protocol DataRequestDelegate;

typedef enum
{
    DataRequestErrorCode0 = 90000, //接口报错
    DataRequestErrorCode1 = 90001, //data 为nil
    DataRequestErrorCode2 = 90002, //data count 为 0
    DataRequestErrorCode3 = 90003 //子data count 为 0
} DataRequestErrorCode;

typedef enum
{
    SPHTTPRequestMethodGET,
    SPHTTPRequestMethodPOST,
    SPHTTPRequestMethodMultipartPost
}SPHTTPRequestMethod;


@interface BaseDataRequest : NSObject<ASIHTTPRequestDelegate>
@property (nonatomic,assign)    BOOL                isRequesting;
@property (nonatomic,strong)    SPRequestResult     *requestResult;
@property (nonatomic,strong)    NSMutableDictionary *resultDataDic;
@property (nonatomic,assign)    BOOL                isCache;
@property (nonatomic,assign)      id<DataRequestDelegate> delegate;
@property (nonatomic,assign)    int                 requestTag;
@property (nonatomic,strong)    id                  userInfo;

+ (id)requestWithDelegate:(id<DataRequestDelegate>) delegate
               isUseCache:(BOOL)isUseCache;


+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache;

+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
                userInfo:(id)userInfo;


+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
               requestTag:(int)tag;



+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
                      URL:(NSString *)url;


+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
                      URL:(NSString *)url
               requestTag:(int)tag;



+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
                 userName:(NSString *)userName
               isUseCache:(BOOL)isUseCache
                 passWord:(NSString *)passWord;


+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
            indicatorView:(UIView *)indicatorView;


+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
                  headers:(NSDictionary *)headers;


+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
                  headers:(NSDictionary *)headers
               isUseCache:(BOOL)isUseCache
            indicatorView:(UIView *)indicatorView;

+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
                  headers:(NSDictionary *)headers
            indicatorView:(UIView *)indicatorView
               isUseCache:(BOOL)isUseCache
             synchronized:(BOOL)synchronized;

+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache requestTag:(int)tag
                 userInfo:(id)userInfo;

+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
                      url:(NSString*)url
                 userInfo:(id)userInfo;

- (ASIHTTPRequest *) getRequestWithURL:(NSString *)url
                        withParameters:(NSDictionary *)parameters
                               headers:(NSDictionary *)headers
                            isUseCache:(BOOL)isUseCache;

//取消请求
- (void)cancel;

//得到请求类型GET,POST.子类可以重写这个放到。动态获取请求类型
- (SPHTTPRequestMethod) getHttpRequestMethod;

//得到当前请求URL 子类可以重写。
- (NSString *)getURL;

//数据解析方法，子类可以重写。
- (void)dataProcess;

//获取静态参数，比如系统版本号,项目版本号。
- (NSDictionary *)getStaticParameters;

//URL编码
- (NSString *)encodeURL:(NSString *)string;

//同步请求
- (void)startSynchronous;

//显示正在加载提示（默认不显示）
- (void)showLoadingView;
//显示加载失败提示（默认不显示）
- (void)showErrorView;

@end

@protocol DataRequestDelegate <NSObject>
- (void)requestDidStartLoad:(BaseDataRequest*)request;
- (void)requestDidFinishLoad:(BaseDataRequest*)request;
- (void)request:(BaseDataRequest*)request didFailLoadWithError:(NSError*)error;
@end
