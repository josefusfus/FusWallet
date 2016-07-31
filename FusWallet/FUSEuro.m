//
//  FUSEuro.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import "FUSEuro.h"
#import "FUSMoney-Private.h"

@implementation FUSEuro



-(FUSEuro*) times:(NSInteger) multiplier{
    
    FUSEuro *newEuro = [[FUSEuro alloc] initWithAmount:[self.amount integerValue] * multiplier];
    
    return  newEuro;
}


#pragma mark - Overwritten











@end


