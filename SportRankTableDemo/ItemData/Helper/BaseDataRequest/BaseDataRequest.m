//
//  SPRootDataRequest.m
//  SportsHD
//
//  Created by 李金龙 on 14-2-13.
//  Copyright (c) 2014年 lose.hero. All rights reserved.
//

#import "BaseDataRequest.h"
#import "ASIDownloadCache.h"
#import "JSONKit.h"

@interface  BaseDataRequest()
{
    BOOL _showLoadingView;
    BOOL _showErrorView;
}
@property (nonatomic,strong)    ASIHTTPRequest  *asiHttpRequest;
@property (nonatomic,assign)    BOOL synchronized;
@property (nonatomic,strong)    UIView  *indicatorView;
@end


@implementation BaseDataRequest

+ (id)requestWithDelegate:(id<DataRequestDelegate>) delegate
               isUseCache:(BOOL)isUseCache
{
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:nil
                                          headers:nil
                                    indicatorView:nil
                                     synchronized:NO
                                       isUseCache:isUseCache
                                              url:nil
                                       requestTag:0];
}


+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache

{
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:parameters
                                          headers:nil
                                    indicatorView:nil
                                     synchronized:NO
                                       isUseCache:isUseCache
                                              url:nil
                                       requestTag:0];
}

+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
                userInfo:(id)userInfo
{
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:parameters
                                          headers:nil
                                    indicatorView:nil
                                     synchronized:NO
                                       isUseCache:isUseCache
                                              url:nil
                                       requestTag:0
                                        userInfo:userInfo];
}
+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
                url:(NSString*)url
                 userInfo:(id)userInfo
{
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:parameters
                                          headers:nil
                                    indicatorView:nil
                                     synchronized:NO
                                       isUseCache:isUseCache
                                              url:url
                                       requestTag:0
                                         userInfo:userInfo];
}

+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache requestTag:(int)tag
                 userInfo:(id)userInfo
{
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:parameters
                                          headers:nil
                                    indicatorView:nil
                                     synchronized:NO
                                       isUseCache:isUseCache
                                              url:nil
                                       requestTag:tag
                                         userInfo:userInfo];
}



+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
               requestTag:(int)tag
{
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:parameters
                                          headers:nil
                                    indicatorView:nil
                                     synchronized:NO
                                       isUseCache:isUseCache
                                              url:nil
                                       requestTag:tag];
}



+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
                 userName:(NSString *)userName
                 passWord:(NSString *)passWord
{
    //base64加密，用户名和密码 保存到headers里面.
    NSDictionary *headers = [[NSDictionary alloc]
                             initWithObjectsAndKeys:@"test", @"Authorization", nil];
    
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:parameters
                                          headers:headers
                                    indicatorView:nil
                                     synchronized:NO
                                       isUseCache:NO
                                              url:nil
                                       requestTag:0];
}


+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
            indicatorView:(UIView *)indicatorView;
{
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:parameters
                                          headers:nil
                                    indicatorView:indicatorView
                                     synchronized:NO
                                       isUseCache:isUseCache
                                              url:nil
                                       requestTag:0];
}


+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
                  headers:(NSDictionary *)headers
{
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:parameters
                                          headers:headers
                                    indicatorView:nil
                                     synchronized:NO
                                       isUseCache:isUseCache
                                              url:nil
                                       requestTag:0];
}


+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
                  headers:(NSDictionary *)headers
               isUseCache:(BOOL)isUseCache
            indicatorView:(UIView *)indicatorView
{
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:parameters
                                          headers:headers
                                    indicatorView:indicatorView
                                     synchronized:NO
                                       isUseCache:isUseCache
                                              url:nil
                                       requestTag:0];
}

+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
                  headers:(NSDictionary *)headers
            indicatorView:(UIView *)indicatorView
               isUseCache:(BOOL)isUseCache
             synchronized:(BOOL)synchronized
{
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:parameters
                                          headers:headers
                                    indicatorView:indicatorView
                                     synchronized:synchronized
                                       isUseCache:isUseCache
                                              url:nil
                                       requestTag:0];
}


+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
                      URL:(NSString *)url
{
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:parameters
                                          headers:nil
                                    indicatorView:nil
                                     synchronized:NO
                                       isUseCache:isUseCache
                                              url:url
                                       requestTag:0];
}

+ (id)requestWithDelegate:(id<DataRequestDelegate>)delegate
               parameters:(NSDictionary *)parameters
               isUseCache:(BOOL)isUseCache
                      URL:(NSString *)url
               requestTag:(int)tag
{
    return [[[self class] alloc] initWithDelegate:delegate
                                       parameters:parameters
                                          headers:nil
                                    indicatorView:nil
                                     synchronized:NO
                                       isUseCache:isUseCache
                                              url:url
                                       requestTag:tag];
}




