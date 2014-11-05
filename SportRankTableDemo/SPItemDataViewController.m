//
//  ItemDataViewController.m
//  SportRankTableDemo
//
//  Created by SINA on 14/10/29.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPItemDataViewController.h"
#import "SPMenuItem.h"
//#import "SPMatchDataBaseSectionController.h"

typedef enum {
    SPItemDataTypeOther = 0,
    SPItemDataTypeNBA = 1,
    SPItemDataTypeCBA = 2,
    SPItemDataTypeFootball = 3,//英超
    SPItemDataTypeFootballGroup = 4, //欧冠, 世界杯，亚冠，积分榜分组
    SPItemDataTypeTennis = 5
//    WordCup
}SPItemDataType;


@interface SPItemDataViewController ()

@end

@implementation SPItemDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    SPItemDataType status = [self getType:self.viewControllerParam];
    [self requestRankWithStatus:status];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/**
 *  根据传入参数判断数据格式类型
 *
 *  @param viewControllerParam <#viewControllerParam description#>
 *
 *  @return <#return value description#>
 */
-(SPItemDataType )getType:(id)viewControllerParam
{
    SPItemDataType status = SPItemDataTypeOther;
    SPMenuItem *menuItem;
    if (viewControllerParam && [viewControllerParam isKindOfClass:[SPMenuItem class]]) {
        menuItem = viewControllerParam;
    }
    if (menuItem) {
        if ([menuItem.itemID isEqualToString:@"nba"]) {
            status = SPItemDataTypeNBA;
        }
        else if ([menuItem.itemID isEqualToString:@"cba"]) {
            status = SPItemDataTypeCBA;
        }
        else if ([menuItem.itemID isEqualToString:@"108"])//世界杯
        {
            status = SPItemDataTypeFootballGroup;
        }
        else if([menuItem.itemID isEqualToString:@"10"])//欧冠
        {
            status = SPItemDataTypeFootballGroup;
        }
        else if([menuItem.itemID isEqualToString:@"213"])//中超
        {
            status = SPItemDataTypeFootball;
        }
        else if ([menuItem.itemID isEqualToString:@"328"])//亚冠
        {
            status = SPItemDataTypeFootballGroup;
        }
        else if([menuItem.itemID isEqualToString:@"4"])//英超
        {
            status = SPItemDataTypeFootball;
        }
        else if([menuItem.itemID isEqualToString:@"2"])//西甲
        {
            status = SPItemDataTypeFootball;
        }
        else if([menuItem.itemID isEqualToString:@"1"])//意甲
        {
            status = SPItemDataTypeFootball;
        }
        else if([menuItem.itemID isEqualToString:@"3"])//德甲
        {
            status = SPItemDataTypeFootball;
        }
        else if([menuItem.itemID isEqualToString:@"5"])//法甲
        {
            status = SPItemDataTypeFootball;
        }
        else if ([menuItem.itemID isEqualToString:@"tennis"])//网球
        {
            status = SPItemDataTypeTennis;
        }
    }
    return status;

}

/**
 根据不同类型，
 1.选择不同的配置文件，
 2.生成section controller 实例
 3.传入参数
 4.设置委托
 5.请求数据
 */
-(void)requestRankWithStatus:(SPItemDataType)status
{
    NSString* fileName = nil;
    //    选择不同的配置文件
    switch (status) {
        case SPItemDataTypeNBA:
            fileName = @"SPItemDataTypeNBA";
            break;
        case SPItemDataTypeCBA:
            fileName = @"SPItemDataTypeCBA";
            break;
        case SPItemDataTypeFootball:
            fileName = @"SPItemDataTypeFootball";
            break;
        case SPItemDataTypeFootballGroup:
            fileName = @"SPItemDataTypeFootballGroup";
            break;
        case SPItemDataTypeTennis:
            fileName = @"SPItemDataTypeTennis";
            break;
        case SPItemDataTypeOther:
            NSLog(@"排行榜类型为别的类型 SPItemDataTypeOther");
            return;
            break;
        default:
            NSLog(@"排行榜类型为别的类型 default ");
            return;
            break;
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    self.sections = [NSArray arrayWithContentsOfFile:path];
    self.instances = [NSMutableArray array];
    for (NSDictionary* section in self.sections) {
        NSString* className = [section objectForKey:@"class"];
        Class class = NSClassFromString(className);
        SPBaseSectionController *instance = [[class alloc]init];
        if (instance) {
            [self.instances addObject:instance];
            //传入参数
            if ([instance respondsToSelector:@selector(setParam:)]) {
                [instance performSelector:@selector(setParam:) withObject:self.viewControllerParam];
            }
            //设置委托
            if ([instance respondsToSelector:@selector(setBaseSectionDelegate:)]) {
                [instance performSelector:@selector(setBaseSectionDelegate:) withObject:self];
            }
            //请求数据
            if ([instance respondsToSelector:@selector(requestData)]) {
                [instance performSelector:@selector(requestData)];
            }
        }
    }
}


-(void)dataReadyOfController:(SPBaseSectionController *)controller
{
    [self.dataTableView reloadData];
}
/**
 *  删除转圈动画
 *
 *  @param controller sender
 */
-(void)removeHDOfController:(SPBaseSectionController *)controller
{
//    [self removeHUD];
}
-(SPBaseSectionController *)instanceFromSection:(NSInteger)section
{
  
    SPBaseSectionController *instance = [self.instances safeObjectAtIndex:section];
    return instance;
}



-(IBAction)hideAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
