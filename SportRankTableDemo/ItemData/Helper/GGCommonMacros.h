//
//  GGCommonMacros.h
//  WOfficeApp
//
//  Created by Static Ga on 13-9-13.
//  Copyright (c) 2013年 Static Ga. All rights reserved.
//

/*
    常量定义类
 */

#ifndef WOfficeApp_GGCommonMacros_h
#define WOfficeApp_GGCommonMacros_h

#pragma mark - shortcuts

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]


#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]


////////////////////////////////////////////////////////////////////////////////
#pragma mark - common functions



////////////////////////////////////////////////////////////////////////////////

#pragma mark - iphone 5 detection functions
#define SCREEN_HEIGHT_OF_IPHONE5        568
#define SCREEN_HEIGHT                   [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH                    [UIScreen mainScreen].bounds.size.width

////////////////////////////////////////////////////////////////////////////////


#pragma mark - degrees/radian functions

#define degreesToRadian(x) (M_PI * (x) / 180.0)

#define radianToDegrees(radian) (radian*180.0)/(M_PI)

////////////////////////////////////////////////////////////////////////////////
#pragma mark - color functions

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

////////////////////////////////////////////////////////////////////////////////
#pragma mark - clean PerformSelector warings In ARC 

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

////////////////////////////////////////////////////////////////////////////////
#define IS_IOS7 (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)


/*
  *  System Versioning Preprocessor Macros
  */

#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)



#endif
