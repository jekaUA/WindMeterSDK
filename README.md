###Integration Steps

####Implement a Custom URL Scheme
* Defining your app's custom URL scheme is all done in the Info.plist file. Click on the last line in the file and then click the "+" sign off to the right to add a new line. Select URL Types for the new item. Once that's added, click the grey arrow next to "URL Types" to show "Item 0". Set your URL identifier to a unique string.

After you've set the URL identifier, select that line and click the "+" sign again, and add a new item for URL Schemes. Then click the grey arrow next to "URL Schemes" to reveal "Item 0". Set the value for Item 0 to be your URL scheme name.

```
<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleURLName</key>
			<string>com.weatherflow.url</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>wf-example</string>
			</array>
		</dict>
	</array>
```
	
####Handling Custom URL Calls
* In order for your app to respond when it receives a custom URL call, you must implement the application:handleOpenURL method in the application delegate class:

```
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    // handler code here
}
```

####Parsing the Custom URL
* Once data is passed to your application you must parse the data received.  The example application provides a complete implementation of the handleOpenURL method transforming the passed data into a dictionary.  In the example this dictionary's key / value pairs are displayed in an AlertView for visualization purposes but this dictionaries values can be stored and used as needed.

```
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
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
```
