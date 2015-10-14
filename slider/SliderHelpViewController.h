//
//  SliderHelpViewController.h
//  Slider
//
//  Created by Monte Christopher Jeu on 5/10/15.
//  Copyright (c) 2015 Monte Jeu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Board.h"

@interface SliderHelpViewController : UIViewController

@property (weak, nonatomic) Board *board;
-(BOOL) loadImages;

@end
