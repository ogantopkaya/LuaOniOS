//
//  AppDelegate.m
//  LuaOniOS
//
//  Created by Ogan Topkaya on 20/02/14.
//  Copyright (c) 2014 Peak Games. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "NSString+Paths.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self copyResourcesToDocumentsFolder];
    
    self.rootViewController = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    self.window.rootViewController = self.rootViewController;
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)copyResourcesToDocumentsFolder{
    NSArray *paths = [[NSBundle mainBundle] pathsForResourcesOfType:@"lua" inDirectory:@"."];
    NSString *documentsPath = [NSString applicationDocumentsDirectory];
    
    [paths enumerateObjectsUsingBlock:^(NSString *path, NSUInteger i, BOOL *stop) {
        NSString *lastComponent = [path lastPathComponent];
        NSString *newPath = [documentsPath stringByAppendingPathComponent:lastComponent];

//Overrides the changed script
//#warning - Remove Later
//        if ([[NSFileManager defaultManager] fileExistsAtPath:newPath isDirectory:NULL]) {
//            [[NSFileManager defaultManager] removeItemAtPath:newPath error:NULL];
//        }
        
        [[NSFileManager defaultManager] copyItemAtPath:path toPath:newPath error:NULL];
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end



