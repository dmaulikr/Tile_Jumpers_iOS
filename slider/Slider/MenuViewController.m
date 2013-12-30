//
//  MenuViewController.m
//  Slider
//
//  Created by Monte Jeu on 11/2/13.
//  Copyright (c) 2013 Monte Jeu. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
@property (strong, nonatomic) IBOutlet UIButton *sliderButton;
@property (strong, nonatomic) IBOutlet UIButton *sliderPlusButton;
@end

@implementation MenuViewController

- (IBAction)button:(id)sender {
    
    
}


- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)unwindSegue
{
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[self.sliderButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"grey72x43" ofType:@"png"]] forState:UIControlStateNormal];
    //[self.sliderPlusButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"grey72x43" ofType:@"png"]] forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
