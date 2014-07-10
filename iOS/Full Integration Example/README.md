##Integration Steps

Integrating the Wind Meter SDK into an application is fairly straightforward and only requires a minimal number of steps.

###Project Setup
* Drag the ["WindMeterSDK"] folder into your project.  This folder includes a static library, an audio file used by the library as well as the necessary headers.  Xcode should automatically link the static library included within this folder.

###Usage

```objective-c
#import "WindMeterSDK.h
```

####Setup Sensor Object

```objective-c
sensor = [[WindMeterSDK alloc] init];
    
[sensor reportValueChange:^(AnemometerObservation *value){
    self.latestObservation = value;
    if ([self.latestObservation.statusCode intValue] == OK) {
        NSLog(@"%@",[self.latestObservation prettyJsonString]);
    } else if ([self.latestObservation.statusCode intValue] == ANEMOMTER_NOT_CONNECTED) {
        NSLog(@"DEVICE NOT CONNECTED!");
    }
}];
```

####Start Listening for Data
```objective-c
[sensor startListener]; //starts listening for data
```

####Stop Listening for Data
```objective-c
[sensor stopListener]; //stops listening for data
```

####Clean up
```objective-c
[sensor reportValueChange:nil];
sensor = nil;
```

An [example project] has also been provided with a working example.

["WindMeterSDK"]:https://github.com/WeatherFlow/WindMeterSDK/tree/master/iOS/Full%20Integration%20Example/WindMeterSDK
[example project]:https://github.com/WeatherFlow/WindMeterSDK/tree/master/iOS/Full%20Integration%20Example
