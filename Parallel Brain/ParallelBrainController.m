//
//  ParallelBrainController.m
//  Parallel Brain
//
//  Created by ananda on 12/02/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ParallelBrainController.h"

@implementation ParallelBrainController
@synthesize correctButton;
@synthesize wrongButton;
@synthesize scoreLabelLeft;
@synthesize upImage;
@synthesize upTextBox;
@synthesize downTextBox;
@synthesize rightInfo;
@synthesize leftInfo;
@synthesize timeLabel;
@synthesize scoreLabel;
@synthesize rightYesNo;
@synthesize leftYesNo;
@synthesize startButton;
@synthesize downImage;
@synthesize correctBuzz;
@synthesize wrongBuzz;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    
    //settingTab reference
    settingTab = (settings*)[self.tabBarController.viewControllers objectAtIndex:2];
    
    
    //declaration of arrays...
    colorNameEN = [NSArray arrayWithObjects:@"green",@"red",@"black",@"blue",@"purple",@"yellow",@"orange",@"brown",@"cyan",@"gray", nil];
    //japanese color Name
    colorNameJP = [NSArray arrayWithObjects:@"緑",@"赤",@"黒",@"青",@"紫",@"黄",@"橙",@"褐色",@"シアン",@"灰色", nil];
    //UIColors
    color = [NSArray arrayWithObjects:[UIColor greenColor],[UIColor redColor],[UIColor blackColor],[UIColor blueColor],[UIColor purpleColor],[UIColor yellowColor],[UIColor orangeColor],[UIColor brownColor],[UIColor cyanColor],[UIColor grayColor], nil];

    //small letters of english alphabet
    smallLetter = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z", nil];
    //capital letters
    capitalLetter = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    //vowel
    vowel = [NSArray arrayWithObjects:@"a",@"e",@"i",@"o",@"u", nil];
    
    //consonant
    consonant = [NSArray arrayWithObjects:@"b",@"c",@"d",@"f",@"g",@"h",@"j",@"k",@"l",@"m",@"n",@"p",@"q",@"r",@"s",@"t",@"v",@"w",@"x",@"y",@"z", nil];
    
    //hiragana of japanese alphabet
    hiragana = [NSArray arrayWithObjects:@"あ",@"い",@"う",@"え",@"お",@"か",@"き",@"く",@"け",@"こ",@"さ",@"し",@"す",@"せ",@"そ",@"た",@"ち",@"つ",@"て",@"と",@"な",@"に",@"ぬ",@"ね",@"の",@"は",@"ひ",@"ふ",@"へ",@"ほ",@"ま",@"み",@"む",@"め",@"も",@"ら",@"り",@"る",@"れ",@"ろ",@"や",@"ゆ",@"よ",@"わ",@"を",@"ん", nil];
    //katakana
    katakana = [NSArray arrayWithObjects:@"ア",@"イ",@"ウ",@"エ",@"オ",@"カ",@"キ",@"ク",@"ケ",@"コ",@"サ",@"シ",@"ス",@"セ",@"ソ",@"タ",@"チ",@"ツ",@"テ",@"ト",@"ナ",@"ニ",@"ヌ",@"ネ",@"ノ",@"ハ",@"ヒ",@"フ",@"ヘ",@"ホ",@"マ",@"ミ",@"ム",@"メ",@"モ",@"ラ",@"リ",@"ル",@"レ",@"ロ",@"ヤ",@"ユ",@"ヨ",@"ワ",@"ヲ",@"ン", nil];
    
    //number
    number = [NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    //japanese number
    japaneseNumber = [NSArray arrayWithObjects:@"○",@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九", nil];
    
    gameStarted = false;
    
    [timeLabel setHidden:YES];
    [upImage setHidden:YES];
    [downImage setHidden:YES];
    [correctButton setHidden:YES];
    [wrongButton setHidden:YES];
    [upTextBox setHidden:YES];
    [downTextBox setHidden:YES];
    [rightYesNo setHidden:YES];
    [leftYesNo setHidden:YES];
    [scoreLabel setHidden:YES];
    [scoreLabelLeft setHidden:YES];
    [leftInfo setHidden:YES];
    [rightInfo setHidden:YES];
}

-(IBAction)startParallelBrain:(id)sender{
    
    //gamestarted flag true
    gameStarted = true;
    
    //sound
    NSString* correctsoundFilePath = [[NSBundle mainBundle]pathForResource:@"Buzzer1" ofType:@"mp3"];
    NSURL* correctsoundFileUrl = [[NSURL alloc]initFileURLWithPath:correctsoundFilePath];
    correctBuzz = [[AVAudioPlayer alloc]initWithContentsOfURL:correctsoundFileUrl error:nil];
    
    NSString* wrongsoundFilePath = [[NSBundle mainBundle]pathForResource:@"Buzzer2" ofType:@"mp3"];
    NSURL* wrongSoundFileUrl = [[NSURL alloc]initFileURLWithPath:wrongsoundFilePath];
    wrongBuzz  = [[AVAudioPlayer alloc]initWithContentsOfURL:wrongSoundFileUrl error:nil];

    [startButton setHidden:YES];
    [timeLabel setHidden:NO];
    [upImage setHidden:NO];
    [downImage setHidden:NO];
    [correctButton setHidden:NO];
    [wrongButton setHidden:NO];
    [upTextBox setHidden:NO];
    [downTextBox setHidden:NO];
    [rightYesNo setHidden:NO];
    [leftYesNo setHidden:NO];
    [scoreLabel setHidden:NO];
    [scoreLabelLeft setHidden:NO];    
    [leftInfo setHidden:NO];
    [rightInfo setHidden:NO];
        
    //color brain trick
    [self sizeTrickInit];
    
}

-(void)colorTrickInit{
    //button image
    [correctButton setImage:[UIImage imageNamed:@"tickMark.png"] forState:UIControlStateNormal];
    [wrongButton setImage:[UIImage imageNamed:@"wrongMark.png"] forState:UIControlStateNormal];
    
    //gameIdentity string
    gameIdentity = @"colorTrick";
    
    //language based info string
    stringEN = @"Does it say the right color?";
    stringJP = @"色名は正しいなの？";
    
    
    wrong = FALSE;
    
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    
    if (screenRect.size.height > 1000) {
        colorFontSize = 100;
        infoFontSize = 30;
    }
    else{
        colorFontSize = 38;
        infoFontSize = 12;
        
    }
    
    strInfo = stringEN;
    colorName = colorNameEN;
    
    //score initialization
    score= 0;
    scoreLabel.text = @"0";
    
    //setting the time interval between two problems
    timeInterval = 3.0;
    
    
    //time initialization
    time = 120;
    timeLabel.text = @"120";
    [fireMethod invalidate];
    fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(colorTrick:)  userInfo:nil repeats:YES];
    
    //timer starts 
    [timerItself invalidate];
    timerItself = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeCount:) userInfo:nil repeats:YES];
    [timerItself fire];
    
    countForYes = 0;
    YESPROB = 10;
    
    
}



