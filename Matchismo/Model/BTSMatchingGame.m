//
//  BTSMatchingGame.m
//  Matchismo
//
//  Created by Mauricio Almeida on 31/12/2017.
//  Copyright © 2017 Mauricio Almeida. All rights reserved.
//

#import "BTSMatchingGame.h"

@interface BTSMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards;  // of Card
@end

@implementation BTSMatchingGame

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match against another card
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= 1;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= 1;
            card.chosen = YES;
        }
    }
}

-(Card *)cardAtIndex:(NSUInteger)index {
    // Verifies if the given index is less than or equal the number of cards in the deck
    return (index < [self.cards count]) ? [self.cards objectAtIndex:index] : nil;
}

@end
