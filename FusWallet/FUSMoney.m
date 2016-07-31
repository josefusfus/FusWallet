//
//  FUSMoney.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//


#import "NSObject+GNUStepAddons.h"
#import "FUSMoney.h"
#import "FUSMoney-Private.h"


@implementation FUSMoney

-(id)initWithAmount:(NSInteger) amount{
    
    if (self = [super init]){
        
        _amount = @(amount);
    }
    
    return  self;
    
    
}

-(FUSMoney *) times:(NSInteger) multiplier{
    
    // No se debe llamar, sino que deberia usar el de
    // la subclase
    
    return [self subclassResponsibility:_cmd];
    
}


#pragma mark - Ovewritten
-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@ %ld>",
            [self class],
            (long)[self amount]];
}

-(BOOL)isEqual:(id)object{
    
    return  [self amount] == [object amount];
}

-(NSUInteger) hash{ // ñapa para que funcione el hash en el test
    
    
    return (NSUInteger) self.amount;
}







@end
