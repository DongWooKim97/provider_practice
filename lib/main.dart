import 'package:flutter/material.dart';
import 'package:provider_project/riverpod/provider_observer.dart';
import 'package:provider_project/screen/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger(),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    )
  );
}

