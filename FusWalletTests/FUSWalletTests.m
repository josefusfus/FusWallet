//
//  FUSWalletTests.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 1/8/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "FUSMoney.h"
#import "FUSBroker.h"
#import "FUSWallet.h"

@interface FUSWalletTests : XCTestCase

@end

@implementation FUSWalletTests


// €40 + $20 = $100 2:1


-(void) testAdditionWithReduction{
    
    FUSBroker *broker = [FUSBroker new];
    [broker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    FUSWallet *wallet = [[FUSWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus: [FUSMoney dollarWithAmount:20]];
    
    FUSMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [FUSMoney dollarWithAmount:100], @"€40 + $20 = 100 2:1");
    
}

@end
