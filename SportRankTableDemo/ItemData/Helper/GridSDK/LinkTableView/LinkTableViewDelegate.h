//
//  LinkTableViewDelegate.h
//  LinkTableView
//
//  Created by Static Ga on 14-7-23.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LinkTableView, LTGridView;

@protocol LinkTableViewDelegate <NSObject>

@optional

- (void)linkTableView:(LinkTableView *)linkTableView scrolledToOffset:(CGPoint)contentOffset;

@end
