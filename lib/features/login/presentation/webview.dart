import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final Function(String)? onPageFinished;

  const WebViewScreen({
    required this.url,
    this.onPageFinished,
    Key? key,
  }) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) async {
          // Verifica se a URL contém o código/tokens necessários
          if (url.contains('code=')) {
            // Extraia o código/tokens da URL
            final uri = Uri.parse(url);
            final String? code = uri.queryParameters['code'];

            if (code != null) {
              // Aqui você faria uma troca de código por um token de acesso (exemplo)
              // String accessToken = await exchangeCodeForAccessToken(code);

              // Por enquanto, vou armazenar diretamente como um token de acesso
              await secureStorage.write(key: 'accessToken', value: code);

              // Imprime o token no console
              print('Access Token: $code');

              // Chame o callback passado se existir
              widget.onPageFinished?.call(url);

              // Redireciona para outra tela após a autenticação bem-sucedida
              Get.offAllNamed('/main');
            }
          }
        },
      ))
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
