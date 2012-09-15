//
//  ViewController.m
//  Sqlite3Demo
//
//  Created by 郑 晋 on 12-8-29.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize states,datasource;
@synthesize albumList;

#pragma mark SetTableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //控制列表数量
    // Return the number of rows in the section.
    return 5;
}

//每个section显示的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"SetChildTitle";
}

//绑定数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_identifier = @"Cell";
    UITableViewCell *album_cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cell_identifier];
    if (album_cell == nil) {
        album_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell_identifier];
    }
    [[album_cell textLabel] setBackgroundColor:[UIColor clearColor]];
    [[album_cell detailTextLabel] setBackgroundColor:[UIColor clearColor]];
    
    album_cell.textLabel.text = [datasource objectAtIndex:indexPath.row];
    
    //Arrow 样式
    album_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return album_cell;
}

//单击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell selected");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id segue2=segue.destinationViewController;
    [segue2 setValue:@"sd" forKey:@"greetingText"];
    NSLog(@"点击设置");
}

//装配数据
-(void)setupArray{
    states = [[NSMutableDictionary alloc]init];
    
    [states setObject:@"Lansing" forKey:@"Michigan"];
    [states setObject:@"Sacremento" forKey:@"California"];
    [states setObject:@"Albany" forKey:@"New York"];
    [states setObject:@"Phoenix" forKey:@"Arizona"];
    [states setObject:@"Tulsa" forKey:@"Oklahoma"];
    
    datasource = [states allKeys];
}

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
    [self setupArray];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)viewDidUnload
{
    [self setAlbumList:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
