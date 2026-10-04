import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const CvApp());

// Opción A = assets locales (offline) | Opción B = URL remota (GitHub Pages, etc.)
const bool usarRemoto = false;
const String urlRemota = 'https://TU_USUARIO.github.io/TU_REPO/';

class CvApp extends StatelessWidget {
  const CvApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Mi Hoja de Vida',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
        home: const CvPage(),
      );
}

class CvPage extends StatefulWidget {
  const CvPage({super.key});
  @override
  State<CvPage> createState() => _CvPageState();
}

class _CvPageState extends State<CvPage> {
  late final WebViewController _c;
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _c = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (_) => setState(() => _cargando = true),
        onPageFinished: (_) => setState(() => _cargando = false),
      ));
    if (usarRemoto) {
      _c.loadRequest(Uri.parse(urlRemota));
    } else {
      _c.loadFlutterAsset('assets/web/index.html');
    }
  }

  void _accion(int i) {
    switch (i) {
      case 0:
        _c.reload();
        break;
      case 1:
        _c.runJavaScript('toggleTheme()');
        break;
      case 2:
        SharePlus.instance.share(ShareParams(text: 'Mira la hoja de vida de Geily Recalde: $urlRemota'));
        break;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Hoja de Vida - Geily Recalde')),
        body: Stack(children: [
          WebViewWidget(controller: _c),
          if (_cargando) const LinearProgressIndicator(),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: _accion,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.refresh), label: 'Recargar'),
            BottomNavigationBarItem(icon: Icon(Icons.brightness_6), label: 'Tema'),
            BottomNavigationBarItem(icon: Icon(Icons.share), label: 'Compartir'),
          ],
        ),
      );
}
