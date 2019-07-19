//
//  mergePage.m
//  Photo Editor
//
//  Created by Randi on 10/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import "mergePage.h"
#import "AppDelegate.h"

@interface mergePage (){
    AppDelegate* appGlobal;
}

@end

@implementation mergePage

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



- (IBAction)import:(id)sender {
    
    picker = [[UIImagePickerController alloc] init];    //init
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];   //prepare photo library for picker
    [self presentViewController:picker animated:YES completion:NULL];       //call library for picking image
    
}

- (IBAction)merge:(id)sender {
    
    CGSize newSize = CGSizeMake(appGlobal.globalImage.size.width, appGlobal.globalImage.size.height);
    UIGraphicsBeginImageContext( newSize );
    
    // Use existing opacity as is
    [appGlobal.globalImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Apply supplied opacity if applicable
    [frontImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height) blendMode:kCGBlendModeNormal alpha:0.8];
    
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    appGlobal.globalImage = outputImage;
    
    [self.imageView setImage:appGlobal.globalImage];
    
    //fade out animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [_frontImageView setAlpha:0];
    [UIView commitAnimations];
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info   {
    
    //function after picked the image
    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    frontImage = image;
    [self dismissViewControllerAnimated:YES completion:NULL]; //dimiss photo library
    [_frontImageView setAlpha:1];
    [self.frontImageView setImage:frontImage];

    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {  //function after press cancel from photo library
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void) viewWillAppear:(BOOL)animated{ //force refresh tab bar view
    [super viewWillAppear:animated];
    
    [self.imageView setImage:appGlobal.globalImage];
    [_frontImageView setAlpha:1];
}
@end
