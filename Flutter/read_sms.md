https://pub.dev/packages/telephony

Telephony 
>❗ This plugin currently only works on Android Platform
A Flutter plugin to use telephony features such as

Send SMS Messages
Query SMS Messages
Listen for incoming SMS
Retrieve various network parameters
Start phone calls
This plugin tries to replicate some of the functionality provided by Android's Telephony class.

Check the Features section to see the list of implemented and missing features.

Get Started 
💡 View the entire documentation here. 
Usage 
To use this plugin add telephony as a dependency in your pubspec.yaml file.

Versions 0.0.9 and lower are not null safe.
Versions 0.1.0 and above opt into null safety.
Setup 
Import the telephony package
```
import 'package:telephony/telephony.dart';
```
Retrieve the singleton instance of telephony by calling

final Telephony telephony = Telephony.instance;
Permissions 
Although this plugin will check and ask for permissions at runtime, it is advisable to manually ask for permissions before calling any other functions.

The plugin will only request those permission that are listed in the AndroidManifest.xml.

Manually request permission using

bool permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
You can also request SMS or Phone permissions separately using requestSmsPermissions or requestPhonePermissions respectively.

Send SMS 
>❗ Requires SEND_SMS permission. Add the following permission in your AndroidManifest.xml
```dart
<uses-permission android:name="android.permission.SEND_SMS"/>
```
SMS can either be sent directly or via the default SMS app.

Send SMS directly from your app:
```dart
telephony.sendSms(
	to: "1234567890",
	message: "May the force be with you!"
	);
```
If you want to listen to the status of the message being sent, provide SmsSendStatusListener to the sendSms function.
```dart
final SmsSendStatusListener listener = (SendStatus status) {
	// Handle the status
	};
	
telephony.sendSms(
	to: "1234567890",
	message: "May the force be with you!",
	statusListener: listener
	);
```
If the body of the message is longer than the standard SMS length limit of 160 characters, you can send a multipart SMS by setting the isMultipart flag.

Send SMS via the default SMS app:
```dart
telephony.sendSmsByDefaultApp(to: "1234567890", message: "May the force be with you!");
```
Query SMS 
>❗ Requires READ_SMS permission. Add the following permission in your AndroidManifest.xml

```dart
<uses-permission android:name="android.permission.READ_SMS"/>
```
Use one of getInboxSms(), getSentSms() or getDraftSms() functions to query the messages on device.

You can provide the list of SmsColumns that need to be returned by the query.

If not explicitly specified, defaults to [ SmsColumn.ID, SmsColumn.ADDRESS, SmsColumn.BODY, SmsColumn.DATE ]

Provide a SmsFilter to filter the results of the query. Functions like a SQL WHERE clause.

Provide a list of OrderBy objects to sort the results. The level of importance is determined by the position of OrderBy in the list.

All paramaters are optional.
```dart
List<SmsMessage> messages = await telephony.getInboxSms(
		columns: [SmsColumn.ADDRESS, SmsColumn.BODY],
		filter: SmsFilter.where(SmsColumn.ADDRESS)
				 .equals("1234567890")
				 .and(SmsColumn.BODY)
				 .like("starwars"),
		sortOrder: [OrderBy(SmsColumn.ADDRESS, sort: Sort.ASC),
			    OrderBy(SmsColumn.BODY)]
		);
```
Query Conversations 
>❗ Requires READ_SMS permission. Add the following permission in your AndroidManifest.xml

<uses-permission android:name="android.permission.READ_SMS"/>
Works similar to SMS queries.

All columns are returned with every query. They are [ ConversationColumn.SNIPPET, ConversationColumn.THREAD_ID, ConversationColumn.MSG_COUNT ]
```dart
Uses ConversationFilter instead of SmsFilter.

List<SmsConversation> messages = await telephony.getConversations(
		filter: ConversationFilter.where(ConversationColumn.MSG_COUNT)
					  .equals("4")
					  .and(ConversationColumn.THREAD_ID)
					  .greaterThan("12"),
		sortOrder: [OrderBy(ConversationColumn.THREAD_ID, sort: Sort.ASC)]
		);
```
Listen to incoming SMS 
>❗ Requires RECEIVE_SMS permission.

To listen to incoming SMS add the RECEIVE_SMS permission to your AndroidManifest.xml file and register the BroadcastReceiver.
```xml
<manifest>
	<uses-permission android:name="android.permission.RECEIVE_SMS"/>

	<application>
		...
		...

		<receiver android:name="com.shounakmulay.telephony.sms.IncomingSmsReceiver"
		    android:permission="android.permission.BROADCAST_SMS" android:exported="true">
		    <intent-filter>
			<action android:name="android.provider.Telephony.SMS_RECEIVED"/>
		    </intent-filter>
		</receiver>

	</application>
</manifest>
```
Create a top-level static function to handle incoming messages when app is not is foreground.