#pragma mark - lifecycle methods
- (id) initWithDelegate:(id<DataRequestDelegate>) delegate
             parameters:(NSDictionary*) parameters
                headers:(NSDictionary*) headers
          indicatorView:(UIView*) indicatorView
           synchronized:(BOOL) synchronized
             isUseCache:(BOOL) isUseCache
                    url:(NSString *) url
             requestTag:(int) tag
              userInfo:(id)userInfo
{
    self = [super init];
    if (self)
    {
        self.userInfo = userInfo;
        self.delegate = delegate;
        self.synchronized = synchronized;
        self.requestTag = tag;
        if (indicatorView)
        {
            self.indicatorView = indicatorView;
        }
        
        NSString *URL = [self getURL] == nil ? url : [self getURL];
        
        
        [self getRequestWithURL:URL
                 withParameters:parameters
                        headers:headers];
        if (isUseCache)
        {
            [self reloadFromCache];
        }
        
        self.isCache = NO;
        [self.asiHttpRequest setCachePolicy:ASIDoNotReadFromCacheCachePolicy];
        if (self.synchronized)
        {
            [self.asiHttpRequest startSynchronous];
        }
        else
        {
            [self.asiHttpRequest startAsynchronous];
        }
    }
    
    return self;
}

- (id) initWithDelegate:(id<DataRequestDelegate>) delegate
             parameters:(NSDictionary*) parameters
                headers:(NSDictionary*) headers
          indicatorView:(UIView*) indicatorView
           synchronized:(BOOL) synchronized
             isUseCache:(BOOL) isUseCache
                    url:(NSString *) url
             requestTag:(int) tag
{
    self = [super init];
    if (self)
    {
        self.userInfo = [NSMutableDictionary dictionary];
        self.delegate = delegate;
        self.synchronized = synchronized;
        self.requestTag = tag;
        if (indicatorView)
        {
            self.indicatorView = indicatorView;
        }
        
        NSString *URL = [self getURL] == nil ? url : [self getURL];
        
        
        [self getRequestWithURL:URL
                 withParameters:parameters
                        headers:headers];
        if (isUseCache)
        {
            [self reloadFromCache];
        }
        
        self.isCache = NO;
        [self.asiHttpRequest setCachePolicy:ASIDoNotReadFromCacheCachePolicy];
        if (self.synchronized)
        {
            [self.asiHttpRequest startSynchronous];
        }
        else
        {
            [self.asiHttpRequest startAsynchronous];
        }
    }
    
    return self;
}


