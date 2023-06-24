steps: <br>
1- Register in firebse<br>
2- Create new application<br>
3- Copy the com.package..etc from the path:<br>
    root/android/app/src/main/AndroidManifest.xml<br>
4- Downlod the google.services.json in the /android/app directory<br>
5- follwo the steps or the commit(adding FCM notification) on github to modify the changes<br>
6- Enjoy<br>
7- add the follow up commit () to navigate into other screens and handle if the application is in the foreground :)<br>
7.1- go to path: <br>
    android\app\src\main\AndroidManifest.xml<br>
add the following:<br>
<meta-data 
    android:name="com.google.firebase.messaging.default_notification_channel_id"
    android:value="high_importance_channel" /><br>
7.2- ad img to path @drawable/ic_luncher, *Note:* you can add the img you want<br>
--------------------------------
**Note 1:** you should initNotification when SignUp success only(not in main)
**Note2:** don't forget to add this in the main:<br>
      static final navigatorKey =  GlobalKey<NavigatorState>();
------------------------------------------------------
**Note3:** To import the firebase package in the firebase_api.dart
you have to do the following:
- flutter pub add firebase_core
- flutter pub add firebase_messaging
- flutter pub add flutter_local_notifications: ^9.8.0+1
