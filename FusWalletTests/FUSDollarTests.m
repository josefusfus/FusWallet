//
//  FUSDollarTests.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FUSDollar.h"
#import "FUSMoney.h"

@interface FUSDollarTests : XCTestCase

@end

@implementation FUSDollarTests

-(void) testMultiplication{
    
    FUSDollar *five = [FUSMoney dollarWithAmount: 5];
    FUSDollar *total = [five times:2];
    FUSDollar *ten = [FUSMoney dollarWithAmount : 10];
    
    XCTAssertEqualObjects(ten, total, @"$5 * 2 = $10");
}


-(void) testEquality{
    
    FUSDollar *five = [FUSMoney dollarWithAmount:5];
    FUSDollar *total = [five times:2];
    FUSDollar *ten = [FUSMoney dollarWithAmount:10];
    
    XCTAssertEqualObjects(total, ten, @"Equivalent Onjects should be equal");
    
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
}



-(void) testHash{
    
    FUSDollar *a = [FUSMoney dollarWithAmount:2];
    FUSDollar *b = [FUSMoney dollarWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
}

-(void) testAmountStorage{
    
    FUSDollar *dollar = [FUSMoney dollarWithAmount:2];
    
    
#pragma clang diagnostic push //Con estos tres pragmas quitamos warnings
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)]integerValue], @"The value should be the same as the stored");
#pragma clang diagnostic pop
}

@end