- (ASIHTTPRequest *) getRequestWithURL:(NSString *)url
                        withParameters:(NSDictionary *)parameters
                               headers:(NSDictionary *)headers
{
    
    id key;
    id value;
    NSInteger count = 0;
    NSArray *keys = nil;
    NSMutableDictionary *allParameters = [[NSMutableDictionary alloc] init];
	NSDictionary *staticParams = [self getStaticParameters];
	if (staticParams) {
		[allParameters addEntriesFromDictionary:staticParams];
	}
	if (parameters) {
		[allParameters addEntriesFromDictionary:parameters];
	}
    if (allParameters) {
        keys = [allParameters allKeys];
        count = [keys count];
    }
    SPHTTPRequestMethod method = [self getHttpRequestMethod];
    NSMutableString	*paramString = [[NSMutableString alloc] init];
    switch (method) {
        case SPHTTPRequestMethodGET: {
			for (NSInteger i = 0; i < count; i++)
            {
				key = [keys objectAtIndex:i];
				value = [allParameters objectForKey:key];
                if ([value isKindOfClass:[NSArray class]])
                {
                    for (NSString *v in value)
                    {
                        [paramString appendFormat:@"%@=%@", key, v];
                        [paramString appendString:@"&"];
                    }
                }
                else
                {
                    [paramString appendFormat:@"%@=%@", key, value];
					[paramString appendString:@"&"];
                }
			}
            
            if (paramString.length)
            {
                [paramString deleteCharactersInRange:NSMakeRange([paramString length] - 1, 1)];
                //                [paramString setString:[self encodeURL:paramString]];
                url = [url stringByAppendingString:paramString];
            }
#ifdef DEBUG
            NSLog(@"url = %@", url);
#endif
            NSURL *URL = [[NSURL alloc] initWithString:url];
            self.asiHttpRequest = [[ASIHTTPRequest alloc] initWithURL:URL];
            break;
        }
        case SPHTTPRequestMethodPOST:
        {
            NSURL *URL = [[NSURL alloc] initWithString:url];
            self.asiHttpRequest = [[ASIFormDataRequest alloc] initWithURL:URL];
            for (NSInteger i = 0; i < count; i++)
            {
                key = [keys objectAtIndex:i];
                value = [allParameters objectForKey:key];
                if ([value isKindOfClass:[NSArray class]])
                {
                    for (NSString *v in value)
                    {
                        [(ASIFormDataRequest*)self.asiHttpRequest setPostValue:v forKey:key];
                        [paramString appendFormat:@"%@=%@&", key, v];
                    }
                }
                else
                {
                    [(ASIFormDataRequest*)self.asiHttpRequest setPostValue:value forKey:key];
                    [paramString appendFormat:@"%@=%@&", key, value];
                }
            }
            //remove the last & character
            if ([paramString length])
            {
                [paramString deleteCharactersInRange:NSMakeRange([paramString length] - 1, 1)];
            }
            break;
        }
        case SPHTTPRequestMethodMultipartPost:
        {
            NSURL *URL = [[NSURL alloc] initWithString:url];
            self.asiHttpRequest = [[ASIFormDataRequest alloc] initWithURL:URL];
            ((ASIFormDataRequest*)self.asiHttpRequest).postFormat = ASIMultipartFormDataPostFormat;
            for (NSInteger i = 0; i < count; i++)
            {
                key = [keys objectAtIndex:i];
                value = [allParameters objectForKey:key];
                if ([value isKindOfClass:[NSData class]])
                {
                    //[(ASIFormDataRequest*)_asiHttpRequest setData:value forKey:key];
                    //[(ASIFormDataRequest*)_asiHttpRequest addData:value forKey:key];
                    [(ASIFormDataRequest*)self.asiHttpRequest addData:value withFileName:@"myphoto.jpg" andContentType:@"image/jpeg" forKey:key];
                }
                else if([value isKindOfClass:[UIImage class]]) {
                    NSData* data = UIImageJPEGRepresentation(value, 1.0);
                    [(ASIFormDataRequest*)self.asiHttpRequest setData:data forKey:key];
                    //[(ASIFormDataRequest*)_asiHttpRequest addData:data forKey:key];
                }
                else
                {
                    [(ASIFormDataRequest*)self.asiHttpRequest setPostValue:value forKey:key];
                    [paramString appendFormat:@"%@=%@&", key, value];
                }
            }
            //remove the last & character
            [paramString deleteCharactersInRange:NSMakeRange([paramString length] - 1, 1)];
            break;
        }
        default:
            break;
    }
    
    if (!self.asiHttpRequest)
    {
        NSURL *URL = [[NSURL alloc] initWithString:url];
        self.asiHttpRequest = [[ASIHTTPRequest alloc] initWithURL:URL];
    }
    if (headers && [headers count])
    {
        NSMutableDictionary *hs = [[NSMutableDictionary alloc] initWithDictionary:headers];
        self.asiHttpRequest.requestHeaders = hs;
    }
    //[_asiHttpRequest addRequestHeader:@"Accept-encoding" value:@"gzip, deflate"];
    //_asiHttpRequest.shouldCompressRequestBody = YES;
    self.asiHttpRequest.delegate = self;
    return self.asiHttpRequest;
}


