//
//  SliderHelpViewController.m
//  Slider
//
//  Created by Monte Jeu on 11/24/13.
//  Copyright (c) 2013 Monte Jeu. All rights reserved.
//

#import "SliderHelpViewController.h"

@interface SliderHelpViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *textBackgroundImage;
@property (strong,nonatomic) NSString *textBackgroundImageFile;
@property (strong, nonatomic) IBOutlet UIImageView *sliderHelpImages;
@property (weak, nonatomic) IBOutlet UIButton *sliderhelpexitbutton;

@end

@implementation SliderHelpViewController

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

    NSArray *imageNames = @[@"sliderhelp1", @"sliderhelp2", @"sliderhelp1", @"sliderhelp2", @"sliderhelp1", @"sliderhelp2",
                            @"sliderhelp3", @"sliderhelp4", @"sliderhelp3", @"sliderhelp4",];

    NSMutableArray *images = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:[imageNames objectAtIndex:i] ofType:@"png"]]];
    }
    self.sliderHelpImages.animationImages = images;
    self.sliderHelpImages.animationDuration = 20;
    [self.view addSubview:self.sliderHelpImages];
    [self.sliderHelpImages startAnimating];
    

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
