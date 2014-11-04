//
//  SPItemListViewController.m
//  SportRankTableDemo
//
//  Created by SINA on 14/11/4.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPItemListViewController.h"
#import "SPMenuItem.h"
#import "SPItemDataViewController.h"

@interface SPItemListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSArray *dataList;
@end

@implementation SPItemListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.dataList = [NSString ]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.dataList.count;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idenfifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"idenfifier"];
    }
    SPMenuItem *item = [self.dataList objectAtIndex:indexPath.row];
//    cell.textLabel.text = textLabel
    cell.textLabel.text = item.itemName;
    cell.detailTextLabel.text = item.itemName;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SPMenuItem *item = [self.dataList objectAtIndex:indexPath.row];

    if (item) {
        SPItemDataViewController *itemDataViewController = [[SPItemDataViewController alloc] initWithNibName:@"SPItemDataViewController" bundle:nil];
        itemDataViewController.viewControllerParam = item;
        [self presentViewController:itemDataViewController animated:YES completion:^{
            
        }];
    }
}


-(NSArray *)dataList
{
    SPMenuItem *item1 = [[SPMenuItem alloc] init];
    item1.itemName = @"欧冠";
    item1.itemID = @"10";
    item1.itemDataFrom = @"opta";
    
    SPMenuItem *item2 = [[SPMenuItem alloc] init];
    item1.itemName = @"英超";
    item2.itemID = @"4";
    item2.itemDataFrom = @"opta";
    
    SPMenuItem *item3 = [[SPMenuItem alloc] init];
    item1.itemName = @"世界杯";
    item3.itemID = @"108";
    item3.itemDataFrom = @"opta";
    
    SPMenuItem *item4 = [[SPMenuItem alloc] init];
    item1.itemName = @"CBA";
    item4.itemID = @"cba";
    item4.itemDataFrom = @"cba";
    
    NSArray *itemArray = [NSArray arrayWithObjects:item1,item2,item3,item4,nil];
    return itemArray;
}

@end
