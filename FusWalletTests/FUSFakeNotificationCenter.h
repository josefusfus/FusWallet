//
//  FUSFakeNotificationCenter.h
//  FusWallet
//
//  Created by Jose Luis Saez Sanchez on 2/8/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FUSFakeNotificationCenter : NSObject


@property  (nonatomic, strong) NSMutableDictionary *observers;

-(void)addObserver:(id)observer
           selector:(SEL)aSelector
               name:(NSString *)aName
             object:(id)anObject;
@end
