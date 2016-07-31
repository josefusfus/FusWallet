//
//  FUSBrokerTests.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 31/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FUSMoney.h"
#import "FUSBroker.h"

@interface FUSBrokerTests : XCTestCase
@property (nonatomic, strong) FUSBroker *emptyBroker;
@property (nonatomic, strong) FUSMoney *oneDollar;

@end

@implementation FUSBrokerTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.emptyBroker = [FUSBroker new];
    self.oneDollar = [FUSMoney dollarWithAmount:1];

   }

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.emptyBroker = nil;
    self.oneDollar =nil;
}

-(void) testSimpleReduction{
    
    
    FUSMoney *sum = [[FUSMoney dollarWithAmount:5] plus:[FUSMoney dollarWithAmount:5]];
    
    FUSMoney *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

// $10 == €5 2:1

-(void) testReduction{
    
    
    [self.emptyBroker addRate: 2 fromCurrency:@"EUR"  toCurrency:@"USD"];
    
    FUSMoney *dollars = [FUSMoney dollarWithAmount:10];
    FUSMoney *euros = [FUSMoney euroWithAmount:5];
    
    FUSMoney *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"$10 == €5 2:1");
}

-(void) testThatNoRatesRaisesException{
    
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
    
}

-(void) testThatNilConversionDoesNotChangeMoney{
    
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"],@"A nil conversion shouldn´t have effect");
}



@end
