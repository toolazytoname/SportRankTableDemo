//
//  SPRequestData.h
//  SportsHD
//
//  Created by 李金龙 on 14-2-13.
//  Copyright (c) 2014年 lose.hero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPRequestResult : NSObject
{
    BOOL        _success;
    BOOL        _showMessage;
}

@property(nonatomic,assign) BOOL        showMessage;
@property(nonatomic,strong) NSNumber    *code;
@property(nonatomic,strong) NSString    *message;
-(id)initWithData:(NSDictionary *)data;
-(void)showAlertMessage;
-(BOOL)isSuccess;
@end