-(void)timeCount:(NSTimer *)theTimer{
    
    if (self.tabBarController.selectedIndex == 1) {
        
        //checking language
        if(settingTab.faceS.on ) //faceS corresponds to English Language
        {   
            strInfo = stringEN;
            colorName = colorNameEN;
            
        }
        else if(settingTab.planetS.on){
            strInfo = stringJP;
            colorName = colorNameJP;
        }
        
        
        if (time/10 > 10) {
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
        }
        else if(time / 10 == 10){
            //invalidating fireMethod
            [fireMethod invalidate];
            
            //setting new time interval
            timeInterval = 2.8;
            
            //again initializing
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(colorTrick:)  userInfo:nil repeats:YES];
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
            
        }
        else if(time / 10 == 8){
            [fireMethod invalidate];
            timeInterval = 2.6;
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(colorTrick:)  userInfo:nil repeats:YES];
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
            
        }
        else if(time / 10 == 6){
            [fireMethod invalidate];
            timeInterval = 2.4;
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(colorTrick:)  userInfo:nil repeats:YES];
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
            
        }
        else if(time / 10 == 4){
            [fireMethod invalidate];
            timeInterval = 2.2;
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(colorTrick:)  userInfo:nil repeats:YES];
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
            
        }
        else if(time / 10 == 2){
            [fireMethod invalidate];
            timeInterval = 2.1;
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(colorTrick:)  userInfo:nil repeats:YES];
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
            
        }
        else if(time / 10 == 1){
            [fireMethod invalidate];
            timeInterval = 2.0;
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(colorTrick:)  userInfo:nil repeats:YES];
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
            
        }
        
        if (time == 1) {
            [startButton setHidden:NO];
            [timeLabel setHidden:YES];
            [upImage setHidden:YES];
            [downImage setHidden:YES];
            [correctButton setHidden:YES];
            [wrongButton setHidden:YES];
            [upTextBox setHidden:YES];
            [downTextBox setHidden:YES];
            [rightYesNo setHidden:YES];
            [leftYesNo setHidden:YES];
            [scoreLabel setHidden:YES];
            [scoreLabelLeft setHidden:YES];
            [leftInfo setHidden:YES];
            [rightInfo setHidden:YES];

            
            //last second to finish
            [fireMethod invalidate];
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(colorTrick:)  userInfo:nil repeats:NO];
            [fireMethod fire];
            
            gameStarted = FALSE;
        }
        else{  //time decrease and timelabel
            timeLabel.text = [NSString stringWithFormat:@"%d",time];
            time --;
            
        }        
    }
            
}

