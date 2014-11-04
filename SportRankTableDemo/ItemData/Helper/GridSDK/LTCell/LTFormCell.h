//
//  LTFormCell.h
//  LinkTableView
//
//  Created by Static Ga on 14-7-28.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTBaseCell.h"
#import "LinkTableView.h"
/**
 *  竖向tableView（最外层）的cell
 */
@interface LTFormCell : LTBaseCell
@property (nonatomic, assign) NSInteger section;
@property (strong, nonatomic) LinkTableView *linkTableView;
@end
