import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ikiaralik/push_notification_service.dart';

import 'Home.dart';
import 'firebase_options.dart';

//function to lisen to bacground changes
Future _firebaseBackgroundMessage(RemoteMessage message) async{
  if(message.notification!=null){
    print('Mesaj BAŞARILI');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  PushNotificaionService.init();
   //Listen to background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