-(void)colorTrick:(NSTimer*)theTimer{
    
    textBoxSelection = arc4random()%2;
    colorRand = arc4random() % 10;
    colorNameRand = arc4random() % 10; 
    
    //for match color with colorName 
    if (countForYes % YESPROB >= 5) {
        colorNameRand = colorRand;
        if (countForYes % 15 >= 12) {
            YESPROB = arc4random() % 10 + 10;
        }
    }
    
    
    if(textBoxSelection == 1){
        up = TRUE;
        leftYesNo.image = rightYesNo.image = nil;
        downTextBox.text = nil;
        upTextBox.text = [colorName objectAtIndex:colorNameRand];
        upTextBox.textColor = [color objectAtIndex:colorRand];
        [upTextBox setFont:[UIFont fontWithName:@"Cochin" size:colorFontSize]];
        
        leftInfo.text = nil;
        if (time >= 110) {
            rightInfo.text = strInfo;
            [rightInfo setFont:[UIFont fontWithName:@"Courier" size:infoFontSize]];
            [rightInfo setFont:[UIFont boldSystemFontOfSize:infoFontSize]];
        }
    }else{
        up = FALSE;
        leftYesNo.image = rightYesNo.image = nil;
        upTextBox.text = nil;
        downTextBox.text = [colorName objectAtIndex:colorNameRand];
        downTextBox.textColor = [color objectAtIndex:colorRand];
        [downTextBox setFont:[UIFont fontWithName:@"Cochin" size:colorFontSize]];
        
        rightInfo.text = nil;
        if (time>=110 ) {
            leftInfo.text = strInfo;
            [leftInfo setFont:[UIFont fontWithName:@"Courier" size:infoFontSize]];
            [leftInfo setFont:[UIFont boldSystemFontOfSize:infoFontSize]];
        }
    }
    
    countForYes ++ ;
}




//size Trick Game source Code

-(void)sizeTrickInit{
    [correctButton setImage:[UIImage imageNamed:@"Button-Previous-icon.png"] forState:UIControlStateNormal];
    [wrongButton setImage:[UIImage imageNamed:@"Button-Next-icon.png"] forState:UIControlStateNormal];
    
    //selector declaration 
    sel = @selector(sizeTrick:);
    
    //gameIdentity string
    gameIdentity = @"sizeTrick";
    
    //language based info string
    stringEN = @"Which one is Capital?";
    stringJP = @"どっちが大きいなの？";
    
    
    wrong = FALSE;
    
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    
    if (screenRect.size.height > 1000) {
        sizeFontSize = 150; //problem text size
        infoFontSize = 30;    //info text size
    }
    else{
        sizeFontSize = 50;
        infoFontSize = 12;
        
    }
    
    strInfo = stringEN;
    //using color 
    colorName = colorNameEN;
    
    //score initialization
    score= 0;
    scoreLabel.text = @"0";
    
    //setting the time interval between two problems
    timeInterval = 3.0;
    
    
    //time initialization
    time = 120;
    timeLabel.text = @"120";
    [fireMethod invalidate];
    fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:sel  userInfo:nil repeats:YES];
    
    //timer starts 
    [timerItself invalidate];
    timerItself = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeCount2:) userInfo:nil repeats:YES];
    [timerItself fire];
    
    countForYes = 0;
    YESPROB = 10;
    
}

