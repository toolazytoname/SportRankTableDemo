//
//  SPBaseDataViewController.m
//  SportRankTableDemo
//
//  Created by SINA on 14/10/30.
//  Copyright (c) 2014年 Sport. All rights reserved.
//

#import "SPBaseDataViewController.h"
#import "SPBaseSectionController.h"



@interface SPBaseDataViewController ()

@end

@implementation SPBaseDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark DataListView Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger number;
    SPBaseSectionController *instance = [self.instances safeObjectAtIndex:0];
    if (instance && [instance respondsToSelector:@selector(numberOfSectionsInTableView:controller:)]) {
        number = [instance numberOfSectionsInTableView:tableView controller:self];
    }
    else
    {
        number = [self.sections count];
    }
    return number;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    float height = 22.0;
    SPBaseSectionController *instance = [self instanceFromSection:section];
    if (instance && [instance respondsToSelector:@selector(tableView:heightForHeaderInSection:controller:)]) {
        height = [instance tableView:tableView heightForHeaderInSection:section controller:self];
    }
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SPBaseSectionController *instance = [self instanceFromSection:section];
    if (instance && [instance respondsToSelector:@selector(tableView:viewForHeaderInSection:controller:)]) {
        return  [instance tableView:tableView viewForHeaderInSection:section controller:self];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height = 0.0;
    SPBaseSectionController *instance = [self instanceFromSection:indexPath.section];
    if (instance && [instance respondsToSelector:@selector(tableView:heightForRowAtIndexPath:controller:)]) {
        height = [instance tableView:tableView heightForRowAtIndexPath:indexPath controller:self];
    }
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SPBaseSectionController *instance = [self instanceFromSection:section];
    NSInteger count = 0;
    if (instance && [instance respondsToSelector:@selector(tableView:numberOfRowsInSection:controller:)]) {
        count = [instance tableView:tableView numberOfRowsInSection:section controller:self];
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SPBaseSectionController *instance = [self instanceFromSection:indexPath.section];
    
    if (instance && [instance respondsToSelector:@selector(tableView:cellForRowAtIndexPath:controller:)]) {
        return [instance tableView:tableView cellForRowAtIndexPath:indexPath controller:self];
    }
    return nil;
}




#pragma mark -  Tool
-(NSString*)classNameAtsection:(NSInteger)section
{
    NSDictionary* sectionDict = [self.sections safeObjectAtIndex:section];
    NSString* className = [sectionDict objectForKeyNotNull:@"class"];
    NSLog(@"%@",className);
    return className;
}

-(NSString *)cellNameAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellName = @"";
    NSInteger section = indexPath.section;
    NSDictionary* sectionDict = [self.sections safeObjectAtIndex:section];
    NSDictionary* cellNameDic = [sectionDict objectForKeyNotNull:@"cells"];
    SPBaseSectionController *instance = [self.instances safeObjectAtIndex:indexPath.section];
    id item = [instance.dataList safeObjectAtIndex:indexPath.row];
    //如果返回的数据 dataList 中的数据类型为NSString,那么则用titleCell
    if ([item isKindOfClass:[NSString class]]) {
        cellName = [cellNameDic objectForKeyNotNull:@"titleCell"];
    }
    else
    {
        cellName = [cellNameDic objectForKeyNotNull:@"cell"];
    }
    return cellName;
}

-(NSString*)titleNameAtSection:(NSInteger)section
{
    NSDictionary* sectionDict = [self.sections safeObjectAtIndex:section];
    NSString* title = [sectionDict objectForKeyNotNull:@"title"];
    return title;
}

-(NSArray *)keysAtSection:(NSInteger)section
{
    NSDictionary* sectionDict = [self.sections safeObjectAtIndex:section];
    NSArray *widths = [sectionDict objectForKeyNotNull:@"keys"];
    return widths;
}

-(NSArray *)widthsAtSection:(NSInteger)section
{
    NSDictionary* sectionDict = [self.sections safeObjectAtIndex:section];
    NSArray *keys = [sectionDict objectForKeyNotNull:@"widths"];
    return keys;
}

-(NSArray *)titlesAtSection:(NSInteger)section
{
    NSDictionary* sectionDict = [self.sections safeObjectAtIndex:section];
    NSArray *titles = [sectionDict objectForKeyNotNull:@"titles"];
    return titles;
}

-(void)dataReadyOfController:(SPBaseSectionController *)controller
{
}

-(SPBaseSectionController *)instanceFromSection:(NSInteger)section
{
    SPBaseSectionController *instance = [self.instances safeObjectAtIndex:section];
    return instance;
}





@end
