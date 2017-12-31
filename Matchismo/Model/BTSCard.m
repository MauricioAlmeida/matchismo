//
//  BTSCard.m
//  Matchismo
//
//  Created by Mauricio Almeida on 31/12/2017.
//  Copyright © 2017 Mauricio Almeida. All rights reserved.
//

#import "BTSCard.h"

@implementation BTSCard

- (NSString *)name {
    return _name;
}

- (NSString *)contents {
    return self.name ? [[self.name stringByAppendingString:@"("] stringByAppendingString:self.imageName] : @"";
}

- (int)match:(NSArray *)otherCards {
    int result = 0;
    
    for (BTSCard *card in otherCards) {
        if ([self.imageName isEqualToString:card.imageName]) {
            result = 1;
            break;
        }
    }
    
    return result;
}

+ (NSDictionary *)btsMembers {
    return @{@"Jin":@"Jin6496",
             @"Jimin":@"Jimin6496",
             @"Hoseok":@"Hoseok6496",
             @"Jungkook":@"Jungkook6496",
             @"Taehyung":@"Taehyung6496",
             @"Namjoon":@"Namjoon6496",
             @"Yoongi":@"Yoongi6496",
             @"Army":@"Army6496"
             };
    
}

@end
