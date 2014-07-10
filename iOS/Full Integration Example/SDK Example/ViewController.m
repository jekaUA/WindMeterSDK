//
//  ViewController.m
//  SDK Example
//
//  Created by Derek Trauger on 7/8/14.
//  Copyright (c) 2014 WeatherFlow. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize sensor, console;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.autoresizesSubviews = YES;
    console = [[UITextView alloc] initWithFrame:CGRectMake(0,30,self.view.frame.size.width, self.view.frame.size.height)];
    console.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin);
    [self.view addSubview:console];
    [self buildSensor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [sensor startListener]; //starts listening for data
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [sensor stopListener]; //stops listening for data
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buildSensor {
    sensor = [[WindMeterSDK alloc] init];
    
    [sensor reportValueChange:^(AnemometerObservation *value){
        
        self.latestObservation = value;
        if ([self.latestObservation.statusCode intValue] == OK) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                console.text = [[NSString stringWithFormat:@"%@ (%@):  %f mps @ %f° (%f, %f)\n", self.latestObservation.timestamp, self.latestObservation.timezone, [self.latestObservation.windSpeed floatValue], [self.latestObservation.windDirectionDegreesTrue floatValue], [[value.deviceLocation objectForKey:@"latitude"] floatValue], [[self.latestObservation.deviceLocation objectForKey:@"longitude"] floatValue]] stringByAppendingString:console.text];
                NSLog(@"%@",[self.latestObservation prettyJsonString]);
            });
        } else if ([self.latestObservation.statusCode intValue] == ANEMOMTER_NOT_CONNECTED) {
            console.text = [@"DEVICE NOT CONNECTED!\n" stringByAppendingString:console.text];
            NSLog(@"DEVICE NOT CONNECTED!");
        }
    }];
    
}

-(void)destroySensor {
    [sensor reportValueChange:nil];
    sensor = nil;
}

-(void) dealloc {
    [self destroySensor];
}

@end
