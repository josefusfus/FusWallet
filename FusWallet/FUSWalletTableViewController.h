//
//  FUSWalletTableViewController.h
//  FusWallet
//
//  Created by jose luis saez sanchez on 2/8/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FUSBroker.h"
@class FUSWallet;

@interface FUSWalletTableViewController : UITableViewController

-(id) initWithModel:(FUSWallet *) model
             broker: (FUSBroker *) broker;

@end
