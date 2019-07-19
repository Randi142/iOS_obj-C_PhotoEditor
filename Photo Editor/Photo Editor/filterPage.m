//
//  filterPage.m
//  Photo Editor
//
//  Created by Randi on 9/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import "filterPage.h"
#import "AppDelegate.h"

@interface filterPage (){
    AppDelegate* appGlobal;
    UIImage *temp;  //set up another UIimage for reverting from filter

}

@end

@implementation filterPage

- (void)viewDidLoad {
    [super viewDidLoad];

    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    self.filterSeg.selectedSegmentIndex = -1;       //segmenet default unselected
    self.loading.hidden = YES;                      //hide the activity indicator
    beginImage = [[CIImage alloc] initWithCGImage:appGlobal.globalImage.CGImage];   //set up CIimage for further use
    [self.imageView setImage:appGlobal.globalImage];
    
    NSLog(@"Image width : %f",appGlobal.globalImage.size.width);
    NSLog(@"Image height : %f",appGlobal.globalImage.size.height);
    
    temp = appGlobal.globalImage;
    
    self.filterApplyButton.enabled = NO;
    
    self.detailsView.hidden = YES;
    self.detailsView.layer.cornerRadius = 30;
    self.detailsLabel.text = @"Please select a filter";     //initial text
    
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

- (IBAction)filter:(id)sender {
    
    self.filterApplyButton.enabled = YES;
    
    if (_filterApplyButton.isOn == true){
        
        [self startAnimation];
        //    [NSThread detachNewThreadSelector:@selector(startAnimation) toTarget:self withObject:nil];
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]] ;
        
        if (self.filterSeg.selectedSegmentIndex == 0){
            
            filter = [CIFilter filterWithName:@"CISepiaTone"keysAndValues: kCIInputImageKey, beginImage,
                      @"inputIntensity", @0.8, nil];              //select filter type
            outputImage = [filter outputImage];                             //another CIImage for output image
            context = [CIContext contextWithOptions:nil];                   //use a public CIContext to avoid rebuild several CIContext
            imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            filteredImage = [UIImage imageWithCGImage:imageRef];            //convert to UIImage to display
            [self.imageView setContentMode:UIViewContentModeScaleAspectFit];// set to aspect fit
            [self.imageView setImage:filteredImage];                        //display image
            appGlobal.globalImage = filteredImage;                          //transfer the rendered    to global image
        }
        
        if (self.filterSeg.selectedSegmentIndex == 1){
            
            filter = [CIFilter filterWithName:@"CILineOverlay"keysAndValues: kCIInputImageKey, beginImage,
                      nil];
            outputImage = [filter outputImage];
            context = [CIContext contextWithOptions:nil];
            imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
            [self.imageView setImage:filteredImage];
            appGlobal.globalImage = filteredImage;
            
        }
        
        if (self.filterSeg.selectedSegmentIndex == 2){
            
            filter = [CIFilter filterWithName:@"CIPhotoEffectProcess"
                                keysAndValues: kCIInputImageKey, beginImage,nil];
            outputImage = [filter outputImage];
            context = [CIContext contextWithOptions:nil];
            imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
            [self.imageView setImage:filteredImage];
            appGlobal.globalImage = filteredImage;
        }
        
        [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(stopAnimation) userInfo:nil repeats:NO];
        
    }
    
}

- (void) startAnimation {   //activity indicator function
    
    self.loading.hidden = NO;
    [self.loading startAnimating];
    
}

- (void) stopAnimation {    //activity indicator function
    
    [self.loading stopAnimating];
    self.loading.hidden = YES;
    
}


- (IBAction)filterApply:(id)sender {
    
    if (_filterApplyButton.isOn == true){
        
        [self startAnimation];
        //    [NSThread detachNewThreadSelector:@selector(startAnimation) toTarget:self withObject:nil];
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]] ;
        
        if (self.filterSeg.selectedSegmentIndex == 0){
            
            filter = [CIFilter filterWithName:@"CISepiaTone"keysAndValues: kCIInputImageKey, beginImage,
                      @"inputIntensity", @0.8, nil];              //select filter type
            outputImage = [filter outputImage];                             //another CIImage for output image
            context = [CIContext contextWithOptions:nil];                   //use a public CIContext to avoid rebuild several CIContext
            imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            filteredImage = [UIImage imageWithCGImage:imageRef];            //convert to UIImage to display
            [self.imageView setContentMode:UIViewContentModeScaleAspectFit];// set to aspect fit
            [self.imageView setImage:filteredImage];                        //display image
            appGlobal.globalImage = filteredImage;                          //transfer the rendered    to global image
        }
        
        if (self.filterSeg.selectedSegmentIndex == 1){
            
            filter = [CIFilter filterWithName:@"CILineOverlay"keysAndValues: kCIInputImageKey, beginImage,
                      nil];
            outputImage = [filter outputImage];
            context = [CIContext contextWithOptions:nil];
            imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
            [self.imageView setImage:filteredImage];
            appGlobal.globalImage = filteredImage;
            
        }
        
        if (self.filterSeg.selectedSegmentIndex == 2){
            
            filter = [CIFilter filterWithName:@"CIPhotoEffectProcess"
                                keysAndValues: kCIInputImageKey, beginImage,nil];
            outputImage = [filter outputImage];
            context = [CIContext contextWithOptions:nil];
            imageRef = [context createCGImage:outputImage fromRect:beginImage.extent];
            filteredImage = [UIImage imageWithCGImage:imageRef];
            [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
            [self.imageView setImage:filteredImage];
            appGlobal.globalImage = filteredImage;
        }
        
        [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(stopAnimation) userInfo:nil repeats:NO];
        
    }
    
    
    else {
        self.filterSeg.selectedSegmentIndex = -1;
        [self.imageView setImage:temp];
        appGlobal.globalImage = temp;
        self.filterApplyButton.enabled = NO;
    }
}


- (IBAction)filterDetails:(id)sender {  //for the hidden details view
    
    self.detailsView.hidden = NO;
    
    if (self.filterSeg.selectedSegmentIndex == 0){
        
        self.detailsLabel.text = @"CISepiaTone";        //describe filter & example image
        self.detailsImage.image = [UIImage imageNamed:@"CISepiaTone_2x.png"];
        
    }
    if (self.filterSeg.selectedSegmentIndex == 1){
        
        self.detailsLabel.text = @"CILineOverlay";
        self.detailsImage.image = [UIImage imageNamed:@"CILineOverlay_2x.png"];
        
    }
    if (self.filterSeg.selectedSegmentIndex == 2){
        
        self.detailsLabel.text = @"CIPhotoEffectProcess";
        self.detailsImage.image = [UIImage imageNamed:@"CIPhotoEffectProcess_2x.png"];
        
    }
    
}
- (IBAction)detailsExit:(id)sender {
    self.detailsView.hidden = YES;
}

- (void) viewWillAppear:(BOOL)animated{ //force refresh tab bar view
    [super viewWillAppear:animated];
    
     beginImage = [[CIImage alloc] initWithCGImage:appGlobal.globalImage.CGImage];  //re-input the global image to CIimage object
    [self.imageView setImage:appGlobal.globalImage];
}
@end