-(void)timeCount2:(NSTimer *)theTimer{
    
     
    
    if (self.tabBarController.selectedIndex == 1) {
        
        //checking language
        if(settingTab.faceS.on ) //faceS corresponds to English Language
        {   
            strInfo = stringEN;
            
        }
        else if(settingTab.planetS.on){
            strInfo = stringJP;        }
        
        
        if (time/10 > 10) {
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
        }
        else if(time / 10 == 10){
            //invalidating fireMethod
            [fireMethod invalidate];
            
            //setting new time interval
            timeInterval = 2.8;
            
            //again initializing
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:sel  userInfo:nil repeats:YES];
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
            
        }
        else if(time / 10 == 8){
            [fireMethod invalidate];
            timeInterval = 2.6;
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:sel  userInfo:nil repeats:YES];
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
            
        }
        else if(time / 10 == 6){
            [fireMethod invalidate];
            timeInterval = 2.4;
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:sel  userInfo:nil repeats:YES];
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
            
        }
        else if(time / 10 == 4){
            [fireMethod invalidate];
            timeInterval = 2.2;
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:sel  userInfo:nil repeats:YES];
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
            
        }
        else if(time / 10 == 2){
            [fireMethod invalidate];
            timeInterval = 2.0;
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:sel  userInfo:nil repeats:YES];
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
            
        }
        else if(time / 10 == 1){
            [fireMethod invalidate];
            timeInterval = 1.80;
            fireMethod = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:sel  userInfo:nil repeats:YES];
            //firing fireMethod  e.g scheduling color trick;
            [fireMethod fire];
            
        }
        
        if (time == 0) {
            //last second to finish

            [startButton setHidden:NO];
            [timeLabel setHidden:YES];
            [upImage setHidden:YES];
            [downImage setHidden:YES];
            [correctButton setHidden:YES];
            [wrongButton setHidden:YES];
            [upTextBox setHidden:YES];
            [downTextBox setHidden:YES];
            [rightYesNo setHidden:YES];
            [leftYesNo setHidden:YES];
            [scoreLabel setHidden:YES];
            [scoreLabelLeft setHidden:YES];
            [leftInfo setHidden:YES];
            [rightInfo setHidden:YES];
            [fireMethod invalidate];
            
            gameStarted = FALSE;
        }
        else{  //time decrease and timelabel
            timeLabel.text = [NSString stringWithFormat:@"%d",time];
            time --;
            
        }        
    }
    
}

-(void)sizeTrick:(NSTimer *)theTimer{
    //find capital or small letter
    smallCapital = arc4random()%2;
    if(smallCapital == 0){
        if(strInfo == stringEN){
            stringEN = @"which one is CAPITAL ?";
            strInfo = stringEN;
        }else{
            stringJP = @"大文字はどっち？";
            strInfo = stringJP;
        }
    }else{
        if(strInfo == stringEN){
            stringEN = @"which one is small?";
            strInfo = stringEN;
        }else{
            stringJP = @"小文字はどっち？";
            strInfo = stringJP;
        }

    }
        
    
    textBoxSelection = arc4random()%2;
    colorRand = arc4random() % 10;

    letterSelection1 = arc4random() % 9;
    letterSelection2 = arc4random() % 9;
    
    if(textBoxSelection == 1){
        left = TRUE;
        right = FALSE;

        up = TRUE;
        leftYesNo.image = rightYesNo.image = nil;
        downTextBox.text = nil;
 
        if (smallCapital == 0) {
            upTextBox.text = [capitalLetter objectAtIndex:letterSelection1];
            downTextBox.text = [smallLetter objectAtIndex:letterSelection2];

        }else{

            upTextBox.text = [smallLetter objectAtIndex:letterSelection1];            
            downTextBox.text = [capitalLetter objectAtIndex:letterSelection2];

        }
        
        upTextBox.textColor = [color objectAtIndex:colorRand];
        
        [upTextBox setFont:[UIFont fontWithName:@"Cochin" size:sizeFontSize]];
        
        [downTextBox setFont:[UIFont fontWithName:@"Cochin" size:sizeFontSize]];
        
        leftInfo.text = nil;
        rightInfo.text = strInfo;
        [rightInfo setFont:[UIFont fontWithName:@"Courier" size:infoFontSize]];
        [rightInfo setFont:[UIFont boldSystemFontOfSize:infoFontSize]];
        
    }else{
        right= TRUE;
        left = FALSE;
        up = FALSE;
        leftYesNo.image = rightYesNo.image = nil;
        upTextBox.text = nil;
        if (smallCapital == 0) {

            upTextBox.text = [smallLetter objectAtIndex:letterSelection1];
            downTextBox.text = [capitalLetter objectAtIndex:letterSelection2];
            
            
        }else{
            
            upTextBox.text = [capitalLetter objectAtIndex:letterSelection1];
            downTextBox.text = [smallLetter objectAtIndex:letterSelection2];
        }
        
        downTextBox.textColor = [color objectAtIndex:colorRand];
        [downTextBox setFont:[UIFont fontWithName:@"Cochin" size:sizeFontSize]];        
        [upTextBox setFont:[UIFont fontWithName:@"Cochin" size:sizeFontSize]];
        
        rightInfo.text = nil;
        
        leftInfo.text = strInfo;
        [leftInfo setFont:[UIFont fontWithName:@"Courier" size:infoFontSize]];
        [leftInfo setFont:[UIFont boldSystemFontOfSize:infoFontSize]];
    }
    
    countForYes ++ ;
}

