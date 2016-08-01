//
//  FUSMoney.h
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FUSMoney;
@class FUSBroker;

@protocol FUSMoney <NSObject>

-(id)initWithAmount:(NSInteger) amount
           currency:(NSString *) currency;

-(id<FUSMoney>) times:(NSInteger) multiplier;

-(id<FUSMoney>) plus:(FUSMoney *) other;

-(id<FUSMoney>) reduceToCurrency:(NSString*) currency
                      withBroker:(FUSBroker*) broker;


@end

@interface FUSMoney : NSObject<FUSMoney>

@property (nonatomic, strong, readonly) NSNumber *amount;
@property (nonatomic,readonly) NSString *currency;


+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;


@end
