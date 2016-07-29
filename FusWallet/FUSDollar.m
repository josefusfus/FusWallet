//
//  FUSDollar.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import "FUSDollar.h"



@interface FUSDollar()
@property (nonatomic) NSInteger amount;
@end
@implementation FUSDollar


-(id) initWithAmount:(NSInteger) amount{
    
    if (self = [super init]){
        
        _amount = amount;
    }
    
    return self;
    
}

-(FUSDollar *) times:(NSInteger) multiplier{
    
    FUSDollar *newDollar = [[FUSDollar alloc] initWithAmount:self.amount * multiplier];
    
    return  newDollar;
}


#pragma mark - Overwritten

-(BOOL)isEqual:(id)object{
    
    return  [self amount] == [object amount];
}

@end