- (void)viewDidUnload
{
    [self setUpTextBox:nil];
    [self setDownTextBox:nil];
    [self setRightInfo:nil];
    [self setLeftInfo:nil];
    [self setTimeLabel:nil];
    [self setScoreLabel:nil];
    [self setRightYesNo:nil];
    [self setLeftYesNo:nil];
    [self setDownImage:nil];
    [self setUpImage:nil];
    [self setCorrectButton:nil];
    [self setWrongButton:nil];
    [self setStartButton:nil];
    [self setScoreLabelLeft:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction)correct:(id)sender {
    if (gameIdentity == @"colorTrick") {
        
        if (colorRand == colorNameRand) {
            wrong = FALSE;
            [correctBuzz play];
            score+= 5;
            scoreLabel.text = [NSString stringWithFormat:@"%d",score];
            
            if (upTextBox.text == nil) {
                leftYesNo.image = [UIImage imageNamed:@"yes.png"];
            }
            else{
                rightYesNo.image = [UIImage imageNamed:@"yes.png"];
            }
            
        }
        else if (colorRand != colorNameRand) {
            wrong = TRUE;
            [wrongBuzz play];
            score-= 2;
            scoreLabel.text = [NSString stringWithFormat:@"%d",score];
            
            if (upTextBox.text == nil) {
                leftYesNo.image = [UIImage imageNamed:@"no.png"];
            }
            else{
                rightYesNo.image = [UIImage imageNamed:@"no.png"];
            }
        }
    }
    else if(gameIdentity == @"sizeTrick"){
        if (left == FALSE ) {
            
            wrong = TRUE;
            [wrongBuzz play];
            score-= 2;
            scoreLabel.text = [NSString stringWithFormat:@"%d",score];
            
            if (upTextBox.text == nil) {
                leftYesNo.image = [UIImage imageNamed:@"no.png"];
            }
            else{
                rightYesNo.image = [UIImage imageNamed:@"no.png"];
            }
        }
        else if(left == TRUE){
            wrong = FALSE;
            [correctBuzz play];
            score+= 5;
            scoreLabel.text = [NSString stringWithFormat:@"%d",score];
            
            if (upTextBox.text == nil) {
                leftYesNo.image = [UIImage imageNamed:@"yes.png"];
            }
            else{
                rightYesNo.image = [UIImage imageNamed:@"yes.png"];
            }

        }
        
    }
    
}

- (IBAction)wrong:(id)sender {
    if (gameIdentity == @"colorTrick") {
        if (colorRand != colorNameRand) {
            wrong = FALSE;
            [correctBuzz play];
            score+= 5;
            scoreLabel.text = [NSString stringWithFormat:@"%d",score];
            
            if (up == TRUE) {
                leftYesNo.image = [UIImage imageNamed:@"yes.png"];
            }
            else{
                rightYesNo.image = [UIImage imageNamed:@"yes.png"];
            }
        }
        else if (colorRand == colorNameRand) {
            wrong = TRUE;
            [wrongBuzz play];
            score-= 2;
            
            scoreLabel.text = [NSString stringWithFormat:@"%d",score];
            if (up == TRUE) {
                leftYesNo.image = [UIImage imageNamed:@"no.png"];
            }
            else{
                rightYesNo.image = [UIImage imageNamed:@"no.png"];
            }
        }

    }
    else if(gameIdentity == @"sizeTrick"){
         if (right == FALSE ) {
            wrong = TRUE;
            [wrongBuzz play];
            score-= 2;
            scoreLabel.text = [NSString stringWithFormat:@"%d",score];
                
            if (up == TRUE) {
                leftYesNo.image = [UIImage imageNamed:@"no.png"];
            }
            else{
                rightYesNo.image = [UIImage imageNamed:@"no.png"];
            }
        }
        else if(right == TRUE){
            wrong = FALSE;
            [correctBuzz play];
            score+= 5;
            scoreLabel.text = [NSString stringWithFormat:@"%d",score];
            
            if (up == TRUE) {
                leftYesNo.image = [UIImage imageNamed:@"yes.png"];
            }
            else{
                rightYesNo.image = [UIImage imageNamed:@"yes.png"];
            }
            
        }
    }
    
}


@end
