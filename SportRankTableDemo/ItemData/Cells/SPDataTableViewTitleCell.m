//
//  SPDataTableViewTitleCell.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/3.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPDataTableViewTitleCell.h"
@interface SPDataTableViewTitleCell()
@property (nonatomic,retain) IBOutlet UILabel *titleLabel;
@end

@implementation SPDataTableViewTitleCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier widths:(NSArray *)widths
{
    self = [self initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

-(void)updateCellWithItem:(id)item indexPath:(NSIndexPath *)indexPath param:(id)param keys:(NSArray *)keys width:(NSArray *)widths
{
    if (item && [item isKindOfClass:[NSString class]]) {
        self.titleLabel.text = item;
    }
}

+(CGFloat)getRowHeight
{
    return 25;
}

-(void)dealloc
{
    [_titleLabel release];
    [super dealloc];
}
@end
