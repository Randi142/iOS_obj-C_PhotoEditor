//
//  coreMLTest.h
//  Photo Editor
//
//  Created by Randi on 13/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileNetV2FP16.h"

@interface coreMLTest : UIViewController{
    MobileNetV2FP16 *core;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UILabel *probs;

@end
