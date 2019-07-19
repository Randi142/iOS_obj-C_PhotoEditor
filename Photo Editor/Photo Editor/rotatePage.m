//
//  rotatePage.m
//  Photo Editor
//
//  Created by Randi on 10/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import "rotatePage.h"
#import "AppDelegate.h"

@interface rotatePage () {
    AppDelegate* appGlobal;
    UIImage *temp;
}

@end

@implementation rotatePage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    beginImage = [[CIImage alloc] initWithCGImage:appGlobal.globalImage.CGImage];
    [self.imageView setImage:appGlobal.globalImage];
    
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
}


- (IBAction)rotateLeft:(id)sender { //  simple if/else statment for imitate rotate by UIImageOrientation
    
    if (appGlobal.globalImage.imageOrientation == UIImageOrientationRight)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationUp];
    else if (appGlobal.globalImage.imageOrientation == UIImageOrientationDown)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationRight];
    else if (appGlobal.globalImage.imageOrientation == UIImageOrientationLeft)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationDown];
    else
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationLeft];
    appGlobal.globalImage = temp;
    
    [self.imageView setImage:appGlobal.globalImage];
    
}

- (IBAction)rotateRight:(id)sender { //  simple if/else statment for imitate rotate by UIImageOrientation
    
    if (appGlobal.globalImage.imageOrientation == UIImageOrientationRight)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                                  scale: 1.0
                                            orientation: UIImageOrientationDown];
    else if (appGlobal.globalImage.imageOrientation == UIImageOrientationDown)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                                  scale: 1.0
                                            orientation: UIImageOrientationLeft];
    else if (appGlobal.globalImage.imageOrientation == UIImageOrientationLeft)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                                  scale: 1.0
                                            orientation: UIImageOrientationUp];
    else
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                                  scale: 1.0
                                            orientation: UIImageOrientationRight];
    appGlobal.globalImage = temp;
    
    [self.imageView setImage:appGlobal.globalImage];

}

- (IBAction)horizontalFlip:(id)sender { //  simple if/else statment for imitate flip by UIImageOrientation
    
    if (appGlobal.globalImage.imageOrientation == UIImageOrientationUp)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                      scale: 1.0
                                orientation: UIImageOrientationUpMirrored];
    else
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationUp];
    
    appGlobal.globalImage = temp;
    
    [self.imageView setImage:appGlobal.globalImage];
    
}

- (IBAction)verticalFlip:(id)sender { //  simple if/else statment for imitate flip by UIImageOrientation
    
    if (appGlobal.globalImage.imageOrientation == UIImageOrientationUp)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationDownMirrored];
    else
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationUp];
    
    appGlobal.globalImage = temp;
    
    [self.imageView setImage:appGlobal.globalImage];
}

- (IBAction)swipeLeft:(id)sender {  //swipe left gesture == rotate left
    
    if (appGlobal.globalImage.imageOrientation == UIImageOrientationRight)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationUp];
    else if (appGlobal.globalImage.imageOrientation == UIImageOrientationDown)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationRight];
    else if (appGlobal.globalImage.imageOrientation == UIImageOrientationLeft)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationDown];
    else
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationLeft];
    appGlobal.globalImage = temp;
    
    [self.imageView setImage:appGlobal.globalImage];
    
}

- (IBAction)swipeRight:(id)sender { //swipe right gesture ==rotate right
    
    if (appGlobal.globalImage.imageOrientation == UIImageOrientationRight)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationDown];
    else if (appGlobal.globalImage.imageOrientation == UIImageOrientationDown)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationLeft];
    else if (appGlobal.globalImage.imageOrientation == UIImageOrientationLeft)
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationUp];
    else
        temp = [[UIImage alloc] initWithCGImage: appGlobal.globalImage.CGImage
                                          scale: 1.0
                                    orientation: UIImageOrientationRight];
    appGlobal.globalImage = temp;
    
    [self.imageView setImage:appGlobal.globalImage];
    
}

- (void) viewWillAppear:(BOOL)animated{ //force refresh tab bar view
    [super viewWillAppear:animated];
    
    [self.imageView setImage:appGlobal.globalImage];
}



@end
