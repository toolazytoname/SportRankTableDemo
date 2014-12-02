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
    cell.textLabel.text = item.itemName;
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
    item2.itemName = @"英超";
    item2.itemID = @"4";
    item2.itemDataFrom = @"opta";
    
    SPMenuItem *item3 = [[SPMenuItem alloc] init];
    item3.itemName = @"世界杯";
    item3.itemID = @"108";
    item3.itemDataFrom = @"opta";
    
    SPMenuItem *item4 = [[SPMenuItem alloc] init];
    item4.itemName = @"CBA";
    item4.itemID = @"cba";
    item4.itemDataFrom = @"cba";
    
    SPMenuItem *item5 = [[SPMenuItem alloc] init];
    item5.itemName = @"中超";
    item5.itemID = @"213";
    item5.itemDataFrom = @"opta";
    
    SPMenuItem *item6 = [[SPMenuItem alloc] init];
    item6.itemName = @"网球";
    item6.itemID = @"tennis";
    item6.itemDataFrom = @"bet007_tennis";
    
    SPMenuItem *item7 = [[SPMenuItem alloc] init];
    item7.itemName = @"亚冠";
    item7.itemID = @"328";
    item7.itemDataFrom = @"opta";

    
     
    
    
    
    NSArray *itemArray = [NSArray arrayWithObjects:item1,item2,item3,item4,item5,item6,item7,nil];
    return itemArray;
}

@end
