//
//  AppDelegate.h
//  Photo Editor
//
//  Created by Randi on 7/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    @public AVAudioPlayer * GlobalAudioPlayer;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIImage *globalImage;

@property (strong, nonatomic) NSString *globalWallpaper;

@property (strong, nonatomic) NSString* globalMusic;

@end

