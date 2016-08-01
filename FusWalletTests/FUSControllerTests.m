//
//  FUSControllerTests.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 1/8/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FusSimpleViewController.h"

@interface FUSControllerTests : XCTestCase
@property (nonatomic, strong) FusSimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;

@end

@implementation FUSControllerTests

- (void)setUp {
    [super setUp];
    
    self.simpleVC = [[FusSimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

-(void) testThatTestOnLabelsIsEqualToTextsOnButton{
    
    //Mandamos el mensaje
    [self.simpleVC displayText:self.button];
    
    
    //Comprobamos que la etiqueta y botton tienen mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same text");
    
    
}

@end
