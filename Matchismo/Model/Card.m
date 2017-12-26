//
//  Card.m
//  Matchismo
//
//  Created by Mauricio Almeida on 25/12/2017.
//  Copyright © 2017 Mauricio Almeida. All rights reserved.
//

#import "Card.h"

@interface Card()

@end


@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
        
    return score;
}

@end
