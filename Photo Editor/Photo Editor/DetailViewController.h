//
//  DetailViewController.h
//  Photo Editor
//
//  Created by Anson Tam on 13/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MediaPlayer/MediaPlayer.h>


@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *TitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
@property (strong, nonatomic) NSArray *DetailModal;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;


- (IBAction)Play:(id)sender;

@end
