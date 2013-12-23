//
//  SliderViewController.m
//  Slider
//
//  Created by Monte Jeu on 9/27/13.
//  Copyright (c) 2013 Monte Jeu. All rights reserved.
//
#import "SliderViewController.h"
#import "SliderHelpViewController.h"
#import "Board.h"

@interface SliderViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tileButtons;
@property (strong, nonatomic) IBOutlet UILabel *moves;
@property (strong, nonatomic) IBOutlet UILabel *solved;
@property (strong, nonatomic) IBOutlet UIView *sliderHelpView;
@property (strong, nonatomic) Board *board;
@property (strong, nonatomic) SliderHelpViewController *sliderHelpViewController;
@property (nonatomic) NSTimeInterval startTime;
@property (nonatomic) NSTimeInterval endTime;
@property (strong, nonatomic) IBOutlet UIImageView *sliderBackground;
@property (strong, nonatomic) IBOutlet UIButton *sliderBackButton;
@property (strong, nonatomic) IBOutlet UIButton *sliderResetButton;
@property (strong, nonatomic) IBOutlet UIButton *sliderHelpButton;

@end

@implementation SliderViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual:@"sliderHelpSegue"]) {
        self.sliderHelpViewController = [segue destinationViewController];
    }
}

- (IBAction)showHelpScreen:(id)sender {
    [self.sliderHelpViewController loadImages];
    self.sliderHelpView.hidden = false;
}

- (IBAction)resetBoard:(UIButton *)sender {
    self.board = nil;
    int i = 0;
    for (UIButton *tileButton in self.tileButtons) {
        [tileButton setTitle:[Board validValues][0] forState:UIControlStateNormal];
        
        [tileButton setTitle:self.board.current[i] forState:UIControlStateNormal];
        i++;
    }
    [self updateLabels];
}

- (IBAction)moveTile:(UIButton *)sender {
    if(self.board.solved == true)
        return;
    
    if([self.board moveSliderBasic: sender.currentTitle]) {
        NSInteger i=0;
        for (UIButton *tileButton in self.tileButtons) {
            [tileButton setTitle:self.board.current[i] forState:UIControlStateNormal];
            i++;
        }
        [self updateLabels];
    }
}

- (Board *) board {
    if (!_board) {
        _board = [[Board alloc]init];
        self.startTime = [NSDate timeIntervalSinceReferenceDate];
    }
    
    return _board;
}

- (void) setTileButtons:(NSArray *)tileButtons {
    int i = 0;

    _tileButtons = tileButtons;
    for (UIButton *tileButton in tileButtons) {
        [tileButton setTitle:self.board.current[i] forState:UIControlStateNormal];
        i++;
    }
}


- (void)viewDidLoad
{

    [self updateLabels];
    self.sliderBackground.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"back1_s" ofType:@"png"]];
    [self.sliderBackButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"back" ofType:@"png"]] forState:UIControlStateNormal];
    [self.sliderResetButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"reset" ofType:@"png"]] forState:UIControlStateNormal];
    [self.sliderHelpButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"help" ofType:@"png"]] forState:UIControlStateNormal];
    for (UIButton *tileButton in self.tileButtons) {
        [tileButton setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"tile_1" ofType:@"png"]] forState:UIControlStateNormal];
    }

    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if ([[UIScreen mainScreen]bounds].size.height == 568.0) {
        
    }
    
}

- (void) updateLabels {
    self.moves.text = [NSString stringWithFormat: @"Moves: %d", self.board.moves];
    
    if ([self.board solved] == TRUE) {
        self.endTime = [NSDate timeIntervalSinceReferenceDate];
        NSInteger solveTime = self.endTime - self.startTime;
        if (solveTime > 9999) {
            solveTime = 9999;
        }
        if (solveTime == 9999) {
            self.solved.text = @"Solved!";
        } else {
            self.solved.text = [NSString stringWithFormat: @"Solved in %d seconds!", solveTime];
        }
    }
    else
        self.solved.text = @"";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
