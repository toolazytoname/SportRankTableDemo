//
//  LTBaseView.m
//  LinkTableView
//
//  Created by Static Ga on 14-7-23.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTBaseView.h"

@implementation LTBaseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (id)loadFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)setViewWithModel:(id)model {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
