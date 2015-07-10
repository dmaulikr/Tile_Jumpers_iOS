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
    NSInteger i;
    NSInteger j;
    
    if ( ![tile isEqualToString: [Board validValues][0]]) {
        i = [self.current indexOfObject:tile];
        j = [self.current indexOfObject:[Board validValues][0]];
        
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
    
    if ( validMove == true ) {
        self.moves++;
        
        self.current[j] = self.current[i];
        self.current[i] = [Board validValues][0];
        
    }
    return validMove;
}

- (BOOL) moveSliderPlus:(NSString *) tile {
    BOOL validMove = false;
    
    if ( [tile isEqualToString: self.current[self.transport_one]] ) {
        self.current[self.transport_one] = self.current[self.transport_two];
        self.current[self.transport_two] = tile;
        self.moves++;
        validMove = true;
    } else if ([tile isEqualToString: self.current[self.transport_two]]) {
        self.current[self.transport_two] = self.current[self.transport_one];
        self.current[self.transport_one] = tile;
        self.moves++;
        validMove = true;
    } else {
        validMove = [self moveSliderBasic:tile];
    }
    if(validMove == true) {
        [self getTransports];
    }
    return validMove;
}

- (BOOL) moveSliderNext:(NSString *) tile {
    BOOL validMove = false;
    
    if (!([tile isEqualToString: self.current[self.block_one]] || [tile isEqualToString: self.current[self.block_two]])) {
        validMove = [self moveSliderBasic:tile];
    }
    if(validMove == true) {
        [self getBlocks];
    }
    return validMove;
}

- (BOOL) moveSliderFinal:(NSString *) tile {
    BOOL validMove = false;
    
    if (!([tile isEqualToString: self.current[self.block_one]] || [tile isEqualToString: self.current[self.block_two]])) {
        validMove = [self moveSliderPlus:tile];
    }
    if(validMove == true) {
        [self getBlocks];
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

-(void) getTransports
{
    self.transport_one = arc4random() % 16;
    self.transport_two = arc4random() % 16;
    
    while (self.current[self.transport_one] == [Board validValues][0]) {
        self.transport_one = arc4random() % 16;
    }
    while (self.current[self.transport_two] == [Board validValues][0] || self.transport_one == self.transport_two ) {
        self.transport_two = arc4random() % 16;
    }
}

-(void) getBlocks
{
    self.block_one = arc4random() % 16;
    self.block_two = arc4random() % 16;

    bool solvable = false;
    
    while (!solvable) {
        solvable = true;

        if(self.transport_one == -1) {
            if ( (self.block_one == 1 && self.block_two == 4) || (self.block_one == 4 && self.block_two == 1 ) ) {
                if (self.current[0] == [Board validValues][0]) {
                    solvable = false;
                }
            }
            
            if ( (self.block_one == 2 && self.block_two == 7 ) || (self.block_one == 7 && self.block_two == 1 ) ){
                if (self.current[3] == [Board validValues][0]) {
                    solvable = false;
                }
            }
            
            if ( (self.block_one == 8 && self.block_two == 13 ) || (self.block_one == 13 && self.block_two == 8 ) ){
                if (self.current[12] == [Board validValues][0]) {
                    solvable = false;
                }
            }
            
            if ( (self.block_one == 11 && self.block_two == 14 ) || (self.block_one == 14 && self.block_two == 11 ) ){
                if (self.current[15] == [Board validValues][0]) {
                    solvable = false;
                }
            }
        }

        if(self.block_one == self.transport_one || self.block_one == self.transport_two) {
            solvable = false;
        }
        
        if(self.block_two == self.transport_one || self.block_two == self.transport_two) {
            solvable = false;
        }
        
        if(self.current[self.block_one] == self.current[self.block_two]) {
            solvable = false;
        }
        
        if(self.current[self.block_two] == [Board validValues][0]) {
            solvable = false;
        }
        
        if(self.current[self.block_one] == [Board validValues][0]) {
            solvable = false;
        }

        if(solvable == false) {
            self.block_one = arc4random() % 16;
            self.block_two = arc4random() % 16;
        }
    }
    
}


-(id)initWithName:(bool) transport block:(bool)block
{
    self = [super init];
    self.block_one = -1;
    self.block_two = -1;
    self.transport_one = -1;
    self.transport_two = -1;
    if (self) {
        int MAX_SOLVIBILITY = 2;
        self.solvability = MAX_SOLVIBILITY;
        while (self.solvability >= MAX_SOLVIBILITY) {
            self.solvability = 0;
            
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
            
            if(transport != true) {
                if(!self.solvable) {
                    if(self.current[0] == [Board validValues][0] || self.current[1] == [Board validValues][0]) {
                        NSString *temp = self.current[3];
                        [self.current replaceObjectAtIndex:3 withObject:self.current[4]];
                        [self.current replaceObjectAtIndex:4 withObject:temp];
                    } else {
                        NSString *temp = self.current[0];
                        [self.current replaceObjectAtIndex:0 withObject:self.current[1]];
                        [self.current replaceObjectAtIndex:1 withObject:temp];
                        
                    }
                }
            }
            
            if (transport == true) {
                [self getTransports];
            }
            
            if (block == true) {
                [self getBlocks];
            }
            
            for (int i=0; i<15; i++) {
                if (self.current[i]==[Board validValues][i+1]) {
                    self.solvability++;
                }
                
            }
            if (self.solvability >= MAX_SOLVIBILITY) {
                [self.current removeAllObjects];
                [self.tiles removeAllObjects];
            }
        }
    }
    self.moves = 0;
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        int MAX_SOLVIBILITY = 2;
        self.solvability = MAX_SOLVIBILITY;
        while (self.solvability >= MAX_SOLVIBILITY) {
            self.solvability = 0;
            
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
            
            if(!self.solvable) {
                if(self.current[0] == [Board validValues][0] || self.current[1] == [Board validValues][0]) {
                    NSString *temp = self.current[3];
                    [self.current replaceObjectAtIndex:3 withObject:self.current[4]];
                    [self.current replaceObjectAtIndex:4 withObject:temp];
                } else {
                    NSString *temp = self.current[0];
                    [self.current replaceObjectAtIndex:0 withObject:self.current[1]];
                    [self.current replaceObjectAtIndex:1 withObject:temp];
                    
                }
            }
            
            for (int i=0; i<15; i++) {
                if (self.current[i]==[Board validValues][i+1]) {
                    self.solvability++;
                }
            }
            
            if (self.solvability >= MAX_SOLVIBILITY) {
                [self.current removeAllObjects];
                [self.tiles removeAllObjects];
            }
        }
    }
    self.moves = 0;
    self.block_one = -1;
    self.block_two = -1;
    self.transport_one = -1;
    self.transport_two = -1;
    return self;
}

@end