-(void)reloadFromCache
{
    [self.asiHttpRequest setDownloadCache:[ASIDownloadCache sharedCache]];
    [self.asiHttpRequest setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    [self.asiHttpRequest setSecondsToCache:60*60*24*30];
    id  cacheData = [[ASIDownloadCache sharedCache]
                     cachedResponseDataForURL:self.asiHttpRequest.url];
    if (cacheData)
    {
        self.asiHttpRequest.rawResponseData = cacheData;
        [self handleResult:self.asiHttpRequest];
        NSError* requestError = [self handleErrorCodeOfResult:self.resultDataDic];
        if (requestError) {
            return;
        }
        [self dataProcess];
        self.isCache = YES;
        
        if (self.delegate && [self.delegate
                              respondsToSelector:@selector(requestDidFinishLoad:)])
        {
            [self.delegate requestDidFinishLoad:self];
            NSLog(@"有缓存");
        }
    }
}

- (void)cancel
{
    if (self.delegate && [self.delegate isKindOfClass:[UIViewController class]]) {
        UIViewController *vc  = (UIViewController *)self.delegate;
        //删除等待loading动画
        [vc removeHUD];
        //删除没有数据的提示页面
//        [vc removeNoDataView];
    }
    self.delegate = nil;
    self.asiHttpRequest.delegate = nil;
    [self.asiHttpRequest cancel];
}


#pragma mark  SubClass  override
- (SPHTTPRequestMethod) getHttpRequestMethod
{
    return SPHTTPRequestMethodPOST;
}

- (NSDictionary*) getStaticParameters
{
    return nil;
}

- (void) startSynchronous
{
    [_asiHttpRequest startSynchronous];
}

- (void)dataProcess
{
    
}

- (NSString*) encodeURL:(NSString *)string
{
    NSString *newString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, NULL, CFSTR("#"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
    
    //:/?[]@!$ &'()*+,;\"<>%{}|\\^~`
    if (newString)
    {
		return newString;
	}
	return @"";
}

#pragma mark  - ASIHTTPRequest Delegate
- (void)requestStarted:(ASIHTTPRequest *)request
{
    if (_showLoadingView) {
        //增加等待loading动画
        if (self.delegate && [self.delegate isKindOfClass:[UIViewController class]]) {
            UIViewController *vc  = (UIViewController *)self.delegate;
            [vc showHUD];
        }
    }
    
    if (request.responseStatusCode != 200)
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(requestFailed:)])
        {
            [self.delegate request:self didFailLoadWithError:request.error];
        }
    }else
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(requestDidStartLoad:)])
        {
            [self.delegate requestDidStartLoad:self];
        }
    }
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    [self handleResult:request];
    
    //进行错误码判断，如果有错 调用request:didFailLoadWithError:
    NSError* requestError = [self handleErrorCodeOfResult:self.resultDataDic];
    if (requestError) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(request:didFailLoadWithError:)]) {
            [self.delegate request:self didFailLoadWithError:requestError];
        }
        return;
    }
    
    [self dataProcess];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(requestDidFinishLoad:)])
    {
        [self.delegate requestDidFinishLoad:self];
    }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    
    if (self.delegate && [self.delegate isKindOfClass:[UIViewController class]]) {
        UIViewController *vc  = (UIViewController *)self.delegate;
        //没有网络的提示
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(request:didFailLoadWithError:)])
    {
        [self.delegate request:self didFailLoadWithError:request.error];
    }
}


#pragma mark  Utils
- (void) handleResult:(ASIHTTPRequest*)request
{
    NSError *error = nil;
    id  result = [NSJSONSerialization JSONObjectWithData:request.responseData
                                                 options:NSJSONReadingMutableContainers
                                                   error:&error];
   
    /*
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *resultStr = [[NSString alloc] initWithData:request.responseData encoding:enc];
    id result = [resultStr objectFromJSONString];
     */
    if ([result isKindOfClass:[NSDictionary class]])
    {
        self.resultDataDic = [[NSMutableDictionary alloc] initWithDictionary:(NSDictionary *)result];
    }else
    {
        self.resultDataDic = [NSMutableDictionary dictionary];
    }
}

- (NSString *)getURL
{
    return nil;
}

- (void)showLoadingView {
    _showLoadingView = YES;
}
- (void)showErrorView {
    _showErrorView = YES;
}

#pragma mark error
- (NSError*)handleErrorCodeOfResult:(NSDictionary *)data
{
    
    NSError* requestError = nil;
    
    int errorCode = [[data valueForKey:@"errno"] intValue];
    NSString * error = [data valueForKey:@"msg"];
    
    if(errorCode == 0){
        errorCode = [[data valueForKey:@"error_code"] intValue];
    }
    
    if(errorCode == 0){
        errorCode = [[data valueForKey:@"code"] intValue];
    }
    
    if(errorCode == 0){
        errorCode = [[data valueForKeyPath:@"result.status.code"] intValue];
        
    }
    
    if(errorCode != 0 ){
        if(error == nil){
            error = [data valueForKey:@"error"];
        }
        if (error == nil) {
            error = [data valueForKey:@"data"];
        }
        if(error == nil){
            error = [data valueForKeyPath:@"result.status.msg"];
        }
        if(error == nil){
            error = @"数据格式错误";
        }
        if (error) {
            requestError = [[NSError alloc]initWithDomain:@"httpDataError" code:DataRequestErrorCode0 userInfo:[NSDictionary dictionaryWithObject:error forKey:@"msg"]];
        }
    }
    else if(data == nil){
        NSString *errMessage = @"数据格式错误";
        requestError = [[NSError alloc]initWithDomain:@"httpDataError" code:DataRequestErrorCode1 userInfo:[NSDictionary dictionaryWithObject:errMessage forKey:@"msg"]];
    }
    
    if ([data count] == 0) {
        requestError = [NSError errorWithDomain:@"httpDataError" code:DataRequestErrorCode2 userInfo:[NSDictionary dictionaryWithObject:@"数据格式错误" forKey:@"msg"]];
    }
    return requestError;
}
@end
