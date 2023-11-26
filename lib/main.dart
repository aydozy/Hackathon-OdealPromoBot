import 'package:flutter/material.dart';
import 'package:odeal_promobot_new/welcome_screen.dart';


// Bu sınıf, MaterialApp widget'ını kullanarak uygulamanın temel yapılandırmasını sağlar
// ve uygulamanın başlangıç ekranı olarak WelcomeScreen widget'ını ayarlar.
// 'debugShowCheckedModeBanner: false' ayarı, geliştirme modu etiketini gizler.


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),

    );
  }
}


