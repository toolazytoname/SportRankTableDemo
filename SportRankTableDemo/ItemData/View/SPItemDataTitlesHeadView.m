//
//  SPItemDataTitlesHeadView.m
//  SportRankTableDemo
//
//  Created by SINA on 14/10/31.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPItemDataTitlesHeadView.h"
#import "NSArray+Safe.h"

@implementation SPItemDataTitlesHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
    }
    return self;
}

-(id)initWithTitles:(NSArray *)titles title:(NSString *)title widths:(NSArray *)widths
{
    self = [self initWithFrame:CGRectZero];
    self.mainTitle.text = title;
    for (NSInteger i = 0; i<widths.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [titles safeObjectAtIndex:i];
        label.adjustsFontSizeToFitWidth = YES;
        label.minimumScaleFactor = 0.7;
        NSNumber *currentFloatNumber = [widths safeObjectAtIndex:i];
        float x = [self getXValue:widths index:i];
        label.frame = CGRectMake(x, 0, currentFloatNumber.floatValue, 25);
        [self.labelContainer addSubview:label];
    }
    return self;
}


-(float)getXValue:(NSArray *)widths index:(NSInteger)index
{
    float result = 0;
    for (NSInteger i= 0 ;i<index ;i++) {
        NSNumber *currentFloatNumber = [widths safeObjectAtIndex:i];
        result+=currentFloatNumber.floatValue + 0.5;
    }
    return result;
}

@end
