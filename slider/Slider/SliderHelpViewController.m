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

@end

@implementation SliderHelpViewController

- (IBAction)hideHelpScreen:(id)sender {
    self.view.superview.hidden=true;
    [self.textBackgroundImage setImage:nil];
    

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
    self.textBackgroundImageFile = @"white280x100.png";
    [self.textBackgroundImage setImage:[UIImage imageNamed:self.textBackgroundImageFile]];
    
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
