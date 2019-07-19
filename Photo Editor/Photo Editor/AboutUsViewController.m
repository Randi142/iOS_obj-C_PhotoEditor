//
//  AboutUsViewController.m
//  Photo Editor
//
//  Created by Anson Tam on 13/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import "AboutUsViewController.h"
#define IMAGE_COUNT 7
#import "AppDelegate.h"

@interface AboutUsViewController (){
    AppDelegate* appGlobal;
}


@end

@implementation AboutUsViewController
@synthesize animationView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view.
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:IMAGE_COUNT];
    
    int i;
    for (i=1; i<=IMAGE_COUNT; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"s%d.png", i]]];
        NSLog(@"s%d.png", i);
    }
    
    animationView.animationImages = [NSArray arrayWithArray:images];
    animationView.animationDuration = 1;
    
    //*** wallpaper control***//
    if([appGlobal.globalWallpaper isEqualToString:@"Background1.jpg"] || [appGlobal.globalWallpaper isEqualToString:@"Background2.jpg"] || [appGlobal.globalWallpaper isEqualToString:@"Background3.jpg"])
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalWallpaper]];
    
    if([appGlobal.globalWallpaper isEqualToString:@"black"])
        self.view.backgroundColor = [UIColor blackColor];
    
    if([appGlobal.globalWallpaper isEqualToString:@"white"])
        self.view.backgroundColor = [UIColor whiteColor];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggle:(id)sender {
    if ([sender isOn]) {
        [animationView startAnimating];
    }
    else{
        [animationView stopAnimating];
    }

}


@end
