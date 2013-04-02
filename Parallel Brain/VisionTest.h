//
//  VisionTest.h
//  Tune Ur Vision
//
//  Created by ananda on 12/02/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVAudioPlayer.h"
#import "settings.h"

@class settings;
@interface VisionTest : UIViewController{
    settings* settingTab;
    int ImgType,randomImg,countTime;
    NSString* randomImgName;
    BOOL contin;
}

@property (strong, nonatomic) IBOutlet UILabel *Time;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImageView *YesNoImageView;
@property (strong, nonatomic) IBOutlet UIButton *startContinueButton;

- (IBAction)startContinueGame:(id)sender;


- (IBAction)correct:(id)sender;
- (IBAction)wrong:(id)sender;

- (void) startGame;
- (void)GameLoop:(NSTimer*)theTimer;
@end
