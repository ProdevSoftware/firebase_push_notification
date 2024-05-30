# Firebase Push Notification

This README file provides a step-by-step guide on integrating Firebase Push Notifications into your Flutter application. Follow the instructions below to set up and configure push notifications for both Android and iOS platforms.

## Features

- Receive notification when app in foreground, background and terminate state
- Tap on notification and redirect to specific screen

## Getting Started

1) Check official firebase documentation for configure firebase in your app
https://firebase.google.com/docs/flutter/setup

2) Enable Notification

    On your console, first, go to the project that you created. Now, go to Messaging tab from the right panel and you will be able to see a button for Create your first campaian.

   ![Screenshot 2024-05-30 at 11 11 37 AM](https://github.com/ProdevSoftware/firebase_push_notification/assets/97152083/44c563cc-e96b-4b32-9c9e-17c6bcb0eba7)
   
    Click on Firebase notificatoin messsages.

   ![Screenshot 2024-05-30 at 11 12 12 AM](https://github.com/ProdevSoftware/firebase_push_notification/assets/97152083/be0ca6af-4467-42d6-ad8b-94fe78d08e06)

    Add notification title and body then click on send test messsage.
   
   ![Screenshot 2024-05-30 at 11 15 32 AM](https://github.com/ProdevSoftware/firebase_push_notification/assets/97152083/7475fee8-fa34-4358-a7ee-ae681b6c6467)

   Add fcm token and click on test.


3) Dependencies

    Add below dependencies in pubspec.yaml 
```
dependencies:
  firebase_messaging: ^14.9.3
  flutter_local_notifications: ^17.1.2
  firebase_core: ^2.31.1
```
   Add permission in AndroidManifest.xml
```
  <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
```
   Add below part inside <activity> tag in AndroidManifest.xml
```
            <meta-data
                android:name="com.google.firebase.messaging.default_notification_channel_id"
                android:value="message" />
            <meta-data
                android:name="com.google.firebase.messaging.default_notification_icon"
                android:resource="@drawable/ic_launcher" />
            <intent-filter>
                <action android:name="FLUTTER_NOTIFICATION_CLICK" />
                <category android:name="android.intent.category.DEFAULT" />
            </intent-filter>
```

   Add below part in info.plist
```
      <key>UIBackgroundModes</key>
    	<array>
    		<string>fetch</string>
    		<string>remote-notification</string>
    	</array>
```     

4) Code Setup

- initialize Firebase in your main file   
```
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}
```

Now , follow the notification_service.dart file to set up notification initialization
https://github.com/ProdevSoftware/firebase_push_notification/blob/main/lib/services/notification_service.dart

## Videos

https://github.com/ProdevSoftware/firebase_push_notification/assets/97152083/7309f10d-08db-42ed-a6a0-8a3dd89463e1

