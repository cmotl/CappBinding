/*
 * AppController.j
 * CappBinding
 *
 * Created by You on December 3, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "Person.j"

@implementation AppController : CPObject
{
    CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
    var p1 = [Person new];
    var p2 = [Person new];
    
    [p1 bind:@"name" toObject:p2 withKeyPath:@"name" options:nil];
    //[p2 bind:@"name" toObject:p1 withKeyPath:@"name" options:nil];
    
    [p1 setName:@"Christopher"];
    
    console.log("p1 name: " + p1.name);
    console.log("p2 name: " + p2.name);
    
    [p2 setName:@"Christina"];    
    
    console.log("p1 name: " + p1.name);
    console.log("p2 name: " + p2.name);
    
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];
}

@end
