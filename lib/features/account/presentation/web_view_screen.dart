// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class AuthWebView extends StatefulWidget {
//   final String authorizationUrl;
//   final String redirectUri;

//   AuthWebView({
//     required this.authorizationUrl,
//     required this.redirectUri,
//   });

//   @override
//   _AuthWebViewState createState() => _AuthWebViewState();
// }

// class _AuthWebViewState extends State<AuthWebView> {
//   late WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     // Necessário para inicializar o WebView no Android
//     if (WebView.platform is AndroidWebView) {
//       WebView.platform = SurfaceAndroidWebView();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Autenticação'),
//       ),
//       body: WebView(
//         initialUrl: widget.authorizationUrl,
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (WebViewController webViewController) {
//           _controller = webViewController;
//         },
//         navigationDelegate: (NavigationRequest request) {
//           if (request.url.startsWith(widget.redirectUri)) {
//             final code = Uri.parse(request.url).queryParameters['code'];
//             Navigator.pop(context, code);
//             return NavigationDecision.prevent;
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     );
//   }
// }
