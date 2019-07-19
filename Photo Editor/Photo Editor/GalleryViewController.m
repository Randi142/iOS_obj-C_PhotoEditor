//
//  GalleryViewController.m
//  Photo Editor
//
//  Created by Anson Tam on 13/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import "GalleryViewController.h"

@interface GalleryViewController (){
    int imageCount;
}

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_imageView setImage:[UIImage imageNamed:@"example1.png"] ];
    
    imageCount = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)imageMove:(id)sender {
    
    if (imageCount ==0 ){
        [_imageView setImage:[UIImage imageNamed:@"example2.png"] ];
        imageCount++;
    }
    else if (imageCount ==1){
        [_imageView setImage:[UIImage imageNamed:@"example3.png"] ];
        imageCount++;
    }
    else if (imageCount ==2){
        [_imageView setImage:[UIImage imageNamed:@"example1.png"] ];
        imageCount = 0;
    }
    
}
@end