⚠️ Avoid heavy computations in the background handler as Android system may kill long running operations in the background.
```dart
backgrounMessageHandler(SmsMessage message) async {
	//Handle background message	
}

void main() {
  runApp(MyApp());
}
```
Call listenIncomingSms with a foreground MessageHandler and pass in the static backgrounMessageHandler.

```dart
telephony.listenIncomingSms(
		onNewMessage: (SmsMessage message) {
			// Handle message
		},
		onBackgroundMessage: backgroundMessageHandler
	);
```
Preferably should be called early in app lifecycle.

If you do not wish to receive incoming SMS when the app is in background, just do not pass the onBackgroundMessage paramater.

Alternatively if you prefer to expecility disable background execution, set the listenInBackground flag to false.
```dart
telephony.listenIncomingSms(
		onNewMessage: (SmsMessage message) {
			// Handle message
		},
		listenInBackground: false
	);
 ```
As of the 1.12 release of Flutter, plugins are automatically registered. This will allow you to use plugins as you normally do even in the background execution context.
```dart
backgrounMessageHandler(SmsMessage message) async {
		// Handle background message
		
		// Use plugins
		Vibration.vibrate(duration: 500);
	}
```
Network data and metrics 
Fetch various metrics such as network type, sim state, etc.

```dart
// Check if a device is capable of sending SMS
bool canSendSms = await telephony.isSmsCapable;

// Get sim state
SimState simState = await telephony.simState;
```
Check out the detailed documentation to know all possible metrics and their values.

Executing in background 
If you want to call the telephony methods in background, you can do in the following ways.

1. Using only Telephony.instance
If you want to continue using Telephony.instance in the background, you will need to make sure that once the app comes back to the front, it again calls Telephony.instance.
```dart
backgrounMessageHandler(SmsMessage message) async {
	// Handle background message
	Telephony.instance.sendSms(to: "123456789", message: "Message from background")
}

void main() {
  runApp(MyApp());
}

class _MyAppState extends State<MyApp> {
  String _message;
  // This will not work as the instance will be replaced by
  // the one in background.
  final telephony = Telephony.instance;
  
   @override
  void initState() {
    super.initState();
    // You should make sure call to instance is made every time 
    // app comes to foreground
    final inbox = Telephony.instance.getInboxSms()
  }
```
2. Use backgroundInstance
If you cannot make sure that the call to instance would be made every time app comes to foreground, or if you would prefer to maintain a separate background instance, you can use Telephony.backgroundInstance in the background execution context.

```dart
backgrounMessageHandler(SmsMessage message) async {
	// Handle background message
	Telephony.backgroundInstance.sendSms(to: "123456789", message: "Message from background")
}

void main() {
  runApp(MyApp());
}

class _MyAppState extends State<MyApp> {
  String _message;
  final telephony = Telephony.instance;
  
   @override
  void initState() {
    super.initState();
    final inbox = telephony.getInboxSms()
  }
```

Features 
Send SMS
Query SMS
Inbox
Sent
Draft
Query Conversations
Listen to incoming SMS
When app is in foreground
When app is in background
Network data and metrics
Cellular data state
Call state
Data activity
Network operator
Network operator name
Data network type
Phone type
Sim operator
Sim operator name
Sim state
Network roaming
Signal strength
Service state
Start Phone Call
Schedule a SMS
SMS Retriever API

## Installing
Use this package as a library
Depend on it
Run this command:

With Flutter:

```terminal
 $ flutter pub add telephony
```

This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):

```ymal
dependencies:
  telephony: ^0.2.0
```

Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.

Import it
Now in your Dart code, you can use:

```dart
import 'package:telephony/telephony.dart';
```

## Example

``` dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:telephony/telephony.dart';

onBackgroundMessage(SmsMessage message) {
  debugPrint("onBackgroundMessage called");
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _message = "";
  final telephony = Telephony.instance;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  onMessage(SmsMessage message) async {
    setState(() {
      _message = message.body ?? "Error reading message body.";
    });
  }

  onSendStatus(SendStatus status) {
    setState(() {
      _message = status == SendStatus.SENT ? "sent" : "delivered";
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    final bool? result = await telephony.requestPhoneAndSmsPermissions;

    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: onMessage, onBackgroundMessage: onBackgroundMessage);
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Latest received SMS: $_message")),
          TextButton(
              onPressed: () async {
                await telephony.openDialer("123413453");
              },
              child: Text('Open Dialer'))
        ],
      ),
    ));
  }
}
```
