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
        validValues = @[@"  ",@" 1",@" 2",@" 3",@" 4",@" 5",@" 6",@" 7",@" 8",@" 9",@"10",@"11",@"12",@"13",@"14",@"15"];
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

- (BOOL) solved {
    NSInteger i;
    
    for (i = 0; i < 15; i++) {
        if (![self.current[i] isEqual: [Board validValues][i+1] ] )
            return FALSE;
    }
    return TRUE;
}

- (BOOL) solvable {
    NSMutableArray *tile;
    NSInteger inversions=0;
    NSInteger j= 16;
    NSInteger i;
    NSInteger x;
    NSInteger y;
    
    tile = [[NSMutableArray alloc] init];
   
    [tile addObject:@"-1"];
    for(i = 0; i < 16; i++) {
        [tile addObject:self.current[i]];
    }
    
    for(i = 1; i < 17; i++) {
        if([tile[i] isEqual: [Board validValues][0]]) {
            j = i;
        }
    }
    if(j != 16) {
        if(j < 13) {
            for(; j < 13; j = j + 4) {
                [tile replaceObjectAtIndex:j withObject: tile[j + 4]];
                [tile replaceObjectAtIndex:j + 4 withObject:[Board validValues][0]];
            }
        }
        for(; j < 16; j++) {
            [tile replaceObjectAtIndex:j withObject: tile[j + 1]];
            [tile replaceObjectAtIndex:j + 1 withObject:[Board validValues][0]];
        }
    }
    for(x = 1; x < 16; x++) {
        for(y = x + 1; y < 16; y++) {
            if(tile[x] > tile[y]) {
                inversions++;
            }
        }
    }
    
    [tile removeAllObjects];
                              
    if(inversions % 2 == 0) {
        return TRUE;
    } else {
        return FALSE;
    }
    
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
