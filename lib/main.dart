import './data/localDb/local_db.dart';
import './app.dart';
import 'domain/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDb.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const App());
}
