//
//  FUSFakeNotificationCenter.m
//  FusWallet
//
//  Created by Jose Luis Saez Sanchez on 2/8/16.
//  Copyright © 2016 JoseFusFus. All rights reserved.
//

#import "FUSFakeNotificationCenter.h"


@implementation FUSFakeNotificationCenter


-(id) init{
           if (self = [super init]){
               _observers = [NSMutableDictionary dictionary];
           }
    return self;
    }

-(void) addObserver:(id)observer
           selector:(SEL)aSelector
               name:(NSString *)aName
             object:(id)anObject{
    
    [self.observers setObject:observer forKey:aName];
}


@end
