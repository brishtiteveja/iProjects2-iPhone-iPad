//
//  VisionTest.m
//  Tune Ur Vision
//
//  Created by ananda on 12/02/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "VisionTest.h"


@implementation VisionTest
@synthesize Time;
@synthesize imageView;
@synthesize YesNoImageView;
@synthesize startContinueButton;

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
{/Users/ananda/Documents/Iphone-Ipad/Tune Ur Vision/Tune Ur Vision/VisionTest.h
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    contin = TRUE;
    ImgType = 0;
    settingTab = (settings*)[self.tabBarController.viewControllers objectAtIndex:2];
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setYesNoImageView:nil];
    [self setStartContinueButton:nil];
    [self setTime:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (void) startGame{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(GameLoop:)  userInfo:nil repeats:YES];
}

- (void)GameLoop:(NSTimer*)theTimer{
    
    if (self.tabBarController.selectedIndex == 0 && contin) 
    {
        
        if (settingTab.faceS.on) {
            ImgType = 0;
        }else if(settingTab.planetS.on){
            ImgType = 1;
        }else if(settingTab.socialS.on)
            ImgType = 2;
        
        if(ImgType == 0){
            randomImg = arc4random() % 6 + 1;
            
            randomImgName =[NSString stringWithFormat:@"face%d.png",randomImg];
            
        }else if(ImgType== 1){
            randomImg = arc4random() % 6 + 1;
            randomImgName =[NSString stringWithFormat:@"planet%d.png",randomImg];
        }
        else if(ImgType == 2){
            randomImg =  arc4random() % 8 + 1;
            randomImgName =[NSString stringWithFormat:@"social%d.png",randomImg];            
        }

        if (countTime > 0) {
            countTime--;
            self.imageView.image = [UIImage imageNamed:randomImgName];
            [self.Time setText:[NSString stringWithFormat:@"%d",countTime]];
        }else{
            [self.startContinueButton setHidden:TRUE];
            self.imageView.image = nil;
        }
                
        
    }
    else{
        contin = false;
    }
}

- (IBAction)startContinueGame:(id)sender {    
    contin = TRUE; 
    countTime = 120;
    [Time setText:@"120"];
    [self.startContinueButton setHidden:TRUE];
    NSLog(@"touched");
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(GameLoop:)  userInfo:nil repeats:YES];
    
}

- (IBAction)correct:(id)sender {
    self.YesNoImageView.image = [UIImage imageNamed:@"yes.png"];
    
}

- (IBAction)wrong:(id)sender {
    self.YesNoImageView.image = nil;

}



@end
