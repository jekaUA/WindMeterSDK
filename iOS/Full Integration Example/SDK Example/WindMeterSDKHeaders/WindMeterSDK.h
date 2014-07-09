//
//  WindMeterSDK.h
//  WindMeterSDK
//
//  Created by Derek Trauger on 6/26/14.
//  Copyright (c) 2014 WeatherFlow. All rights reserved.
//

#import "AnemometerObservation.h"
#import "SensorStatus.h"

@interface WindMeterSDK : NSObject {
    AnemometerObservation *anemometerOb;
    void (^_valueChangedHandler)(AnemometerObservation *value);
}

- (id)init;
- (void)startListener;
- (void)stopListener;
- (void)reportValueChange:(void(^)(AnemometerObservation *))handler;

@end
