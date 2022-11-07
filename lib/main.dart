import 'package:autocompost/app/autocompost.dart';
import 'package:autocompost/app/inject_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injectDependencies();
  runApp(const AutoCompostApp());
}

