//
//  SPBaseDataTableviewCell.h
//  SportRankTableDemo
//
//  Created by SINA on 14/10/30.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSArray+Safe.h"

@interface SPBaseDataTableviewCell : UITableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier widths:(NSArray *)widths;
-(void)updateCellWithItem:(id)item indexPath:(NSIndexPath *)indexPath param:(id)param keys:(NSArray *)keys width:(NSArray *)widths;
+(CGFloat)getRowHeight;
-(void)setIsDarkRow:(BOOL)isDarkRow;
-(void)addlabels:(NSArray *)widths;
-(CGFloat)getXValue:(NSArray *)widths index:(NSInteger)index;
@end
