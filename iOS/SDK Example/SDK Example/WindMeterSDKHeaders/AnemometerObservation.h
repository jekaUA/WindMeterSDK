//
//  AnemometerObservation.h
//  Sensor
//
//  Created by Derek Trauger on 4/8/13.
//  Copyright (c) 2013 WeatherFlow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnemometerObservation : NSObject<NSCoding> {
    NSNumber *rpm;
    NSNumber *windSpeed; //meters per second
    NSNumber *windDirectionDegreesTrue;
    NSNumber *windDirectionDegreesMagnetic;
    NSString *timestamp; //utc
    NSString *timezone;
    NSDictionary *deviceInformation;
    NSDictionary *deviceLocation;
    NSDictionary *anemometer;
    NSNumber *statusCode;
    NSString *statusMessage;
    
}

@property (nonatomic, retain) NSNumber *rpm;
@property (nonatomic, retain) NSNumber *windSpeed;
@property (nonatomic, retain) NSString *timestamp;
@property (nonatomic, retain) NSString *timezone;
@property (nonatomic, retain) NSNumber *windDirectionDegreesTrue;
@property (nonatomic, retain) NSNumber *windDirectionDegreesMagnetic;
@property (nonatomic, retain) NSDictionary *deviceInformation;
@property (nonatomic, retain) NSDictionary *deviceLocation;
@property (nonatomic, retain) NSDictionary *anemometer;
@property (nonatomic, retain) NSNumber *statusCode;
@property (nonatomic, retain) NSString *statusMessage;

- (NSDictionary*)objectAsDictionary;
- (NSString *)jsonString;
- (NSString *)prettyJsonString;

@end
