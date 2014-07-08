//
//  ViewController.m
//  Example
//
//  Created by Derek Trauger on 5/29/14.
//  Copyright (c) 2014 WeatherFlow. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)externalIntegrationExample:(id)sender {
    
    //Open WeatherFlow Wind Meter using Custom URL (wfwindmeter:[YOUR_URL_PREFIX]), otherwise open App Store to download WeatherFlow Wind Meter app, the [YOUR_URL] portion of the URL tells the WeatherFlow Wind Meter app what app it should attempt to pass the data to when the reading concludes.
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"wfwindmeter:wf-example"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"wfwindmeter:wf-example"]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/weatherflow-wind-meter/id653579366?mt=8"]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
