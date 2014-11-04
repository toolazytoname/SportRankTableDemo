//
//  LTWrapperGroupView.m
//  LinkTableView
//
//  Created by Static Ga on 14-7-24.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTWrapperGroupView.h"

@implementation LTWrapperGroupView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)fillUpGroupViewWithColumnsData:(LTColumns *)data {
    CGFloat centerX = 0;
    NSInteger columns = data.columnsData.count;
    GridViewWrapperInfo info;
    info.gridHeight = [data.gridHeight floatValue];
    
    CGFloat totalWidth = 0;
    @autoreleasepool {
        for (int i = 0; i < columns; ++i) {
            info.gridWidth = [[data.widths objectAtIndex:i] floatValue];
            totalWidth += info.gridWidth;
            
            LTGridWrapperView *wrapper = [[LTGridWrapperView alloc] initWithFrame:CGRectZero];
            wrapper.oddColor = self.oddColor;
            wrapper.evenColor = self.evenColor;
            wrapper.textColor = self.textColor;
            wrapper.textFont = self.textFont;
            wrapper.miniTextFontSize = self.miniTextFontSize;
            wrapper.backgroundColor = [UIColor clearColor];
            [wrapper fillUpWrapperWithGridsDataArray:[data.columnsData objectAtIndex:i] widthInfo:info];
            wrapper.left = centerX;
            [self addSubview:wrapper];
            
            centerX += wrapper.width;
        }
        
    }
    
    self.width = totalWidth;

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
