//
//  SPDataTableViewCell.m
//  SportRankTableDemo
//
//  Created by SINA on 14/10/30.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPDataTableViewCell.h"
#define IS_OBJECT(T) _Generic( (T), id: YES, default: NO)

@implementation SPDataTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier widths:(NSArray *)widths
{
    self = [self initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addlabels:widths];
    }
    return self;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] objectAtIndex:0];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)updateCellWithItem:(id)item indexPath:(NSIndexPath *)indexPath param:(id)param keys:(NSArray *)keys width:(NSArray *)widths
{
    if (item) {
        for (NSInteger i = 0;i < keys.count ;i++) {
            UILabel *label = (UILabel *)[self.contentView viewWithTag:(baseTagNum+i)];
            NSString *selecterName = [keys safeObjectAtIndex:i];
            SEL selector = NSSelectorFromString(selecterName);
            if ([item respondsToSelector:selector]) {
                bool isobject = IS_OBJECT([item performSelector:selector]);
                if (isobject) {
                    label.text = [NSString stringWithFormat:@"%@",[item performSelector:selector]];
                }
                else
                {
                    label.text = [NSString stringWithFormat:@"%f",[[item performSelector:selector] doubleValue]];
                }
            }
        }
        [self setIsDarkRow:(indexPath.row %2 != 0)];
    }
}
//根据widths ，增加label
-(void)addlabels:(NSArray *)widths
{
    if (![self isHaveSubLabel]) {
        for (NSInteger i = 0; i<widths.count; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.tag = baseTagNum+i;
            label.font = [UIFont systemFontOfSize:12];
            label.textAlignment = NSTextAlignmentCenter;
            [self.contentView addSubview:label];
            [label release];
        }
    }
    for (NSInteger i = 0; i<widths.count; i++) {
        UILabel *label = (UILabel *)[self.contentView viewWithTag:(baseTagNum+i)];
        NSNumber *currentFloatNumber = [widths safeObjectAtIndex:i];
        float x = [self getXValue:widths index:i];
        label.frame = CGRectMake(x, 0, currentFloatNumber.floatValue, 25);
    }
}

//判断cell的contentView下的子控件是否存在label
-(BOOL)isHaveSubLabel
{
    BOOL result = NO;
    NSArray *subViews = self.contentView.subviews;
    for (UIView *subView in subViews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            result = YES;
            break;
        }
    }
    return result;
    
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


+(CGFloat)getRowHeight
{
    return 25;
}
-(void)setIsDarkRow:(BOOL)isDarkRow
{
    if (isDarkRow) {
        for (UIView* view in [self.contentView subviews]) {
            if ([view isKindOfClass:[UILabel class]]) {
                UILabel* label = (UILabel*)view;
                label.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1.0];
            }
        }
    }
    else
    {
        for (UIView* view in [self.contentView subviews]) {
            if ([view isKindOfClass:[UILabel class]]) {
                UILabel* label = (UILabel*)view;
                label.backgroundColor = [UIColor colorWithWhite:1 alpha:1.0];;
            }
        }
    }
}

@end
