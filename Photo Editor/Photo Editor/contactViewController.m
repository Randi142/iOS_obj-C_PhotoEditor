//
//  contactViewController.m
//  Photo Editor
//
//  Created by Anson Tam on 13/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import "contactViewController.h"
#import "AboutUsViewController.h"
@interface contactViewController ()

@end

@implementation contactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.gmail.com/"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
