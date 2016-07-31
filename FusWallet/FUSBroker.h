//
//  FUSBroker.h
//  FusWallet
//
//  Created by jose luis saez sanchez on 31/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FUSMoney;
@interface FUSBroker : NSObject

-(FUSMoney *)reduce:(FUSMoney*) money toCurrency:(NSString*) currency;
-(void) addRate:(NSInteger) rate fromCurrency:(NSString*)fromCurrency toCurrency:(NSString*)toCurrency;

@end
