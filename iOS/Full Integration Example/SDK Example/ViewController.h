//
//  ViewController.h
//  SDK Example
//
//  Created by Derek Trauger on 7/8/14.
//  Copyright (c) 2014 WeatherFlow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WindMeterSDK.h"

@class AnemometerObservation;

@interface ViewController : UIViewController

@property (nonatomic, strong) WindMeterSDK *sensor;
@property(assign) AnemometerObservation *latestObservation;
@property (nonatomic, strong) UITextView *console;

@end
