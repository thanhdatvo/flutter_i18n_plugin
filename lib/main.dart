import 'package:flutter/material.dart';

import 'package:flutter_i18n_plugin/generated/i18n.dart';

void main() async {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String _locale = 'en';
  onChangeLanguage() {
    if (_locale == 'en') {
      setState(() {
        _locale = 'fr';
      });
    } else {
      setState(() {
        _locale = 'en';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        locale: Locale(_locale, ""),
        localizationsDelegates: [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        localeResolutionCallback:
            S.delegate.resolution(fallback: new Locale("en", "")),
        home: AppBody(this.onChangeLanguage));
  }
}

class AppBody extends StatelessWidget {
  final VoidCallback onChangeLanguage;
  AppBody(this.onChangeLanguage);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(S.of(context).hello),
        ),
        body: new Center(
          child: new Text(S.of(context).greetTo('Nina')),
        ),
        floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.language), onPressed: onChangeLanguage));
  }
}
