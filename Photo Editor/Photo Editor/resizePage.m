//
//  resizePage.m
//  Photo Editor
//
//  Created by Anson Tam on 9/7/2019.
//  Copyright © 2019 Anson Tam. All rights reserved.
//

#import "resizePage.h"
#import "AppDelegate.h"


@interface resizePage (){
    AppDelegate* appGlobal;
    float imageWidth;
    float imageHeight;
}

@end

@implementation resizePage

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
    // Dispose of any resources that can be recreated.
}



- (IBAction)resizeButton:(id)sender {
    
    imageWidth = [self.widthBox.text floatValue];   //textfield input
    imageHeight = [self.heightBox.text floatValue];
    
    
    NSLog(@"width before resize : %f",appGlobal.globalImage.size.width);
    NSLog(@"height before resize : %f",appGlobal.globalImage.size.height);
    
    CGSize cg = {imageWidth,imageHeight};           //convert textfield value to cgsize

    [self.imageView setImage:[self imageWithImage:appGlobal.globalImage convertToSize:cg]]; //output resized image
    
    appGlobal.globalImage = [self imageWithImage:appGlobal.globalImage convertToSize:cg];
    //set up the global image for other tab page
    
    NSLog(@"width after resize : %f",appGlobal.globalImage.size.width);
    NSLog(@"height after resize : %f",appGlobal.globalImage.size.height);
    
}

- (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {   //resize function
    
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return output;
    
}

- (IBAction)sacleSliderControll:(id)sender {    //pass the slider value to width & height float variable
    
    imageWidth = (appGlobal.globalImage.size.width * self.scaleSlider.value);
    self.widthBox.text = [NSString stringWithFormat:@"%.f",(appGlobal.globalImage.size.width * self.scaleSlider.value)];
    imageHeight = (appGlobal.globalImage.size.height * self.scaleSlider.value);
    self.heightBox.text = [NSString stringWithFormat:@"%.f",(appGlobal.globalImage.size.height * self.scaleSlider.value)];
    self.ratioPercent.text = [NSString stringWithFormat:@"%.f%%",(self.scaleSlider.value*100)];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event    //dismiss keyboard
{
    [self.widthBox resignFirstResponder];
    [self.heightBox resignFirstResponder];
}

- (void) viewWillAppear:(BOOL)animated{ //force refresh tab bar view
    [super viewWillAppear:animated];
    
    [self.imageView setImage:appGlobal.globalImage];
    self.widthBox.text = [NSString stringWithFormat:@"%.f",appGlobal.globalImage.size.width];
    self.heightBox.text = [NSString stringWithFormat:@"%.f",appGlobal.globalImage.size.height];
}

@end
