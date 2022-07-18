import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:local_storage_regulation_api/local_storage_regulation_api.dart';

import 'bootstrap.dart';

// page 76
// blank field on bottom of pages 77 ...
// TODO drop links from unknown documents
// TODO links in paragpraphs
// TODO make editable
// TODO make tts
// TODO you can listen it in car
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));

  final regulationApi = LocalStorageRegulationApi(
    plugin: await SharedPreferences.getInstance(),
  );

  bootstrap(regulationApi: regulationApi);
}
