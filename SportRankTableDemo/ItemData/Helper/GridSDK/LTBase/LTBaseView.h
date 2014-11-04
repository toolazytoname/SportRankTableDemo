//
//  LTBaseView.h
//  LinkTableView
//
//  Created by Static Ga on 14-7-23.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+ITTAdditions.h"
#import "LTDataModels.h"

@interface LTBaseView : UIView
@property (nonatomic, strong) UIColor *oddColor;//奇数行颜色
@property (nonatomic, strong) UIColor *evenColor;//偶数行颜色
@property (nonatomic, strong) UIColor *textColor;//单元格字颜色
@property (nonatomic, strong) UIFont *textFont;//单元格字体
@property (nonatomic, assign) CGFloat miniTextFontSize;//单元格最小字体

+ (id)loadFromXib;
- (void)setViewWithModel:(id)model;
@end
