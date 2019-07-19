//
//  homePage.m
//  Photo Editor
//
//  Created by Randi on 9/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import "homePage.h"
#import "AppDelegate.h"
#define IMAGE_COUNT 29


@interface homePage ()

@end

@implementation homePage {
    AppDelegate* appGlobal;
    UIImage *temp;      //set up temp image for revert
    BOOL pause;
    int backgroundInt;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    pause = true;
    
    _choosePhotoButton.hidden = YES;
    _startButton.hidden = YES;
    _revertButton.hidden = YES;
    _saveImageButton.hidden = YES;
    _imageView.hidden = YES;
    _settingView.hidden = YES;
    _settingButton.hidden = YES;
    _coreMLButton.hidden = YES;
    _shareImageButton.hidden=YES;
    _howtouseButton.hidden=YES;
    _aboutusButton.hidden=YES;

    
    
    //***animation part***//
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:IMAGE_COUNT];
    int i;
    for (i=0; i<=IMAGE_COUNT; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"frame_%d_delay-0.03s.png",i]]];
    }
    _animationView.animationImages = [NSArray arrayWithArray:images];
    _animationView.animationDuration = 0;
    [_animationView startAnimating];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(stopAnimation) userInfo:nil repeats:NO];
    //***animation part***//
    
    [self.imageView setImage:appGlobal.globalImage];
    
    [_backgroundImageSeg setSelectedSegmentIndex:0];
    [_themeSeg setSelectedSegmentIndex:2];
    [_musicSeg setSelectedSegmentIndex:0];
    
    [appGlobal setGlobalWallpaper:@"Background1.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalWallpaper]];
    _settingView.layer.cornerRadius = 60;
    backgroundInt = 0;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)stopAnimation{      //stop the loading animation and start the fade in animation
    [_animationView stopAnimating];
    
    _choosePhotoButton.hidden = NO;
    _startButton.hidden = NO;
    _revertButton.hidden = NO;
    _saveImageButton.hidden = NO;
    _imageView.hidden = NO;
    _settingButton.hidden = NO;
    _coreMLButton.hidden = NO;
    _shareImageButton.hidden=NO;
    _howtouseButton.hidden=NO;
    _aboutusButton.hidden=NO;



    [_choosePhotoButton setAlpha:0];        //from alpha 0 -> 1 fade in animation
    [_startButton setAlpha:0];
    [_revertButton setAlpha:0];
    [_saveImageButton setAlpha:0];
    [_imageView setAlpha:0];
    [_settingButton setAlpha:0];
    [_settingView setAlpha:0];
    [_coreMLButton setAlpha:0];
    [_shareImageButton setAlpha:0];
    [_howtouseButton setAlpha:0];
    [_aboutusButton setAlpha:0];


    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:3.0];
    [_choosePhotoButton setAlpha:1];
    [_startButton setAlpha:1];
    [_revertButton setAlpha:1];
    [_saveImageButton setAlpha:1];
    [_imageView setAlpha:1];
    [_settingButton setAlpha:1];
    [_settingView setAlpha:1];
    [_coreMLButton setAlpha:1];
    [_shareImageButton setAlpha:1];
    [_howtouseButton setAlpha:1];
    [_aboutusButton setAlpha:1];


    [UIView commitAnimations];

}


- (IBAction)choosePhoto:(id)sender {
    
    picker = [[UIImagePickerController alloc] init];    //init
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];   //prepare photo library for picker
    [self presentViewController:picker animated:YES completion:NULL];       //call library for picking image
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info   {
    
    //function after picked the image
    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self.imageView setImage:image];    //set image view
    [self dismissViewControllerAnimated:YES completion:NULL]; //dimiss photo library
    appGlobal.globalImage = image;
    temp = appGlobal.globalImage;       //pass the selected iamge to temp for back up
    NSLog(@"Image width : %f",appGlobal.globalImage.size.width);
    NSLog(@"Image height : %f",appGlobal.globalImage.size.height);
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {  //function after press cancel from photo library
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)viewWillAppear:(BOOL)animated {
    //force refresh image view after return from navigation bar & enable photo edit function after selected photo
    
    [super viewWillAppear:animated];
    [self.imageView setImage:appGlobal.globalImage];
    NSLog(@"Image width : %f",appGlobal.globalImage.size.width);
    NSLog(@"Image height : %f",appGlobal.globalImage.size.height);
    
    if (appGlobal.globalImage.size.width != 0){
        self.startButton.enabled = YES;
        self.revertButton.enabled = YES;
        self.saveImageButton.enabled = YES;
        self.coreMLButton.enabled = YES;
        self.shareImageButton.enabled = YES;
    }

    
}

