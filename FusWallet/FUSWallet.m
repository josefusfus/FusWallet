//
//  FUSWallet.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 1/8/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import "FUSWallet.h"


@interface FUSWallet()

@property (nonatomic, strong) NSMutableArray *moneys;
@end

@implementation FUSWallet

-(id) initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    
    if (self = [super init]){
        
        FUSMoney *money = [[FUSMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
        
    }
    return self;
}

-(id<FUSMoney>)plus:(FUSMoney*)money{
    
    [self.moneys addObject:money];
    return self;
}

-(id<FUSMoney>) times:(NSInteger)multiplier{
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (FUSMoney *each in self.moneys){
        
        FUSMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

@end
