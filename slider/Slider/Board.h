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

@property (nonatomic) NSInteger block_one;
@property (nonatomic) NSInteger block_two;
@property (nonatomic) NSInteger transport_one;
@property (nonatomic) NSInteger transport_two;
@property (strong,nonatomic) NSMutableArray *current;
@property (nonatomic) NSInteger moves;
@property (nonatomic) NSInteger solvability;

- (void) addTile:(Tile *)tile;
- (BOOL) moveSliderBasic:(NSString *) tile;
- (BOOL) moveSliderPlus:(NSString *) tile;
- (BOOL) moveSliderNext:(NSString *) tile;
- (BOOL) solvable;
- (BOOL) solved;
- (id) initWithName:(bool)transport block:(bool) block;
+ (NSArray *) validValues;

@end
