//
//  mergePage.h
//  Photo Editor
//
//  Created by Randi on 10/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mergePage : UIViewController{
    CIImage *beginImage;
    UIImagePickerController *picker;
    UIImage *image;
    UIImage *frontImage;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *frontImageView;

- (IBAction)import:(id)sender;
- (IBAction)merge:(id)sender;

@end
