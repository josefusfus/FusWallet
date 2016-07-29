//
//  FUSMoney.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import "FUSMoney.h"
#import "NSObject+GNUStepAddons.h"


@interface FUSMoney ()
@property (nonatomic) NSInteger amount;
@end

@implementation FUSMoney

-(id)initWithAmount:(NSInteger) amount{
    
    if (self = [super init]){
        
        _amount = amount;
    }
    
    return  self;
    
    
}

-(FUSMoney *) times:(NSInteger) multiplier{
    
    // No se debe llamar, sino que deberia usar el de
    // la subclase
    
    return [self subclassResponsibility:_cmd];
    
}

@end
