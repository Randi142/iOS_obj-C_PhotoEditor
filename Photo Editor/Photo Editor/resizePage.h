//
//  resizePage.h
//  Photo Editor
//
//  Created by Anson Tam on 9/7/2019.
//  Copyright © 2019 Anson Tam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface resizePage : UIViewController {
    CIImage *beginImage;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)resizeButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *widthBox;

@property (weak, nonatomic) IBOutlet UITextField *heightBox;

@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;
- (IBAction)sacleSliderControll:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *ratioPercent;

@end
