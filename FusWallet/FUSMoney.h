//
//  FUSMoney.h
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FUSMoney : NSObject

@property (nonatomic,readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

-(id)initWithAmount:(NSInteger) amount
           currency:(NSString *) currency;

-(id) times:(NSInteger) multiplier;



@end
