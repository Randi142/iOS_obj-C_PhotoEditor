//
//  DetailViewController.m
//  Photo Editor
//
//  Created by Anson Tam on 13/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    _TitleLabel.text = _DetailModal[0];
    _ImageView.image = [UIImage imageNamed:_DetailModal[1]];
    NSLog(@"The Array of DetailModal: %@, %@", _DetailModal[0], _DetailModal[1]);
    self.navigationItem.title = _DetailModal[0];
    //backgound
    UIImage *image = [UIImage imageNamed: @"tvbg.png"];
    UIImageView *backImage = [[UIImageView alloc] initWithImage: image];
    [self.view addSubview: backImage];
    [self.view sendSubviewToBack: backImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)Play:(id)sender {
    
    
    NSString *movieName = _DetailModal[2];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:movieName ofType:@"mov"];
    NSURL *videoURL = [NSURL fileURLWithPath:filePath];
    self.moviePlayerController = [[MPMoviePlayerController alloc]initWithContentURL:videoURL];
    self.moviePlayerController.controlStyle = MPMovieControlStyleDefault;
    self.moviePlayerController.shouldAutoplay = YES;
    [self.view addSubview:self.moviePlayerController.view];
    [self.moviePlayerController setFullscreen:YES animated:YES];

    
}




@end
