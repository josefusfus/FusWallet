//
//  FUSMoneyTests.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FUSMoney.h"

@interface FUSMoneyTests : XCTestCase

@end

@implementation FUSMoneyTests

-(void) testThatTimesRaisesException{
    
    FUSMoney *money = [[FUSMoney alloc] initWithAmount:1];
    XCTAssertThrows([money times:2], @"Should raise an exception");
}
@end
