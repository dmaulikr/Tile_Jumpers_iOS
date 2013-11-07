//
//  SliderViewController.m
//  Slider
//
//  Created by Monte Jeu on 9/27/13.
//  Copyright (c) 2013 Monte Jeu. All rights reserved.
//

#import "SliderViewController.h"
#import "Board.h"

@interface SliderViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tileButtons;
@property (strong, nonatomic) IBOutlet UILabel *solvable;
@property (strong, nonatomic) IBOutlet UILabel *solved;
@property (strong, nonatomic) Board *board;
@end

@implementation SliderViewController

- (IBAction)unwindToSliderViewController:(UIStoryboardSegue *)unwindSegue
{

}

- (IBAction)resetBoard:(UIButton *)sender {
    self.board = nil;
    int i = 0;
    for (UIButton *tileButton in self.tileButtons) {
        [tileButton setTitle:[Board validValues][0] forState:UIControlStateSelected];
        [tileButton setTitle:[Board validValues][0] forState:UIControlStateNormal];
        
        [tileButton setTitle:self.board.current[i] forState:UIControlStateSelected];
        [tileButton setTitle:self.board.current[i] forState:UIControlStateNormal];
        i++;
    }
    [self updateLabels];
}

- (IBAction)moveTile:(UIButton *)sender {
    if ( ![sender.currentTitle isEqualToString: [Board validValues][0]]) {
        NSInteger i = [self.board.current indexOfObject:sender.currentTitle];
        NSInteger j = [self.board.current indexOfObject:[Board validValues][0]];
        
        BOOL validMove = false;
        
        if (i == 0) {
            if (j == 1 || j == 4) {
                validMove = true;
            }
        }
        else if (i == 1) {
            if (j == 0 || j == 2 || j == 5) {
                validMove = true;
            }
        }
        else if (i == 2) {
            if (j == 1 || j == 3 || j == 6) {
                validMove = true;
            }
        }
        else if (i == 3) {
            if (j == 2 || j == 7) {
                validMove = true;
            }
        }
        
        else if (i == 4) {
            if (j == 0 || j == 5 || j == 8) {
                validMove = true;
            }
        }
        else if (i == 5) {
            if (j == 1 || j == 4 || j == 6 || j == 9) {
                validMove = true;
            }
        }
        else if (i == 6) {
            if (j == 2 || j == 5 || j == 7 || j == 10) {
                validMove = true;
            }
        }
        else if (i == 7) {
            if (j == 3 || j == 6 || j == 11) {
                validMove = true;
            }
        }
        
        else if (i == 8) {
            if (j == 4 || j == 9 || j == 12) {
                validMove = true;
            }
        }
        else if (i == 9) {
            if (j == 5 || j == 8 || j == 10 || j == 13) {
                validMove = true;
            }
        }
        else if (i == 10) {
            if (j == 6 || j == 9 || j == 11 || j == 14) {
                validMove = true;
            }
        }
        else if (i == 11) {
            if (j == 7 || j == 10 || j == 15) {
                validMove = true;
            }
        }
        
        else if (i == 12) {
            if (j == 8 || j == 13) {
                validMove = true;
            }
        }
        else if (i == 13) {
            if (j == 9 || j == 12 || j == 14) {
                validMove = true;
            }
        }
        else if (i == 14) {
            if (j == 10 || j == 13 || j == 15) {
                validMove = true;
            }
        }
        else if (i == 15) {
            if (j == 11 || j == 14) {
                validMove = true;
            }
        }
        if (validMove == true) {
            
            UIButton *blankButton;
            
            for (UIButton *tileButton in self.tileButtons) {
                if ([tileButton.currentTitle isEqualToString:[Board validValues][0]]) {
                    blankButton = tileButton;
                }
            }
            [blankButton setTitle:sender.currentTitle forState:UIControlStateSelected];
            [blankButton setTitle:sender.currentTitle forState:UIControlStateNormal];
            [self.board.current replaceObjectAtIndex:j withObject: sender.currentTitle];
            
            [sender setTitle:[Board validValues][0] forState:UIControlStateNormal];
            [sender setTitle:[Board validValues][0] forState:UIControlStateSelected];
            [self.board.current replaceObjectAtIndex:i withObject: [Board validValues][0]];
        }
        
    }
    [self updateLabels];
}

- (Board *) board {
    if (!_board)
       _board = [[Board alloc]init];
    
    return _board;
}

- (void) setTileButtons:(NSArray *)tileButtons {
    int i = 0;

    _tileButtons = tileButtons;
    for (UIButton *tileButton in tileButtons) {
        [tileButton setTitle:self.board.current[i] forState:UIControlStateSelected];
        [tileButton setTitle:self.board.current[i] forState:UIControlStateNormal];
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
    if ([self.board solvable] == TRUE)
        self.solvable.text = @"Solvable";
    else
        self.solvable.text = @"Unsolvable";
    
    
    if ([self.board solved] == TRUE)
        self.solved.text = @"Solved";
    else
        self.solved.text = @"Unsolved";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
