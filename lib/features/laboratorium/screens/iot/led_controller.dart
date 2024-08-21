import 'package:firebase_database/firebase_database.dart';

class LedController {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  bool _ledStatus = false;

  /// Fetches the current status of the LED from the Firebase Realtime Database.
  Future<void> getLedStatus(Function(bool) onStatusChanged) async {
    final DataSnapshot snapshot = await _database.child('LED_STATUS').get();
    if (snapshot.exists) {
      _ledStatus = snapshot.value == 'ON';
      onStatusChanged(_ledStatus);
      print('Current LED_STATUS: ${snapshot.value}');
    } else {
      print('Failed to retrieve LED_STATUS');
    }
  }

  /// Toggles the LED status and updates it in the Firebase Realtime Database.
  void toggleLed(bool value, Function(bool) onStatusChanged) {
    _ledStatus = value;
    _database.child('LED_STATUS').set(_ledStatus ? 'ON' : 'OFF');
    onStatusChanged(_ledStatus);
    print('LED status updated to: ${_ledStatus ? 'ON' : 'OFF'}');
  }
}
