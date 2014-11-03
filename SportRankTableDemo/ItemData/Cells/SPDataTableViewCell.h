//
//  SPDataTableViewCell.h
//  SportRankTableDemo
//
//  Created by SINA on 14/10/30.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPBaseDataTableviewCell.h"
#define baseTagNum 100

@interface SPDataTableViewCell : SPBaseDataTableviewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier widths:(NSArray *)widths;
-(void)updateCellWithItem:(id)item indexPath:(NSIndexPath *)indexPath param:(id)param keys:(NSArray *)keys width:(NSArray *)widths;
+(CGFloat)getRowHeight;
-(void)setIsDarkRow:(BOOL)isDarkRow;
-(void)addlabels:(NSArray *)widths;
-(float)getXValue:(NSArray *)widths index:(NSInteger)index;
@end
