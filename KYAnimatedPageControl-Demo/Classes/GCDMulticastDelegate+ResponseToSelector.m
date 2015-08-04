//
//  GCDMulticastDelegate+ResponseToSelector.m
//  Pods
//
//  Created by jiakai lian on 4/08/2015.
//
//

#import "GCDMulticastDelegate+ResponseToSelector.h"

@implementation GCDMulticastDelegate (ResponseToSelector)

-(BOOL)respondsToSelector:(SEL)aSelector {
    
    for (id node in [self valueForKeyPath:@"delegateNodes"])
    {
        if ([[node valueForKeyPath:@"delegate" ] respondsToSelector:aSelector])
        {
            return YES;
        }
    }
    
    
    return [super respondsToSelector:aSelector];
}


@end
