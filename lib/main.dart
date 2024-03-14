import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_pick_app/screen/login_screen.dart';
import 'package:food_pick_app/screen/main_screen.dart';
import 'package:food_pick_app/screen/register_screen.dart';
import 'package:food_pick_app/screen/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();// main 메소드에서 비동기로 데이터를 다루는 상황이 있을 때 반드시 최초에 호출해줘야 되는 메소드

  await dotenv.load();

  await Supabase.initialize(
    url: dotenv.get('PROJECT_URL'),
    anonKey: dotenv.get('PROJECT_API_KEY'),
  );
  await NaverMapSdk.instance.initialize(
    clientId: dotenv.get('NAVER_API_KEY'),
    onAuthFailed: (ex) => print('네이버 맵 인증오류 : $ex'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/main': (context) => MainScreen(),
      },
    );
  }
}
