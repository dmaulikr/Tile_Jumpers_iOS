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
    if([self.board moveSliderBasic: sender.currentTitle]) {
        UIButton *blankButton;

        for (UIButton *tileButton in self.tileButtons) {
            if ([tileButton.currentTitle isEqualToString:[Board validValues][0]]) {
                blankButton = tileButton;
            }
        }
        NSInteger i = [self.board.current indexOfObject:sender.currentTitle];
        NSInteger j = [self.board.current indexOfObject:[Board validValues][0]];
        
        [blankButton setTitle:sender.currentTitle forState:UIControlStateSelected];
        [blankButton setTitle:sender.currentTitle forState:UIControlStateNormal];
        [self.board.current replaceObjectAtIndex:j withObject: sender.currentTitle];
        
        [sender setTitle:[Board validValues][0] forState:UIControlStateNormal];
        [sender setTitle:[Board validValues][0] forState:UIControlStateSelected];
        [self.board.current replaceObjectAtIndex:i withObject: [Board validValues][0]];
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
    else {
        self.solvable.text = @"Unsolvable";  
    }
    
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
