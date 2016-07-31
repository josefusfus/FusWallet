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

-(void) testCurrencies{
    
    XCTAssertEqualObjects(@"EUR", [[FUSMoney euroWithAmount:1] currency],@"The currency of euros should be EUR");
    
    XCTAssertEqualObjects(@"USD", [[FUSMoney dollarWithAmount:1] currency],@"The currency of $1 should be USD");
}

-(void)testMultiplication{
    
    FUSMoney *euro = [FUSMoney euroWithAmount:5];
    FUSMoney *ten = [FUSMoney euroWithAmount:10];
    FUSMoney *total = [euro  times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2 should be €10");
}

-(void) testEquality{
    
    FUSMoney *five = [FUSMoney euroWithAmount:5];
    FUSMoney *ten = [FUSMoney euroWithAmount:10];
    FUSMoney *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalen Object should be equal!!");
    XCTAssertEqualObjects([FUSMoney dollarWithAmount:4], [[FUSMoney dollarWithAmount:2] times:2], @"Equivalent object should be equal");
}


//hacemos un test para $1 != €1
-(void) testDifferentCurrencies{
    FUSMoney *euro = [FUSMoney euroWithAmount:1];
    FUSMoney *dollar = [FUSMoney dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Different currencies not be equal");
    
}


-(void) testHash{
    
    FUSMoney *a = [FUSMoney euroWithAmount:2];
    FUSMoney *b = [FUSMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
    XCTAssertEqual([[FUSMoney dollarWithAmount:1] hash], [[FUSMoney dollarWithAmount:1]hash], @"Equal object must have same hash");
}

-(void) testAmountStorage{
    
    FUSMoney *euro = [FUSMoney euroWithAmount:2];
    
    
#pragma clang diagnostic push //Con estos tres pragmas quitamos warnings
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"The value should be the same as the stored");
    XCTAssertEqual(2, [[[FUSMoney dollarWithAmount:2]performSelector:@selector(amount)]integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
}

-(void) testSimpleAddition{ //Test de suma simple misma divisa
    
    XCTAssertEqualObjects([[FUSMoney dollarWithAmount:5] plus:
                           [FUSMoney dollarWithAmount:5]],
                           [FUSMoney dollarWithAmount:10],
                            @"$5 + $5 = $10");
}


-(void) testThatHashIsAmount{
    
    FUSMoney *one = [FUSMoney dollarWithAmount:1];
    XCTAssertEqual([one hash], 1, @"The hast must be the same as amount");
}

-(void) testDescription{
    
    
    FUSMoney *one = [FUSMoney dollarWithAmount:1];
    NSString *desc = @"<FUSMoney: USD 1>";
    
    XCTAssertEqualObjects(desc, [one description],@"Description must macht template");
}



@end
