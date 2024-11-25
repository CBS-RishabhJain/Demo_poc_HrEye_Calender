// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class HighchartsDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Highcharts in Flutter')),
//       body: WebView(
//         initialUrl: 'about:blank',
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (WebViewController webViewController) async {
//           final htmlData = await DefaultAssetBundle.of(context).loadString('assets/highcharts.html');
//           webViewController.loadUrl(Uri.dataFromString(htmlData, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
//         },
//       ),
//     );
//   }

