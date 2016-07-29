//
//  FUSEuro.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import "FUSEuro.h"

@interface FUSEuro()
@property (nonatomic) NSInteger amount;
@end
@implementation FUSEuro


-(id) initWithAmount:(NSInteger) amount{
    
    if (self = [super init]){
        
        _amount = amount;
    }
    
    return self;
    
}

-(FUSEuro*) times:(NSInteger) multiplier{
    
    FUSEuro *newEuro = [[FUSEuro alloc] initWithAmount:self.amount * multiplier];
    
    return  newEuro;
}


#pragma mark - Overwritten

-(BOOL)isEqual:(id)object{
    
    return  [self amount] == [object amount];
}



-(NSUInteger) hash{ // ñapa para que funcione el hash en el test

    
    return (NSUInteger) self.amount;
}






@end


