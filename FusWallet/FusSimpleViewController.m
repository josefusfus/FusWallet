//
//  FusSimpleViewController.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 1/8/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import "FusSimpleViewController.h"

@interface FusSimpleViewController ()

@end

@implementation FusSimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)displayText:(id)sender {
    
    UIButton *btn = sender;
    self.displayLabel.text = btn.titleLabel.text;
}
@end
