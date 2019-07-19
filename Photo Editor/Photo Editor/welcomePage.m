//
//  welcomePage.m
//  Photo Editor
//
//  Created by Randi on 7/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import "welcomePage.h"

@interface welcomePage ()

@end

@implementation welcomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewimg.image = [UIImage imageNamed:_strimg];
    self.startButton.layer.cornerRadius = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