- (IBAction)revert:(id)sender {     //grab the backed up photo to revert
    
    [self.imageView setImage:temp];
    appGlobal.globalImage = temp;
    NSLog(@"Image width : %f",appGlobal.globalImage.size.width);
    NSLog(@"Image height : %f",appGlobal.globalImage.size.height);
    
}

- (IBAction)saveImage:(id)sender {
    
    UIImageWriteToSavedPhotosAlbum(appGlobal.globalImage, nil, nil, nil); //save the image to photo library
    UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@""message:@"Saved" delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil];                   //inform user the image is saved
    [alert show];
    
}

- (IBAction)shareImage:(id)sender {
    
    UIActivityViewController *controller =
    [[UIActivityViewController alloc]initWithActivityItems:@[appGlobal.globalImage]applicationActivities:nil]; //url
    [self presentViewController:controller animated:YES completion:nil];
    
}




//***interface part***//

- (IBAction)theme:(id)sender {
    
    if (self.themeSeg.selectedSegmentIndex == 0) {
        self.view.backgroundColor = [UIColor blackColor];   //background color
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;    //status bar color
        _settingView.backgroundColor = [UIColor whiteColor];    //setting view color
        self.backgroundImageSeg.enabled = NO;
        [appGlobal setGlobalWallpaper:@"black"];            
        
    }
    if (self.themeSeg.selectedSegmentIndex == 1) {
        self.view.backgroundColor = [UIColor whiteColor];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        _settingView.backgroundColor = [UIColor grayColor];
        self.backgroundImageSeg.enabled = NO;
        [appGlobal setGlobalWallpaper:@"white"];
    }
    if (self.themeSeg.selectedSegmentIndex == 2) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        _settingView.backgroundColor = [UIColor whiteColor];
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalWallpaper]];
        [_backgroundImageSeg setSelectedSegmentIndex:backgroundInt];    //control the wallpaper segment
        self.backgroundImageSeg.enabled = YES;
    }
    
}
- (IBAction)backgroundImage:(id)sender {
    
    
    
    if (self.backgroundImageSeg.selectedSegmentIndex == 0){
        [appGlobal setGlobalWallpaper:@"Background1.jpg"];
        backgroundInt = 0;
    }
    if (self.backgroundImageSeg.selectedSegmentIndex == 1){
        [appGlobal setGlobalWallpaper:@"Background2.jpg"];
        backgroundInt = 1;
    }
    if (self.backgroundImageSeg.selectedSegmentIndex == 2){
        [appGlobal setGlobalWallpaper:@"Background3.jpg"];
        backgroundInt = 2;
    }
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:appGlobal.globalWallpaper]];
    
}
- (IBAction)music:(id)sender {
    
    if (self.musicSeg.selectedSegmentIndex == 0){
        [appGlobal setGlobalMusic:@"bgm"];
    }
    if (self.musicSeg.selectedSegmentIndex == 1){
        [appGlobal setGlobalMusic:@"bgm2"];
    }
    if (self.musicSeg.selectedSegmentIndex == 2){
        [appGlobal setGlobalMusic:@"bgm3"];
    }
    [appGlobal->GlobalAudioPlayer stop];
    NSString *music = [[NSBundle mainBundle]pathForResource:appGlobal.globalMusic ofType:@"mp3"];  //play bgm in all controller
    appGlobal->GlobalAudioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL]; //declare
    appGlobal->GlobalAudioPlayer.numberOfLoops = -1; //infinity loop
    [appGlobal->GlobalAudioPlayer play];
    
}
- (IBAction)mute:(id)sender {
    
    if (pause == true){
        pause = false;
        [appGlobal->GlobalAudioPlayer setVolume:0];
        [_muteImage setImage:[UIImage imageNamed:@"unmute.png"] forState:UIControlStateNormal];
    }
    else {
        pause = true;
        [appGlobal->GlobalAudioPlayer setVolume:1];
        [_muteImage setImage:[UIImage imageNamed:@"mute.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)setting:(id)sender {
    
    if (self.settingView.hidden == YES) {
        self.settingView.hidden = NO;
    }
    else {
        self.settingView.hidden = YES;
    }
}


@end
