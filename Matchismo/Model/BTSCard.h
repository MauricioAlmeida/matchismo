//
//  BTSCard.h
//  Matchismo
//
//  Created by Mauricio Almeida on 31/12/2017.
//  Copyright © 2017 Mauricio Almeida. All rights reserved.
//

#import "Card.h"

@interface BTSCard : Card

@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *name;

+ (NSDictionary *)btsMembers;

@end
