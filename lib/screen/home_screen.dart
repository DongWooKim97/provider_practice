import 'package:flutter/material.dart';
import 'package:provider_project/layout/default_layout.dart';
import 'package:provider_project/screen/future_provider_screen.dart';
import 'package:provider_project/screen/state_notifier_provider_screen.dart';
import 'package:provider_project/screen/state_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Home Screen',
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => StateProviderScreen())
              );
            },
            child: Text('StateProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => StateNotifierProviderScreen())
              );
            },
            child: Text('StateNotifierProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => FutureProviderScreen())
              );
            },
            child: Text('FutureProviderScreen'),
          ),
        ],
      ),
    );
  }
}
