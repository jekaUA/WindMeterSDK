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
