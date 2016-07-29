//
//  FUSDollarTests.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FUSDollar.h"

@interface FUSDollarTests : XCTestCase

@end

@implementation FUSDollarTests

-(void) testMultiplication{
    
    FUSDollar *five = [[FUSDollar alloc] initWithAmount: 5];
    FUSDollar *total = [five times:2];
    FUSDollar *ten = [[FUSDollar alloc] initWithAmount : 10];
    
    XCTAssertEqualObjects(ten, total, @"$5 * 2 = $10");
}


-(void) testEquality{
    
    FUSDollar *five = [[FUSDollar alloc] initWithAmount:5];
    FUSDollar *total = [five times:2];
    FUSDollar *ten = [[FUSDollar alloc] initWithAmount:10];
    
    XCTAssertEqualObjects(total, ten, @"Equivalent Onjects should be equal");
    
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
}

@end
