//
//  FusEuroTests.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FUSEuro.h"



@interface FusEuroTests : XCTestCase

@end

@implementation FusEuroTests

-(void)testMultiplication{
    
    FUSEuro *euro = [[FUSEuro alloc] initWithAmount:5];
    FUSEuro *ten = [[FUSEuro alloc] initWithAmount:10];
    FUSEuro *total = [euro  times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2 should be €10");
}

-(void) testEquality{
    
    FUSEuro *five = [[FUSEuro alloc] initWithAmount:5];
    FUSEuro *ten = [[FUSEuro alloc] initWithAmount:10];
    FUSEuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalen Object should be equal!!");
}


-(void) testHash{
    
    FUSEuro *a = [[FUSEuro alloc] initWithAmount:2];
    FUSEuro *b = [[FUSEuro alloc] initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal object must have same hash");
}

-(void) testAmountStorage{
    
    FUSEuro *euro = [[FUSEuro alloc] initWithAmount:2];
    

#pragma clang diagnostic push //Con estos tres pragmas quitamos warnings
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"The value should be the same as the stored");
#pragma clang diagnostic pop
}


@end

