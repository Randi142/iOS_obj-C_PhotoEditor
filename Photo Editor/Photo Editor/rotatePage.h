//
//  rotatePage.h
//  Photo Editor
//
//  Created by Randi on 10/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rotatePage : UIViewController{
    CIImage *beginImage;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)rotateLeft:(id)sender;
- (IBAction)rotateRight:(id)sender;
- (IBAction)horizontalFlip:(id)sender;
- (IBAction)verticalFlip:(id)sender;


- (IBAction)swipeLeft:(id)sender;
- (IBAction)swipeRight:(id)sender;

@end
