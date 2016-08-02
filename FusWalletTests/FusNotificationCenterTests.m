//
//  FusNotificationCenterTests.m
//  FusWallet
//
//  Created by Jose Luis Saez Sanchez on 2/8/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FUSFakeNotificationCenter.h"
#import "FUSWallet.h"
#import <UIKit/UIKit.h>

@interface FusNotificationCenterTests : XCTestCase

@end

@implementation FusNotificationCenterTests

- (void)setUp {
    [super setUp];
    
    }

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testThatSubcribesToMemoryWarning{
    
    FUSFakeNotificationCenter *fake = [FUSFakeNotificationCenter new];
    
    FUSWallet *w = [FUSWallet new];
    
    [w subscribeToMemoryWarning:(NSNotificationCenter*)fake];
    
    NSDictionary *obs = [fake observers];
    id observer =[obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, w, @"Fat object must subscribe to");
    
    
    
}


@end
