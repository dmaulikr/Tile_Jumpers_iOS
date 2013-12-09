//
//  SliderPlusViewController.m
//  Slider
//
//  Created by Monte Jeu on 11/16/13.
//  Copyright (c) 2013 Monte Jeu. All rights reserved.
//

#import "SliderPlusViewController.h"
#import "Board.h"

@interface SliderPlusViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tileButtons;
@property (strong, nonatomic) IBOutlet UILabel *moves;
@property (strong, nonatomic) IBOutlet UILabel *solved;
@property (strong, nonatomic) Board *board;
@property (nonatomic) NSInteger trans_one;
@property (nonatomic) NSInteger trans_two;
@property (nonatomic) NSTimeInterval startTime;
@property (nonatomic) NSTimeInterval endTime;

@end

@implementation SliderPlusViewController


- (IBAction)resetBoard:(UIButton *)sender {
    self.board = nil;
    int i = 0;
    for (UIButton *tileButton in self.tileButtons) {
        [tileButton setTitle:[Board validValues][0] forState:UIControlStateSelected];
        [tileButton setTitle:[Board validValues][0] forState:UIControlStateNormal];
        
        [tileButton setTitle:self.board.current[i] forState:UIControlStateSelected];
        [tileButton setTitle:self.board.current[i] forState:UIControlStateNormal];

        if(self.board.transport_two == i || self.board.transport_one == i) {
            [tileButton setBackgroundImage:[UIImage imageNamed:@"red60x60.png"] forState:UIControlStateSelected];
            [tileButton setBackgroundImage:[UIImage imageNamed:@"red60x60.png"] forState:UIControlStateNormal];
        } else {
            [tileButton setBackgroundImage:[UIImage imageNamed:@"blue60x60.png"] forState:UIControlStateSelected];
            [tileButton setBackgroundImage:[UIImage imageNamed:@"blue60x60.png"] forState:UIControlStateNormal];
        }
        i++;
    }
    [self updateLabels];
}

- (IBAction)moveTile:(UIButton *)sender {
    if(self.board.solved == true)
        return;
    
    if([self.board moveSliderPlus: sender.currentTitle]) {
        NSInteger i=0;
        for (UIButton *tileButton in self.tileButtons) {
            [tileButton setTitle:self.board.current[i] forState:UIControlStateSelected];
            [tileButton setTitle:self.board.current[i] forState:UIControlStateNormal];
            if(self.board.transport_two == i || self.board.transport_one == i) {
                [tileButton setBackgroundImage:[UIImage imageNamed:@"red60x60.png"] forState:UIControlStateSelected];
                [tileButton setBackgroundImage:[UIImage imageNamed:@"red60x60.png"] forState:UIControlStateNormal];
            } else {
                [tileButton setBackgroundImage:[UIImage imageNamed:@"blue60x60.png"] forState:UIControlStateSelected];
                [tileButton setBackgroundImage:[UIImage imageNamed:@"blue60x60.png"] forState:UIControlStateNormal];
            }
            i++;
        }
        [self updateLabels];
    }
}


- (Board *) board {
    if (!_board) {
        _board = [[Board alloc]initWithName:true];
        self.startTime = [NSDate timeIntervalSinceReferenceDate];
    }

    return _board;
}

- (void) setTileButtons:(NSArray *)tileButtons {
    int i = 0;
    
    _tileButtons = tileButtons;
    for (UIButton *tileButton in tileButtons) {
        [tileButton setTitle:self.board.current[i] forState:UIControlStateSelected];
        [tileButton setTitle:self.board.current[i] forState:UIControlStateNormal];
 
        if(self.board.transport_two == i || self.board.transport_one == i) {
            [tileButton setBackgroundImage:[UIImage imageNamed:@"red60x60.png"] forState:UIControlStateSelected];
            [tileButton setBackgroundImage:[UIImage imageNamed:@"red60x60.png"] forState:UIControlStateNormal];
        } else {
            [tileButton setBackgroundImage:[UIImage imageNamed:@"blue60x60.png"] forState:UIControlStateSelected];
            [tileButton setBackgroundImage:[UIImage imageNamed:@"blue60x60.png"] forState:UIControlStateNormal];
        }
        i++;
    }
    
    
}


- (void)viewDidLoad
{
    [self updateLabels];
    
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
        if (solveTime > 999) {
            solveTime = 999;
        }
        self.solved.text = [NSString stringWithFormat: @"Solved! %d seconds.", solveTime];

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
