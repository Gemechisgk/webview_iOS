import 'package:flutter/material.dart';
// This is for the SVG picture
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_test/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yenie Suq',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  final WebViewController firstPageWebController = WebViewController()
    ..loadRequest(Uri.parse("https://www.juicehouse.org/juicepress-index-app/"))
    ..setJavaScriptMode(JavaScriptMode.unrestricted);
  
  final WebViewController secondPageWebController = WebViewController()
    ..loadRequest(Uri.parse("https://mobile.yeniesuq.com"))
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Widget displayedWidget;

  @override
  void initState() {
    super.initState();
    // Set the default displayed widget to the second page
    displayedWidget = second_page(webController: widget.secondPageWebController);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      
      body: displayedWidget,
    );
  }
}
