import 'package:flutter/material.dart';
import 'package:push_notification_demo/services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FireBasePushNotification notification = FireBasePushNotification();

  @override
  void initState() {
    super.initState();
    notification.permissionRequest();
    notification.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                notification.navigateToOtherScreen();
              },
              child: const Text('SUBMIT'),
            ),
          ],
        ),
      ),
    );
  }
}
