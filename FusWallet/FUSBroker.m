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
@property (nonatomic, strong) NSMutableDictionary *rates;
@end
@implementation FUSBroker


-(id) init{
    
    if (self = [super init]){
        _rates = [@{}mutableCopy]; //Version Literal
    }
    return self;
}

-(FUSMoney *)reduce:(FUSMoney*) money
         toCurrency:(NSString *) currency{
    
    FUSMoney *result;
    double rate = [[self.rates
                       objectForKey:[self keyFromCurrency:money.currency
                                                          toCurrency:currency]] doubleValue];
    // Comprobamos que divisa origen y destino son las mismas
    if ([money.currency isEqual:currency]){
        result = money;
        
    }else if(rate == 0){
        
        //No hay tasa de conversion, excepcion!!
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@", money.currency, currency];
    }else{
        // Tenemos conversion
        
    double rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency
                                                         toCurrency:currency]] doubleValue];
    
    NSUInteger newAmount = [money.amount integerValue] * rate;
    
    result = [[FUSMoney alloc]
                          initWithAmount:newAmount
                          currency:currency];
    }
    
    return result;
    
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
