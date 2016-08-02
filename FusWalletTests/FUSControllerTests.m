//
//  FUSControllerTests.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 1/8/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FusSimpleViewController.h"
#import "FUSWalletTableViewController.h"
#import "FUSWallet.h"

@interface FUSControllerTests : XCTestCase
@property (nonatomic, strong) FusSimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;

@property (nonatomic,strong) FUSWalletTableViewController *walletVC;
@property (nonatomic, strong) FUSWallet *wallet;

@end

@implementation FUSControllerTests

- (void)setUp {
    [super setUp];
    
    self.simpleVC = [[FusSimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    
    self.wallet= [[FUSWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[FUSMoney euroWithAmount:1]];
    self.walletVC = [[FUSWalletTableViewController alloc] initWithModel:self.wallet];
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

-(void) testThatTablehasOneSection{
    
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(sections, 1, @"There can only be one");
}


-(void) testThatNumberCellsIsNumberOfMoneysPlusOne{
    
    XCTAssertEqual(self.wallet.count + 1,
                   [self.walletVC tableView:nil numberOfRowsInSection:0],
                   @"Number of cells is the number of moneys plus 1 (The total)");
    
    
}











@end
