//
//  UITableViewCell+Helper.m
//  GGSecurityTool
//
//  Created by Static Ga on 13-10-8.
//  Copyright (c) 2013年 Static Ga. All rights reserved.
//

#import "UITableViewCell+Helper.h"

@implementation UITableViewCell (Helper)

- (UITableView *)superTableView
{
    return (UITableView *)[self findTableView:self];
}

- (UIView *)findTableView:(UIView *)view
{
    if (view.superview && [view.superview isKindOfClass:[UITableView class]]) {
        return view.superview;
    }
    return [self findTableView:view.superview];
}

@end
