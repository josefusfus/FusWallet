//
//  FUSWallet.h
//  FusWallet
//
//  Created by jose luis saez sanchez on 1/8/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FUSMoney.h"

@interface FUSWallet : NSObject<FUSMoney>
@property (nonatomic,readonly) NSUInteger count;

-(void) subscribeToMemoryWarning:(NSNotificationCenter *) nc;


@end
