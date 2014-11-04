//
//  LTGridView.m
//  LinkTableView
//
//  Created by Static Ga on 14-7-23.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTGridView.h"

@interface LTGridView ()
@end

@implementation LTGridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame content:(NSString *)tmpContent {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentLabel = [[UILabel alloc] initWithFrame:frame];
        if ([tmpContent isKindOfClass:[NSString class]]) {
            self.contentLabel.text = tmpContent;
        }else if ([tmpContent isKindOfClass:[NSNumber class]]){
            self.contentLabel.text = [NSString stringWithFormat:@"%@",[(NSNumber *)tmpContent stringValue]];
        }
        self.contentLabel.backgroundColor = [UIColor clearColor];
        self.contentLabel.textColor = [UIColor blackColor];
        self.contentLabel.textAlignment = NSTextAlignmentCenter;
        self.contentLabel.frame = self.bounds;
        self.contentLabel.font = [UIFont systemFontOfSize:9];
        [self.contentLabel sizeToFit];
        self.contentLabel.centerX = frame.size.width/2;
        self.contentLabel.centerY = frame.size.height/2;
        self.contentLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.contentLabel];
        
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

@end
