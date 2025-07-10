import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/interface.g.dart',
  dartOptions: DartOptions(),
  dartPackageName: "BluetoothPlugin",
  swiftOut: 'macos/Runner/Bluetooth.g.swift',
  swiftOptions: SwiftOptions(),
))

enum BluetoothState { offline, online, notSupported }
enum ServiceState {started, stopped}
enum ConnectionState { connected, connecting, disconnected}

class BluetoothStateEvent {
  BluetoothStateEvent({required this.state});
  BluetoothState state;
}

class ServiceStateEvent {
  ServiceStateEvent({required this.deviceId, required this.service, required this.state});
  String deviceId;
  String service;
  ServiceState state;
}

class ConnectionEvent {
  ConnectionEvent({required this.deviceId, required this.state});
  String deviceId;
  ConnectionState state;
}

class ScanEvent {
  ScanEvent({required this.deviceName, required this.deviceId });
  String deviceName;
  String deviceId;
}

class ServiceDescription {
  ServiceDescription({required this.uuid});
  String uuid;
}

class CharacteristicEvent {
  CharacteristicEvent({
    required this.deviceId,
    required this.serviceId,
    required this.characteristicId,
    required this.data
  });
  String deviceId;
  String serviceId;
  String characteristicId;
  Uint8List data;
}

@HostApi()
abstract class BluetoothMethodsApi {
  BluetoothState getBluetoothState();

  void startScanning(String service);
  void stopScanning();

  void connect(String deviceId, String serviceId);
  void disconnect(String deviceId);

  void readCharacteristic(String deviceId, String service, String characteristic);
  void writeCharacteristic(String deviceId, String service, String characteristic, Uint8List value);
  void subscribeCharacteristic(String deviceId, String service, String characteristic);
}

@EventChannelApi()
abstract class BluetoothEventsApi {
  BluetoothStateEvent bluetoothStateEvents();
  ScanEvent scanEvents();
  ConnectionEvent connectionEvents();
  CharacteristicEvent characteristicEvents();
}
