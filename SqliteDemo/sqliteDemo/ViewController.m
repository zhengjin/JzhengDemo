//
//  ViewController.m
//  sqliteDemo
//
//  Created by 郑 晋 on 12-9-15.
//  Copyright (c) 2012年 点睛工作室. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"
#import "PeopleDetailController.h"
#import "DBHelper.h"

@implementation ViewController

@synthesize peopleList;

@synthesize PeopleTableView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //控制列表数量
    // Return the number of rows in the section.
    return [self.peopleList count];
}

//绑定数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_identifier = @"Cell";
    UITableViewCell *album_cell = 
     (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cell_identifier];
    if (album_cell == nil) 
    {
        album_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell_identifier];
    }
    [[album_cell textLabel] setBackgroundColor:[UIColor clearColor]];
    [[album_cell detailTextLabel] setBackgroundColor:[UIColor clearColor]];
    
    Player *player=[self.peopleList objectAtIndex:indexPath.row];
    album_cell.textLabel.text = player.name;
    
    //Arrow 样式
    album_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return album_cell;
}

#pragma mark - View lifecycle

- (void)BindingDataSource
{
    peopleList = [NSMutableArray arrayWithCapacity:20];
    
    Player *player = [[Player alloc] init];
	player.name = @"xxd";
	player.game = @"游泳";
	player.rating = 5;
	[peopleList addObject:player];
    
	player = [[Player alloc] init];
	player.name = @"张三";
	player.game = @"足球";
	player.rating = 4;
	[peopleList addObject:player];
    
	player = [[Player alloc] init];
	player.name = @"李四";
	player.game = @"篮球";
	player.rating = 3;
	[peopleList addObject:player];
    
    [self BindingDataFromSqlite];
    
}

- (void)BindingDataFromSqlite
{
    DBHelper *dbHelper = [DBHelper newInstance];
    
    NSString *sql=@"sample";
    NSArray *arrObj=[dbHelper selectFrom:sql];
    [[DBHelper newInstance] closeDatabase];
    
    for (NSArray *item in arrObj) {
        Player *player = [[Player alloc] init];
        player.name=[item objectAtIndex:1];
        [peopleList addObject:player];
    }
}

- (void)viewDidLoad
{
    [self BindingDataSource];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setPeopleTableView:nil];
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"AddPlayer"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        PeopleDetailController *playerDetailsViewController =
        [[navigationController viewControllers] objectAtIndex:0];
        playerDetailsViewController.delegate = (id)self;
    }
}

#pragma mark - PlayerDetailsViewControllerDelegate

- (void)playerDetailsViewControllerDidCancel:(PeopleDetailController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)playerDetailsViewController:(PeopleDetailController *)controller didAddPlayer:(Player *)player
{
	if(player.name.length!=0)
    {
        [self.peopleList addObject:player];
        
        NSIndexPath* indexPath = 
            [NSIndexPath indexPathForRow:[self.peopleList count] - 1 inSection:0];
        
        [self.PeopleTableView insertRowsAtIndexPaths:
            [NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
