//
//  SensorStatus.h
//  Sensor
//
//  Created by Derek Trauger on 4/9/13.
//  Copyright (c) 2013 WeatherFlow. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    OK = 0,
    ANEMOMTER_NOT_CONNECTED = 1,
    NOT_LISTENING = 2,
    UNKNOWN_ERROR = NSUIntegerMax
} StatusCode;

@interface SensorStatus : NSObject {
}

@property (nonatomic) StatusCode statusCode;

- (NSString *)statusCodeDisplayName;
- (NSNumber *)statusCodeNumericValue;
+ (NSDictionary *)statusCodes;


@end
