import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/config/database_config.dart';
import 'package:instagram/screens/signup_screen.dart';
import 'package:instagram/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: apiKey,
        appId: appId,
        messagingSenderId: messagingSenderId,
        projectId: projectId,
        storageBucket: storageBucket,
      )
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      // home: const ResponsiveLayout(
      //   mobileScrennLayout: MobileScreenLayout(),
      //   webScrennLayout: WebScreenLayout(),
      // ),
      home: const SignupScreen(),
    );
  }
}