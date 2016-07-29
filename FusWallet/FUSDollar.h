//
//  FUSDollar.h
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FUSMoney.h"

@interface FUSDollar : NSObject

-(id) initWithAmount:(NSInteger) amount;

-(FUSDollar*) times:(NSInteger) multiplier;


@end
