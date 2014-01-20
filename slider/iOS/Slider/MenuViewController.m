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
@property (strong, nonatomic) IBOutlet UIButton *sliderNextButton;
@property (strong, nonatomic) IBOutlet UIButton *sliderFinalButton;
@end

@implementation MenuViewController

- (IBAction)button:(id)sender {
    
    
}


- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)unwindSegue
{
    NSString *mydata = [self sliderbasicsolved];
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:mydata];
    if (!fileExists) {
        [self.sliderPlusButton setUserInteractionEnabled:FALSE];
        [self.sliderPlusButton setTitle:nil forState:UIControlStateNormal];
        [self.sliderPlusButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"locked" ofType:@"png"]]forState:UIControlStateNormal];
        
    } else {
        [self.sliderPlusButton setUserInteractionEnabled:TRUE];
        [self.sliderPlusButton setTitle:@"Plus" forState:UIControlStateNormal];
        [self.sliderPlusButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"menu_2" ofType:@"png"]]forState:UIControlStateNormal];
    }
    
    mydata = [self sliderplussolved];
    fileExists = [[NSFileManager defaultManager] fileExistsAtPath:mydata];
    if (!fileExists) {
        [self.sliderNextButton setUserInteractionEnabled:FALSE];
        [self.sliderNextButton setTitle:nil forState:UIControlStateNormal];
        [self.sliderNextButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"locked" ofType:@"png"]]forState:UIControlStateNormal];
    } else {
        [self.sliderNextButton setUserInteractionEnabled:TRUE];
        [self.sliderNextButton setTitle:@"Next" forState:UIControlStateNormal];
        [self.sliderNextButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"menu_3" ofType:@"png"]]forState:UIControlStateNormal];
    }
    
    mydata = [self slidernextsolved];
    fileExists = [[NSFileManager defaultManager] fileExistsAtPath:mydata];
    if (!fileExists) {
        [self.sliderFinalButton setUserInteractionEnabled:FALSE];
        [self.sliderFinalButton setTitle:nil forState:UIControlStateNormal];
        [self.sliderFinalButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"locked" ofType:@"png"]]forState:UIControlStateNormal];
    } else {
        [self.sliderFinalButton setUserInteractionEnabled:TRUE];
        [self.sliderFinalButton setTitle:@"Final" forState:UIControlStateNormal];
        [self.sliderFinalButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"menu_4" ofType:@"png"]]forState:UIControlStateNormal];
    }
    
    [self.sliderButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"menu_1" ofType:@"png"]]forState:UIControlStateNormal];

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
    
    NSString *mydata = [self sliderbasicsolved];
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:mydata];
    if (!fileExists) {
        [self.sliderPlusButton setUserInteractionEnabled:FALSE];
        [self.sliderPlusButton setTitle:nil forState:UIControlStateNormal];
        [self.sliderPlusButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"locked" ofType:@"png"]]forState:UIControlStateNormal];
        
    } else {
        [self.sliderPlusButton setUserInteractionEnabled:TRUE];
        [self.sliderPlusButton setTitle:@"Plus" forState:UIControlStateNormal];
        [self.sliderPlusButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"menu_2" ofType:@"png"]]forState:UIControlStateNormal];
    }
    
    mydata = [self sliderplussolved];
    fileExists = [[NSFileManager defaultManager] fileExistsAtPath:mydata];
    if (!fileExists) {
        [self.sliderNextButton setUserInteractionEnabled:FALSE];
        [self.sliderNextButton setTitle:nil forState:UIControlStateNormal];
        [self.sliderNextButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"locked" ofType:@"png"]]forState:UIControlStateNormal];
    } else {
        [self.sliderNextButton setUserInteractionEnabled:TRUE];
        [self.sliderNextButton setTitle:@"Next" forState:UIControlStateNormal];
        [self.sliderNextButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"menu_3" ofType:@"png"]]forState:UIControlStateNormal];
    }
    
    mydata = [self slidernextsolved];
    fileExists = [[NSFileManager defaultManager] fileExistsAtPath:mydata];
    if (!fileExists) {
        [self.sliderFinalButton setUserInteractionEnabled:FALSE];
        [self.sliderFinalButton setTitle:nil forState:UIControlStateNormal];
        [self.sliderFinalButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"locked" ofType:@"png"]]forState:UIControlStateNormal];
    } else {
        [self.sliderFinalButton setUserInteractionEnabled:TRUE];
        [self.sliderFinalButton setTitle:@"Final" forState:UIControlStateNormal];
        [self.sliderFinalButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"menu_4" ofType:@"png"]]forState:UIControlStateNormal];
    }
    
    [self.sliderButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"menu_1" ofType:@"png"]]forState:UIControlStateNormal];
 
}

- (NSString *) sliderbasicsolved
{
	NSArray *path =
	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
	return [[path objectAtIndex:0] stringByAppendingPathComponent:@"sliderbasic.plist"];
    
}

- (NSString *) sliderplussolved
{
	NSArray *path =
	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
	return [[path objectAtIndex:0] stringByAppendingPathComponent:@"sliderplussolved.plist"];
    
}

- (NSString *) slidernextsolved
{
	NSArray *path =
	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
	return [[path objectAtIndex:0] stringByAppendingPathComponent:@"slidernextsolved.plist"];
    
}

- (NSString *) sliderfinalsolved
{
	NSArray *path =
	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
	return [[path objectAtIndex:0] stringByAppendingPathComponent:@"sliderfinalsolved.plist"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
