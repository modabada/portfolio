import 'package:flutter/material.dart';
import 'package:portfolio/Component/Home/homepage.dart';
import 'router_config.dart';
import 'package:fluro/fluro.dart';
import 'router.dart';

void main() async {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  _AppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(context),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == false) {
          return MaterialApp(
            home: Column(
              children: const [
                Center(
                  child: Text("Loading..."),
                ),
                CircularProgressIndicator()
              ],
            ),
          ); // 초기 로딩 시 Splash Screen
        } else if (snapshot.hasError) {
          return const MaterialApp(
            home: Center(
              child: Text("Error!"),
            ),
          ); // 초기 로딩 에러 시 Error Screen
        } else {
          return snapshot.data;
        }
      },
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future<Widget?> initialize(BuildContext context) async {
    // stateful widget rebuild 특징상 2번 호출되는 문제
    await Future.delayed(const Duration(milliseconds: 1000));
    return MaterialApp(
      title: '서울로봇고 문인우의 포트폴리오',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      home: Column(
        children: const [
          Expanded(
            child: HomePage(),
          ),
          // 제작중: 스크롤바
        ],
      ),
    ); // 초기 로딩 완료 시 띄울 앱 첫 화면
  }
}
