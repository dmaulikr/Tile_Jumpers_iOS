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

- (BOOL) moveSliderBasic:(NSString *) tile {
    BOOL validMove = false;
    
    if ( ![tile isEqualToString: [Board validValues][0]]) {
        NSInteger i = [self.current indexOfObject:tile];
        NSInteger j = [self.current indexOfObject:[Board validValues][0]];
        
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
    }
    return validMove;
}

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
