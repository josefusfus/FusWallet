//
//  FUSBroker.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 31/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import "FUSBroker.h"
#import "FUSMoney.h"


@interface FUSBroker()

@end
@implementation FUSBroker


-(id) init{
    
    if (self = [super init]){
        _rates = [@{}mutableCopy]; //Version Literal
    }
    return self;
}

-(FUSMoney *)reduce:(id<FUSMoney>) money
         toCurrency:(NSString *) currency{
    
    //Double Dispatch
    
    return [money reduceToCurrency:currency withBroker:self];
    
    }


-(void) addRate:(NSInteger) rate
    fromCurrency:(NSString*)fromCurrency
     toCurrency:(NSString*)toCurrency{
    
    
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency
                                     toCurrency:toCurrency]];
    NSNumber *invRate = @(1.0/rate);
    [self.rates setObject:invRate
                   forKey:[self keyFromCurrency:toCurrency
                                     toCurrency:fromCurrency]];
    
    
}



#pragma marks - utils

-(NSString *) keyFromCurrency:(NSString *)fromCurrency
                   toCurrency:(NSString *)toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
    
}

@end
