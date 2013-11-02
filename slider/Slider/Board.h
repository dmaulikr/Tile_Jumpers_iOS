//
//  Board.h
//  Slider
//
//  Created by Monte Jeu on 9/28/13.
//  Copyright (c) 2013 Monte Jeu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"

@interface Board : NSObject

- (void) addTile:(Tile *)tile;

- (BOOL) solvable;

@property (strong,nonatomic) NSMutableArray *current;

+ (NSArray *) validValues;

@end
