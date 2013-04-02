//
//  ParallelBrainController.h
//  Parallel Brain
//
//  Created by ananda on 12/02/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "settings.h"

@interface ParallelBrainController : UIViewController{
    
    
    SEL sel; //selector variable for different games
    NSString* gameIdentity;
    
    int textBoxSelection,colorRand,colorNameRand,YESPROB,colorFontSize,infoFontSize;
    int score;
    int time;
    int timeInterval; //timeInterval between two problems
    BOOL gameStarted;
    BOOL countForYes,up,wrong;
    NSArray* colorName,*colorNameEN,*colorNameJP,*color,*smallLetter,*capitalLetter,*hiragana,*katakana,*number,*Number,*japaneseNumber,*vowel,*consonant;
    
    NSTimer* timerItself,*fireMethod;
    
    
    NSString* stringEN,*stringJP,*strInfo; //info strings
    
    settings* settingTab; //setting tab reference
    
    
    //sizetrick game specific variables
    int smallCapital;
    int letterSelection1,letterSelection2;
    int sizeFontSize;
    int capital;
    BOOL left,right;//for correct wrong answer
    
}
@property (strong, nonatomic) IBOutlet UIImageView *upImage;

@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIImageView *downImage;
@property (strong, nonatomic) IBOutlet AVAudioPlayer* correctBuzz;
@property (strong, nonatomic) IBOutlet AVAudioPlayer* wrongBuzz;
@property (strong, nonatomic) IBOutlet UITextView *upTextBox;
@property (strong, nonatomic) IBOutlet UITextView *downTextBox;
@property (strong, nonatomic) IBOutlet UITextView *rightInfo;
@property (strong, nonatomic) IBOutlet UITextView *leftInfo;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *rightYesNo;
@property (strong, nonatomic) IBOutlet UIImageView *leftYesNo;
@property (strong, nonatomic) IBOutlet UIButton *correctButton;
@property (strong, nonatomic) IBOutlet UIButton *wrongButton;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabelLeft;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;


- (IBAction)startParallelBrain:(id)sender;
- (IBAction)correct:(id)sender;
- (IBAction)wrong:(id)sender;

//color trick game
-(void)colorTrickInit;
-(void)colorTrick:(NSTimer*)theTimer;
-(void)timeCount:(NSTimer*)theTimer;


//size trick game
-(void)sizeTrickInit;
-(void)sizeTrick:(NSTimer*)theTimer;
-(void)timeCount2:(NSTimer*)theTimer;

@end
