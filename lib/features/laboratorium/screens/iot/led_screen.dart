import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class LedControlScreen extends StatefulWidget {
  const LedControlScreen({super.key});

  @override
  _LedControlScreenState createState() => _LedControlScreenState();
}

class _LedControlScreenState extends State<LedControlScreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  bool _ledStatus = false;

  @override
  void initState() {
    super.initState();
    _getLedStatus();
  }

  void _getLedStatus() async {
    final DataSnapshot snapshot = await _database.child('LED_STATUS').get();
    if (snapshot.exists) {
      if (mounted) {
        setState(() {
          _ledStatus = snapshot.value == 'ON';
        });
      }
      print('Current LED_STATUS: ${snapshot.value}');
    } else {
      print('Failed to retrieve LED_STATUS');
    }
  }

  void _toggleLed() {
    if (mounted) {
      setState(() {
        _ledStatus = !_ledStatus;
      });
    }
    _database.child('LED_STATUS').set(_ledStatus ? 'ON' : 'OFF');
    print('LED status updated to: ${_ledStatus ? 'ON' : 'OFF'}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LED & Buzzer Control')),
      body: Center(
        child: SwitchListTile(
          title: const Text('Cek Lokasi'),
          value: _ledStatus,
          onChanged: (value) {
            _toggleLed();
          },
        ),
      ),
    );
  }
}
