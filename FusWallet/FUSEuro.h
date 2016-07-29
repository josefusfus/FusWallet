//
//  FUSEuro.h
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FUSEuro : NSObject



-(id) initWithAmount:(NSInteger) amount;

-(FUSEuro*) times:(NSInteger) multiplier;

@end
