//
//  SPItemDataTitlesHeadView.h
//  SportRankTableDemo
//
//  Created by SINA on 14/10/31.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPItemDataTitlesHeadView : UIView
@property (strong, nonatomic) IBOutlet UIView *labelContainer;
@property (strong, nonatomic) IBOutlet UILabel *mainTitle;

-(id)initWithTitles:(NSArray *)titles title:(NSString *)title widths:(NSArray *)widths;
@end
