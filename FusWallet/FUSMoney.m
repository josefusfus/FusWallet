//
//  FUSMoney.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//


#import "NSObject+GNUStepAddons.h"
#import "FUSMoney.h"
#import "FUSBroker.h"


@interface FUSMoney ()

@property (nonatomic,strong) NSNumber *amount;
@end

@implementation FUSMoney


+(id) euroWithAmount:(NSInteger) amount{
    
    return  [[FUSMoney alloc] initWithAmount:amount currency:@"EUR"];
}

+(id) dollarWithAmount:(NSInteger) amount{
    
    return [[FUSMoney alloc] initWithAmount:amount currency:@"USD"];
    
}


-(id)initWithAmount:(NSInteger) amount currency:(NSString *) currency{
    
    if (self = [super init]){
        
        _amount = @(amount);
        _currency = currency;
    }
    
    return  self;
    
    
}

-(id<FUSMoney>) times:(NSInteger) multiplier{
    
    FUSMoney *newMoney = [[FUSMoney alloc]
                          initWithAmount:[self.amount integerValue] *multiplier currency:self.currency];
    
    return newMoney;
    
}

-(id<FUSMoney>) plus:(FUSMoney *) other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    FUSMoney *total = [[FUSMoney alloc] initWithAmount:totalAmount
                                              currency:self.currency];
    return total;
}


-(id<FUSMoney>) reduceToCurrency:(NSString*) currency
                      withBroker:(FUSBroker*) broker{
    
    FUSMoney *result;
    double rate = [[broker.rates
                    objectForKey:[broker keyFromCurrency:self.currency
                                            toCurrency:currency]] doubleValue];
    // Comprobamos que divisa origen y destino son las mismas
    if ([self.currency isEqual:currency]){
        result = self;
        
    }else if(rate == 0){
        
        //No hay tasa de conversion, excepcion!!
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@", self.currency, currency];
    }else{
        // Tenemos conversion
        
        
        NSUInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[FUSMoney alloc]
                  initWithAmount:newAmount
                  currency:currency];
    }
    
    return result;
    

    
}

#pragma mark - Ovewritten
-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@: %@ %@>",
            [self class],
            self.currency, self.amount];
}

-(BOOL)isEqual:(id)object{ // implementando aqui currency ademas de amount hacemos
                           // posible la comparación de divisas
    
    if ([self.currency isEqual:[object currency]]){
        return  [self amount] == [object amount];
    } else {
        return NO;
        
        }
}

    


-(NSUInteger) hash{ // ñapa para que funcione el hash en el test
    
    
    return [self.amount integerValue];
}







@end
