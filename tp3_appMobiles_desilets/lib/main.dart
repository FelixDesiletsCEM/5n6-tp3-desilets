import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tp3_appmobiles_desilets/pages/connexion_page.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'generated/l10n.dart';

const supabaseUrl = 'https://qtnjlvjljrnkebcwpvfi.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF0bmpsdmpsanJua2ViY3dwdmZpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM4NTQxMTQsImV4cCI6MjA0OTQzMDExNH0.w_23OxlfNXpFBc6uuuhzEy7UU59Zi9twDE4f8P77p4Y';


void main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const ConnexionPage(),
    );
  }
}