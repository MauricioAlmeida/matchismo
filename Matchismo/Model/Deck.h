//
//  Deck.h
//  Matchismo
//
//  Created by Mauricio Almeida on 25/12/2017.
//  Copyright © 2017 Mauricio Almeida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;
@end
