//
//  TableViewController.m
//  Photo Editor
//
//  Created by Anson Tam on 13/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "DetailViewController.h"


@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //file
    _Titles = @[@"Filter", @"Rotate", @"Merge",@"Resize"];
    _Images = @[@"filtertv.png", @"rotatetv.png", @"mergetv.png",@"resizetv.png"];
    _Movies = @[@"filter", @"rotate", @"merge",@"resize"];
    //Background
    UIImage *image = [UIImage imageNamed: @"tvbg.png"];
    UIImageView *backImage = [[UIImageView alloc] initWithImage: image];
    self.tableView.backgroundView = backImage;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _Titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    NSInteger row = [indexPath row];
    tableView.rowHeight = 200;
    cell.TitleLabel.text = _Titles[row];
    cell.ThumbImage.image = [UIImage imageNamed:_Images[row]];
    NSLog(@"Hi %@",_Titles[row]);
    //cell background
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [cell setBackgroundView:bgView];
    ((UIImageView *)cell.backgroundView).image = [UIImage imageNamed:@"tvcbg.png"];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
        
        NSLog(@"ShowDetails");
        
        DetailViewController *detailViewController = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        NSInteger row = [myIndexPath row];
        
        NSLog(@"hi %@",_Titles[row]);
        
       
        
        detailViewController.DetailModal = @[_Titles[row], _Images[row], _Movies[row]];

        
    }
}



@end
