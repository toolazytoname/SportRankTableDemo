//
//  LTBaseCell.h
//  LinkTableView
//
//  Created by Static Ga on 14-7-28.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewCell+Helper.h"
@interface LTBaseCell : UITableViewCell
+ (id)loadFromXib;
- (void)setViewWithModel:(id)model;
@end
