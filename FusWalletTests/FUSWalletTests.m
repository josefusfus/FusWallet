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

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// €40 + $20 = $100 2:1
/*
-(void) testAdditionWithReduction{
    
    FUSBroker *broker = [FUSBroker new];
    [broker addRate: 2 fromCurrency:@"USD" toCurrency:@"EUR"];
    
    FUSWallet *wallet = [[FUSWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus: [FUSMoney dollarWithAmount:20]];
    
    FUSMoney *reduced = [broker reduced:wallet toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [FUSMoney dollarWithAmount:100], @"€40 + $20 = 100 2:1");
    
    
} */
@end
