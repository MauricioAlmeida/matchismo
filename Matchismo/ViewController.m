//
//  ViewController.m
//  Matchismo
//
//  Created by Mauricio Almeida on 25/12/2017.
//  Copyright © 2017 Mauricio Almeida. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

// Assignment
@property (strong, nonatomic) PlayingCardDeck *deck;
@end

@implementation ViewController

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    if (!self.deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        
        Card *card = nil;
        card = [self.deck drawRandomCard];
        //[sender setTitle:@"A♣️" forState:UIControlStateNormal];
        [sender setTitle:[card contents] forState:UIControlStateNormal];
    }
    self.flipCount++;
}

@end
