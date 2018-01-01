//
//  BtsGameViewController.m
//  Matchismo
//
//  Created by Mauricio Almeida on 31/12/2017.
//  Copyright © 2017 Mauricio Almeida. All rights reserved.
//

#import "BtsGameViewController.h"
#import "BTSCard.h"
#import "BTSDeck.h"
#import "BTSMatchingGame.h"

@interface BtsGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) BTSMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation BtsGameViewController

- (Deck *)createDeck {
    return [[BTSDeck alloc] init];
}

- (BTSMatchingGame *)game {
    if (!_game) {
        _game = [[BTSMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    //NSLog(@"Quantidade de elementos no cardButtons = %@", [self.cardButtons count]);
    return _game;
}

- (Deck *)deck {
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", (int)self.game.score];
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    BTSCard *btsCard = card;
    NSString *imageName = btsCard.imageName;
    return [UIImage imageNamed:card.isChosen ? imageName : @"Logo6496"];
}

@end
