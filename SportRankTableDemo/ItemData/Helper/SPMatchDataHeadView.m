//
//  SPMatchDataHeadView.m
//  Sports
//
//  Created by SINA on 14-8-6.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//

#import "SPMatchDataHeadView.h"

@implementation SPMatchDataHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)dealloc
{
    [_sectionTitle release];
    [super dealloc];
}
@end
