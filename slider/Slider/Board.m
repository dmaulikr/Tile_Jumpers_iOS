//
//  Board.m
//  Slider
//
//  Created by Monte Jeu on 9/28/13.
//  Copyright (c) 2013 Monte Jeu. All rights reserved.
//

#import "Board.h"

@interface Board()
@property (strong, nonatomic) NSMutableArray *tiles;
@end

@implementation Board

+ (NSArray *) validValues {
    static NSArray *validValues = nil;
    if (!validValues)
        validValues = @[@"  ",@" 1",@" 2",@" 3",@" 4",@" 5",@" 6",@" 7",@" 8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"];
    return validValues;
}

- (NSMutableArray *) tiles {
    if (!_tiles) _tiles = [[NSMutableArray alloc]init];
    return _tiles;
}

- (NSMutableArray *) current {
    if (!_current) _current = [[NSMutableArray alloc]init];
    return _current;
}

- (void)addTile:(Tile *)tile {
    [self.tiles addObject:tile];
}

- (Tile *) getRandomTile {
    Tile *randomTile;
    if (self.tiles.count) {
        unsigned index = arc4random() % self.tiles.count;
        randomTile = self.tiles[index];
        [self.tiles removeObjectAtIndex:index];
    }
    return randomTile;
}

- (BOOL) solvable {
    return TRUE;
    
}

- (id)init {
    self = [super init];
    
    if(self) {
        for ( int i=0; i < 16; i++) {
            Tile *tile = [[Tile alloc] init];
            tile.value = i;
            [self addTile:tile];
        }
    }
    for ( int i=0; i < 16; i++) {
        Tile *tile = self.getRandomTile;
        [self.current addObject:[Board validValues][tile.value]];
    }
    
    return self;
}

@end
