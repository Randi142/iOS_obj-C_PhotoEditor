//
//  GalleryViewController.h
//  Photo Editor
//
//  Created by Anson Tam on 13/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
- (IBAction)imageMove:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end
