//
//  AppDelegate.m
//  Example
//
//  Created by Derek Trauger on 5/29/14.
//  Copyright (c) 2014 WeatherFlow. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
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

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //The URL passed to the example app is built using the [YOUR_URL_PREFIX] value passed to the WeatherFlow Wind Meter app followed by a colon (":") followed by "wfwindmeter", a slash ("/") and then the data payload (URL-encoded JSON).  The scheme utilized is intended to prevent collision with any existing url schemes why providing a flexible format for any additional future fields.
    
    NSString* scheme = [url scheme];
    if ([scheme hasPrefix:@"wf-example"]) {
        
        NSString *value = url.resourceSpecifier;
        NSArray *components = [value componentsSeparatedByString:@"/"];
        if ([[components objectAtIndex:0] isEqualToString:@"wfwindmeter"]) {
            
            NSMutableString * result = [[NSMutableString alloc] init];
            for (int i=1; i < (int)[components count]; i++) {
                
                [result appendString:[components objectAtIndex:i]];
            }
            
            NSString *decodedValue = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            NSError *error;
            
            NSDictionary *data = [NSJSONSerialization JSONObjectWithData: [decodedValue dataUsingEncoding:NSUTF8StringEncoding]
                                                                 options: NSJSONReadingMutableContainers
                                                                   error: &error];
            
            UIAlertView *anoAlert = [[UIAlertView alloc] initWithTitle:@"Data" message:[data description] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [anoAlert show];
        }
    }
    
    return YES;
    
}

@end
