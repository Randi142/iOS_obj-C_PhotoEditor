//
//  filterPage.h
//  Photo Editor
//
//  Created by Randi on 9/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface filterPage : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    
    UIImagePickerController *picker;
    UIImage *image;
    CIImage *beginImage;
    CIContext *context;
    CIFilter *filter;
    CIImage *outputImage;
    CGImageRef imageRef;
    UIImage *filteredImage;
}


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *filterSeg;

- (IBAction)filter:(id)sender;

@property (weak, nonatomic) IBOutlet UISwitch *filterApplyButton;

- (IBAction)filterApply:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
- (IBAction)filterDetails:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *detailsView;
@property (weak, nonatomic) IBOutlet UIImageView *detailsImage;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
- (IBAction)detailsExit:(id)sender;

@end
