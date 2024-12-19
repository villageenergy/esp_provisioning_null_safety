import 'package:collection/collection.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleDevice {
  final BluetoothDevice peripheral;
  final String name;
  int rssi;

  String get id => peripheral.remoteId.str;

  BleDevice(ScanResult scanResult)
      : peripheral = scanResult.device,
        name = scanResult.device.platformName,
        rssi = scanResult.rssi;

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(other) =>
      other is BleDevice &&
      compareAsciiLowerCase(this.name, other.name) == 0 &&
      this.id == other.id &&
      this.rssi == other.rssi;

  @override
  String toString() {
    return 'BleDevice {name: $name, id: $id, rssid: $rssi}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rssi': rssi,
      'peripheral': peripheral,
    };
  }

  int compareTo(BleDevice other) {
    if (rssi > other.rssi) {
      return -1;
    }
    if (rssi == other.rssi) {
      return 0;
    }
    return 1;
  }
}
