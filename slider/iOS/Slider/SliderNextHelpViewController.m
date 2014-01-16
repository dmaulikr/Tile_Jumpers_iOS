//
//  SliderNextHelpViewController.m
//  Slider
//
//  Created by Monte Christopher Jeu on 12/28/13.
//  Copyright (c) 2013 Monte Jeu. All rights reserved.
//

#import "SliderNextHelpViewController.h"

@interface SliderNextHelpViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *textBackgroundImage;
@property (strong,nonatomic) NSString *textBackgroundImageFile;
@property (strong, nonatomic) IBOutlet UIImageView *sliderHelpImages;
@property (weak, nonatomic) IBOutlet UIButton *sliderhelpexitbutton;

@end

@implementation SliderNextHelpViewController

- (IBAction)hideHelpScreen:(id)sender {
    self.view.superview.hidden=true;
    [self.textBackgroundImage setImage:nil];
    [self.sliderhelpexitbutton setBackgroundImage:nil forState:UIControlStateNormal];
    self.sliderHelpImages.animationImages=nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL) loadImages {
    [self.textBackgroundImage setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"sliderhelptextbackground" ofType:@"png"]]];

    [self.sliderHelpImages setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"slidernexthelp1" ofType:@"png"]]];

    [self.sliderhelpexitbutton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"exit" ofType:@"png"]] forState:UIControlStateNormal];
    [self.view bringSubviewToFront:self.sliderhelpexitbutton];
    
    return true;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
