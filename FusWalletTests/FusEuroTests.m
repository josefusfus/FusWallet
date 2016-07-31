//
//  FusEuroTests.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FUSEuro.h"
#import "FUSMoney.h"



@interface FusEuroTests : XCTestCase

@end

@implementation FusEuroTests

-(void)testMultiplication{
    
    FUSEuro *euro = [FUSMoney euroWithAmount:5];
    FUSEuro *ten = [FUSMoney euroWithAmount:10];
    FUSEuro *total = [euro  times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2 should be €10");
}

-(void) testEquality{
    
    FUSEuro *five = [FUSMoney euroWithAmount:5];
    FUSEuro *ten = [FUSMoney euroWithAmount:10];
    FUSEuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalen Object should be equal!!");
}


-(void) testHash{
    
    FUSEuro *a = [FUSMoney euroWithAmount:2];
    FUSEuro *b = [FUSMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
}

-(void) testAmountStorage{
    
    FUSEuro *euro = [FUSMoney euroWithAmount:2];
    

#pragma clang diagnostic push //Con estos tres pragmas quitamos warnings
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"The value should be the same as the stored");
#pragma clang diagnostic pop
}


@end

