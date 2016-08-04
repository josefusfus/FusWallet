//
//  AppDelegate.m
//  FusWallet
//
//  Created by jose luis saez sanchez on 29/7/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import "AppDelegate.h"
#import "FUSMoney.h"
#import "FUSWalletTableViewController.h"
#import "FUSWallet.h"
#import "FUSBroker.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    FUSMoney *euros = [FUSMoney euroWithAmount:20];
    FUSMoney *dollar = [FUSMoney dollarWithAmount:30];
    FUSMoney *mxn = [FUSMoney mxnWithAmount:40];
    
    
    //Creamos el modelo
    FUSWallet *wallet = [[FUSWallet alloc] initWithAmount:1 currency:@"USD"];
    [wallet plus:euros];
    [wallet plus:dollar];
    [wallet plus:euros];
    [wallet plus:mxn];
    FUSBroker *broker = [[FUSBroker alloc] init];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"MXN"];
    [broker addRate:4 fromCurrency:@"USD" toCurrency:@"EUR"];
    
    
    //Creamos el controlador
    
    FUSWalletTableViewController *walletVC = [[FUSWalletTableViewController alloc] initWithModel:wallet broker:broker];
    
    //Creamos un navigation
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:walletVC];
    
    // Lo asignamos al controlador raiz
    
    self.window.rootViewController = navVC;
    
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
