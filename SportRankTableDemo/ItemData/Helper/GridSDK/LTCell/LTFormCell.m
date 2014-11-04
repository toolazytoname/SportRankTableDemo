//
//  LTFormCell.m
//  LinkTableView
//
//  Created by Static Ga on 14-7-28.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LTFormCell.h"
#import "LinkTableView.h"
#import "LTFormTool.h"
#import "LTGridHeaderView.h"
#import "GGCommonMacros.h"

#define InvalidSection -1

@interface LTFormCell ()<LinkTableViewDataSource, LinkTableViewDelegate>
@property (nonatomic, strong) LTForm *form;
@end

@implementation LTFormCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.section = InvalidSection;
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
- (void)awakeFromNib {
    [super awakeFromNib];
 

}

- (void)setViewWithModel:(id)model {
    if (model) {
            if ([model isKindOfClass:[LTForm class]]) {
                
                if ([self.form isEqual:model]) {
                        return;
                }
                
                self.form = model;
                if (self.linkTableView) {
                    [self.linkTableView removeFromSuperview];
                }
                    self.linkTableView = [[LinkTableView alloc] initWithFrame:CGRectMake(0,0, self.width, [LTFormTool calculateFormHeightWithData:self.form])];
                    self.linkTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                    self.linkTableView.textColor = [UIColor blackColor];
                    self.linkTableView.separatorColor = RGBCOLOR(193, 193, 193);
                    self.linkTableView.oddColor = [UIColor whiteColor];
                    self.linkTableView.evenColor = RGBCOLOR(239, 239, 239);
                    self.linkTableView.textFont = [UIFont systemFontOfSize:12];
                    self.linkTableView.miniTextFontSize = 6.0;
                    self.linkTableView.delegate = self;
                    self.linkTableView.dataSource = self;
                    self.linkTableView.backgroundColor = [UIColor clearColor];
                    [self.contentView addSubview:self.linkTableView];
       
            }
    }
}
#pragma mark - linkDataSource

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
    if (self.section != InvalidSection) {
        
        LTGridHeaderView *headerView ;
        
        /*
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")) {
            headerView = (LTGridHeaderView *)[self.superTableView headerViewForSection:self.section];
        }else {
            headerView = (LTGridHeaderView *)[self.superTableView viewWithTag:(1000 + self.section)];
        }
        */
        
        headerView = (LTGridHeaderView *)[self.superTableView viewWithTag:(1000 + self.section)];
        [headerView.linkTableView scrollTo:CGPointMake(contentOffset.y, contentOffset.x) animated:NO];
    }
}

@end
