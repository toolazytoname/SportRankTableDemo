//
//  LTBaseCell.m
//  LinkTableView
//
//  Created by Static Ga on 14-7-28.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTBaseCell.h"

@implementation LTBaseCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (id)loadFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)setViewWithModel:(id)model {
    
}
@end
