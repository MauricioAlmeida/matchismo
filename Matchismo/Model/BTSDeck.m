//
//  BTSDeck.m
//  Matchismo
//
//  Created by Mauricio Almeida on 31/12/2017.
//  Copyright © 2017 Mauricio Almeida. All rights reserved.
//

#import "BTSDeck.h"
#import "BTSCard.h"

@implementation BTSDeck

- (instancetype) init {
    self = [super init];
    
    if (self) {
        NSDictionary *dictMembers = [BTSCard btsMembers];
        for (NSString *name in dictMembers) {
            NSString *imageName = dictMembers[name];
            BTSCard *card1 = [[BTSCard alloc] init];
            card1.name = name;
            card1.imageName = imageName;
            [self addCard:card1];
            
            BTSCard *card2 = [[BTSCard alloc] init];
            card2.name = name;
            card2.imageName = imageName;
            [self addCard:card2];
        }
    }
    
    return self;
}
@end
