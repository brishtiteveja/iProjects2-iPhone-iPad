//
//  settings.m
//  Tune Ur Vision
//
//  Created by ananda on 12/02/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "settings.h"

@implementation settings
@synthesize faceS;
@synthesize planetS;
@synthesize socialS;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    [super viewDidLoad];
    
    
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
    thisAppDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    [faceS setOn:TRUE];
    [planetS setOn:FALSE];
    [socialS setOn:FALSE];    
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [self setFaceS:nil];
    [self setPlanetS:nil];
    [self setSocialS:nil];
    [self setSocialS:nil];
    [self setPlanetS:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (void)viewDidAppear:(BOOL)animated{
    VisionTest* vision= (VisionTest*)[self.tabBarController.viewControllers objectAtIndex:0];
    [[vision imageView] setImage:nil];
    [[vision startContinueButton]setHidden:FALSE];   
    [[vision startContinueButton] setTitle:@"Continue" forState:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated{
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction)soundOnOff:(id)sender {
    
    if ([[thisAppDelegate player] isPlaying]) {
        [[thisAppDelegate player] stop];
    }    
    else
        [[thisAppDelegate player]play];
    NSLog(@"sound on/off state changed");
}

- (IBAction)faceSwitch:(id)sender {
    [faceS setOn:TRUE];
    [planetS setOn:FALSE];
    [socialS setOn:FALSE];
}

- (IBAction)planetSwitch:(id)sender {
    [planetS setOn:TRUE];
    [socialS setOn:FALSE];
    [faceS setOn:FALSE];

}

- (IBAction)socialSwitch:(id)sender {
    [socialS setOn:TRUE];

    [planetS setOn:FALSE];
    [faceS setOn:FALSE];
}
@end
