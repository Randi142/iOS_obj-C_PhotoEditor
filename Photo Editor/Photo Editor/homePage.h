//
//  homePage.h
//  Photo Editor
//
//  Created by Randi on 9/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homePage : UIViewController{
    
    UIImagePickerController *picker;
    UIImage *image;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *animationView;
- (IBAction)choosePhoto:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (weak, nonatomic) IBOutlet UIButton *revertButton;
@property (weak, nonatomic) IBOutlet UIButton *saveImageButton;
@property (weak, nonatomic) IBOutlet UIButton *shareImageButton;
@property (weak, nonatomic) IBOutlet UIButton *choosePhotoButton;

- (IBAction)revert:(id)sender;
- (IBAction)saveImage:(id)sender;
- (IBAction)shareImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *howtouseButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutusButton;



@property (weak, nonatomic) IBOutlet UISegmentedControl *themeSeg;
- (IBAction)theme:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *backgroundImageSeg;
- (IBAction)backgroundImage:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *musicSeg;
- (IBAction)music:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *muteImage;
- (IBAction)mute:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *settingView;

- (IBAction)setting:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *settingButton;
@property (weak, nonatomic) IBOutlet UIButton *coreMLButton;

@end
