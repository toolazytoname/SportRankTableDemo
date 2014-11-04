//
//  LTGridHeaderView.m
//  LinkTableView
//
//  Created by Static Ga on 14-7-28.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTGridHeaderView.h"
#import "LinkTableView.h"
#import "LTFormCell.h"
#import "GGCommonMacros.h"

#define LT_TitleLabel_DefaultHeight 20.0f

@interface LTGridHeaderView ()<LinkTableViewDataSource, LinkTableViewDelegate>
@property (nonatomic, strong) LTForm *form;
@end

@implementation LTGridHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, LT_TitleLabel_DefaultHeight)];
        self.titleLabel.backgroundColor = RGBCOLOR(145, 6, 21);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:self.titleLabel];
    }
    return self;
}

+ (id)loadFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];

}
/*
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        label.text = @"热火";
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:label];
        
          }
    return self;
}
*/
- (void)setViewWithModel:(id)model {
    if (model) {
        if ([model isKindOfClass:[LTForm class]]) {
            self.form = model;
            self.titleLabel.text = self.form.title;
            if (self.linkTableView) {
                [self.linkTableView removeFromSuperview];
            }
            self.linkTableView = [[LinkTableView alloc] initWithFrame:CGRectMake(0, self.titleLabel.bottom, 320, self.height - self.titleLabel.height)];
            self.linkTableView.delegate = self;
            self.linkTableView.dataSource = self;
            self.linkTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//            self.linkTableView.textColor = [UIColor blackColor];
            self.linkTableView.textColor = [UIColor grayColor];
            self.linkTableView.separatorColor = RGBCOLOR(218, 218, 218);
            self.linkTableView.oddColor = RGBCOLOR(218, 218, 218);
            self.linkTableView.evenColor = RGBCOLOR(218, 218, 218);
            self.linkTableView.backgroundColor = [UIColor clearColor];
            self.linkTableView.scrollEnabled = NO;
//            self.linkTableView.textFont = [UIFont systemFontOfSize:12];
            self.linkTableView.textFont = [UIFont boldSystemFontOfSize:12];
            self.linkTableView.miniTextFontSize = 6.0;
            [self addSubview:self.linkTableView];
    }
    }
}

- (NSUInteger)numberOfSectionsInLinkTableView:(LinkTableView*)linkTableView {
    return self.form.sections.count;
}

- (LTColumns *)columnsDataSourceForSection:(NSInteger)section {
    return [self.form.columns objectAtIndex:section];
}

- (LTColumns *)columnsDataSourceForHeaderInSection:(NSInteger)section {
    return [self.form.sections objectAtIndex:section];
}

#pragma mark - linkDelegate

- (void)linkTableView:(LinkTableView *)linkTableView scrolledToOffset:(CGPoint)contentOffset {
    if (self.idx) {
        
        
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
