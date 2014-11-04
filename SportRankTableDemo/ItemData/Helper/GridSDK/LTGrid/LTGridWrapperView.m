//
//  LTGridWrapperView.m
//  LinkTableView
//
//  Created by Static Ga on 14-7-23.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTGridWrapperView.h"
#import "LTGridView.h"

@implementation LTGridWrapperView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)fillUpWrapperWithGridsDataArray:(NSArray *)gridsData widthInfo:(GridViewWrapperInfo)info {
    CGFloat centerY = 0.25;
    CGFloat centerX = 0.25;
    
    NSInteger rows = gridsData.count;
    @autoreleasepool {
        for (int i = 0; i < rows; ++i) {
            LTGridView *gridView = [[LTGridView alloc] initWithFrame:CGRectMake(centerX, centerY, info.gridWidth - .5, info.gridHeight - .5) content:[gridsData objectAtIndex:i]];
            if (0 == i % 2) {
                gridView.backgroundColor = self.oddColor ? self.oddColor : [UIColor whiteColor];
            }else {
                gridView.backgroundColor = self.evenColor ? self.evenColor : [UIColor lightGrayColor];
            }
            gridView.contentLabel.textColor = self.textColor;
            gridView.contentLabel.font = self.textFont ? self.textFont : [UIFont systemFontOfSize:9];;
            gridView.contentLabel.minimumFontSize = self.miniTextFontSize;
            [gridView.contentLabel sizeToFit];
            gridView.contentLabel.centerX = gridView.width/2;
            gridView.contentLabel.centerY = gridView.height/2;
            
            [self addSubview:gridView];
            centerY += info.gridHeight;
        }
        
        self.width = info.gridWidth;
    }
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
