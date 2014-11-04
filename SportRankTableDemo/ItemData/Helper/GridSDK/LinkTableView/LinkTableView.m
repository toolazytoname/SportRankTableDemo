//
//  LinkTableView.m
//  LinkTableView
//
//  Created by Static Ga on 14-7-23.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "LinkTableView.h"
#import "EasyTableView.h"
#import "LTGridView.h"
#import "LTGridWrapperView.h"
#import "LTWrapperGroupView.h"

#define DEFAULT_CELL_WIDTH 0 //默认列宽
#define DEFAULT_GRID_HEIGHT 30.0f //默认单元格高度
#define DEFAULT_SECTION_COUNT 1 //默认section数
#define DEFAULT_COLUMNS 0 //默认列数
#define DEFAULT_CELL_WIDTH 0
#define CONSTANT_CELL_NUM 1

//#define Test

@interface LinkTableView ()<EasyTableViewDelegate>
@property (nonatomic, strong) EasyTableView *horizontalView;
@end

@implementation LinkTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.horizontalView = [[EasyTableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) numberOfColumns:5 ofWidth:100];
        self.horizontalView.delegate = self;
        self.horizontalView.tableView.backgroundColor = [UIColor clearColor];
        self.horizontalView.tableView.separatorColor		= [UIColor darkGrayColor];

        self.horizontalView.autoresizingMask				= UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        self.horizontalView.tableView.bounces = NO;
        [self addSubview:self.horizontalView];
        self.separatorColor = [UIColor grayColor];
    }
    return self;
}

#pragma mark - public

- (void)setSeparatorStyle:(UITableViewCellSeparatorStyle)separatorStyle {
    self.horizontalView.tableView.separatorStyle = separatorStyle;
}

- (void)setScrollEnabled:(BOOL)scrollEnabled {
    self.horizontalView.tableView.scrollEnabled = scrollEnabled;
}

- (void)resetSize:(CGSize)size {
    [self.horizontalView resetSize:size];
}

- (void)reloadData {
    [self.horizontalView reloadData];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.horizontalView.height = 300;
    });
     
}

- (void)scrollTo:(CGPoint)offset animated:(BOOL)animated {
    [self.horizontalView.tableView setContentOffset:offset animated:animated];
}

- (void)enableBounces {
    self.horizontalView.tableView.bounces = YES;
}

#pragma mark -
#pragma mark EasyTableViewDelegate



- (void)easyTableView:(EasyTableView *)easyTableView scrolledToOffset:(CGPoint)contentOffset {
    if (self.delegate && [self.delegate respondsToSelector:@selector(linkTableView:scrolledToOffset:)]) {
        [self.delegate linkTableView:self scrolledToOffset:contentOffset];
    }
}

- (UIView *)easyTableView:(EasyTableView *)easyTableView viewForRect:(CGRect)rect {
    CGRect viewRect		= CGRectMake(0, 0, rect.size.width , rect.size.height);
    LTWrapperGroupView *groupView = [[LTWrapperGroupView alloc] initWithFrame:viewRect];
    groupView.backgroundColor = self.separatorColor ;
    groupView.oddColor = self.oddColor;
    groupView.evenColor = self.evenColor;
    groupView.textColor = self.textColor;
    groupView.textFont = self.textFont;
    groupView.miniTextFontSize = self.miniTextFontSize;
    return groupView;
}

- (void)easyTableView:(EasyTableView *)easyTableView setDataForView:(UIView *)view forIndexPath:(NSIndexPath *)indexPath {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(columnsDataSourceForSection:)]) {
        LTWrapperGroupView *groupView = (LTWrapperGroupView *)view;
        [groupView removeAllSubviews];
        
        LTColumns *columns = [self.dataSource columnsDataSourceForSection:indexPath.section];
        [groupView fillUpGroupViewWithColumnsData:columns];
    }

}

// Optional delegate to track the selection of a particular cell

//- (void)easyTableView:(EasyTableView *)easyTableView selectedView:(UIView *)selectedView atIndexPath:(NSIndexPath *)indexPath deselectedView:(UIView *)deselectedView {
//}

- (NSUInteger)numberOfSectionsInEasyTableView:(EasyTableView*)easyTableView{
   
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfSectionsInLinkTableView:)]) {
        return [self.dataSource numberOfSectionsInLinkTableView:self];
    }
    return DEFAULT_SECTION_COUNT;
}

-(NSUInteger)numberOfCellsForEasyTableView:(EasyTableView *)view inSection:(NSInteger)section {
    //Forever 1
    return CONSTANT_CELL_NUM;
}

- (UIView *)easyTableView:(EasyTableView*)easyTableView viewForHeaderInSection:(NSInteger)section {

    if (self.dataSource && [self.dataSource respondsToSelector:@selector(columnsDataSourceForHeaderInSection:)]) {
        LTColumns *columns = [self.dataSource columnsDataSourceForHeaderInSection:section];
        LTWrapperGroupView *groupView = [[LTWrapperGroupView alloc] initWithFrame:CGRectZero];
        groupView.backgroundColor = self.separatorColor ;
        groupView.oddColor = self.oddColor;
        groupView.evenColor = self.evenColor;
        groupView.textColor = self.textColor;
        groupView.textFont = self.textFont;
        groupView.miniTextFontSize = self.miniTextFontSize;
        [groupView fillUpGroupViewWithColumnsData:columns];
        return groupView;
    }
    
    return nil;
    
}

- (CGFloat)easyTableView:(EasyTableView *)easyTableView heightOrWidthForCellAtIndexPath:(NSIndexPath *)indexPath {

    if (self.dataSource && [self.dataSource respondsToSelector:@selector(columnsDataSourceForSection:)]) {
        LTColumns *columns = [self.dataSource columnsDataSourceForSection:indexPath.section];
        CGFloat headerWidth ;
        for (NSString *widthStr in columns.widths) {
            headerWidth += [widthStr floatValue];
        }
        return headerWidth;
    }
    return DEFAULT_CELL_WIDTH;

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
