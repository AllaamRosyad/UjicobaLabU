import 'package:flutter/material.dart';
import 'package:t_store/features/laboratorium/screens/iot/led_controller.dart';

class LedControlScreen extends StatefulWidget {
  const LedControlScreen({super.key});

  @override
  _LedControlScreenState createState() => _LedControlScreenState();
}

class _LedControlScreenState extends State<LedControlScreen> {
  final LedController _ledController = LedController();
  bool _ledStatus = false;

  @override
  void initState() {
    super.initState();
    _ledController.getLedStatus((status) {
      setState(() {
        _ledStatus = status;
      });
    });
  }

  void _toggleLed(bool value) {
    _ledController.toggleLed(value, (status) {
      setState(() {
        _ledStatus = status;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LED & Buzzer Control')),
      body: Center(
        child: SwitchListTile(
          title: const Text('Cek Lokasi'),
          value: _ledStatus,
          onChanged: _toggleLed,
        ),
      ),
    );
  }
}
