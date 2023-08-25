import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/api_service.dart';
import 'home_screen.dart';

class DummyHome extends StatefulWidget {
  const DummyHome({super.key});

  @override
  State<DummyHome> createState() => _DummyHomeState();
}

class _DummyHomeState extends State<DummyHome> {
  @override
  void initState() {
    ApiService().getfeeds();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy Home'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.to(HomeScreen());
                },
                child: Text('Testing')),
          )
        ],
      ),
    );
  }
}
