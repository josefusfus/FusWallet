//
//  FUSDollar.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import "FUSDollar.h"
#import "FUSMoney.h"
#import "FUSMoney-Private.h"


@implementation FUSDollar


-(FUSDollar *) times:(NSInteger) multiplier{
    
    FUSDollar *newDollar = [[FUSDollar alloc] initWithAmount:[self.amount integerValue] * multiplier];
    
    return  newDollar;
}


#pragma mark - Overwritten








@end



