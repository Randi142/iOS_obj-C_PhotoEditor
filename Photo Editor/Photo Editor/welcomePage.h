//
//  welcomePage.h
//  Photo Editor
//
//  Created by Randi on 7/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface welcomePage : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *viewimg;

@property NSString * strimg;
@property NSUInteger valueindex;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@end
