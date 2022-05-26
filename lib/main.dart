import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:portfolio/Component/Home/homepage.dart';
import 'router_config.dart';
import 'router.dart';

void main() async {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialize(context, "/"),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == false) {
          return loadingPage();
        } else if (snapshot.hasError) {
          return errorPage();
        } else {
          return snapshot.data;
        }
      },
    );
  }
}

Future<Widget?> initialize(BuildContext context, String path) async {
  // stateful widget rebuild 특징상 2번 호출되는 문제
  await Future.delayed(const Duration(milliseconds: 1000));
  Widget res = const HomePage();
  return res;
}

Widget loadingPage() {
  return MaterialApp(
    home: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        DefaultTextStyle(
            style: TextStyle(fontSize: 48, color: Colors.black),
            child: Text("Loading...")),
        CircularProgressIndicator()
      ],
    ),
  );
}

Widget errorPage() {
  return MaterialApp(
    home: DefaultTextStyle(
      style: const TextStyle(fontSize: 48, color: Colors.black),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Error!",
            style: TextStyle(fontSize: 48, color: Colors.redAccent),
          ),
          Text(""),
          Text(
            "please wait a few minute, and try f5",
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    ),
  ); // 초기 로딩 에러 시 Error Screen
}