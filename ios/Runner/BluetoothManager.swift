//
//  BluetoothManager.swift
//  Runner
//
//  Created by Steve Hopkins on 26/06/2025.
//

import CoreBluetooth

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

class BluetoothManager : NSObject, BluetoothMethodsApi, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    
    class StateEventsHandler : BluetoothStateEventsStreamHandler {
        var eventSink: PigeonEventSink<BluetoothStateEvent>?

        override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<BluetoothStateEvent>) {
            eventSink = sink
        }
        
        func onEvent(state: BluetoothStateEvent) {
            if let eventSink = eventSink {
                eventSink.success(state)
            }
        }
    }
    
    class ScanEventsHandler : ScanEventsStreamHandler {
        var eventSink: PigeonEventSink<ScanEvent>?
        
        override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<ScanEvent>) {
            eventSink = sink
        }
        
        func onEvent(event: ScanEvent) {
            if let eventSink = eventSink {
                eventSink.success(event)
            }
        }
    }
    
    class ConnectionEventsHandler : ConnectionEventsStreamHandler {
        var eventSink: PigeonEventSink<ConnectionEvent>?
        
        override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<ConnectionEvent>) {
            eventSink = sink
        }
        
        func onEvent(event: ConnectionEvent) {
            if let eventSink = eventSink {
                eventSink.success(event)
            }
        }
        
    }
    
    
    class CharacteristicEventsHandler : CharacteristicEventsStreamHandler {
        
        var eventSink: PigeonEventSink<CharacteristicEvent>?
        
        override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<CharacteristicEvent>) {
            eventSink = sink
        }
        
        func onEvent(event: CharacteristicEvent) {
            if let eventSink = eventSink {
                eventSink.success(event)
            }
        }
    }
    
    private var centralManager: CBCentralManager?
    private var serviceId : String?
    private var service : CBService?
    private var characteristics : [String : CBCharacteristic] = [:]
    
    private var bluetoothState : BluetoothState = .notSupported
    private var peripherals :  [String: CBPeripheral] = [:]
    private var connectedPeripheral: CBPeripheral?
    
    
    private let stateStream  = StateEventsHandler()
    private let scanStream = ScanEventsHandler()
    private let connectionStream = ConnectionEventsHandler()
    private let characteristicStream = CharacteristicEventsHandler()
    
    
    override init() {
        super.init()
    }
    
    init(binaryMessenger : FlutterBinaryMessenger) {
        super.init()
        
        centralManager = CBCentralManager(delegate: self, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey : true])
        
        BluetoothStateEventsStreamHandler.register(with: binaryMessenger,  instanceName: "", streamHandler: stateStream)
        ScanEventsStreamHandler.register(with: binaryMessenger,  instanceName: "", streamHandler: scanStream)
        ConnectionEventsStreamHandler.register(with: binaryMessenger,  instanceName: "", streamHandler: connectionStream)
        CharacteristicEventsStreamHandler.register(with: binaryMessenger,  instanceName: "", streamHandler: characteristicStream)
    }
    
    // ========================================================================================
    //                                    Bluetooth State
    // ========================================================================================
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            bluetoothState = .online
            
        case .poweredOff:
            bluetoothState = .offline
            
        case .resetting:
            bluetoothState = .offline
            
        case .unauthorized:
            bluetoothState = .offline
            
        case .unsupported:
            bluetoothState = .notSupported
            
        case .unknown:
            bluetoothState = .offline
            
        @unknown default:
            fatalError()
        }
        
        NSLog("bluetooth state event -> %lu", bluetoothState.rawValue)
        
        stateStream.onEvent(state: BluetoothStateEvent(state:bluetoothState))
    }
    
    func getBluetoothState() throws -> BluetoothState {
        NSLog("getBluetoothState -> %lu", bluetoothState.rawValue)
        return bluetoothState
    }
    
    
    // ========================================================================================
    //                                    Scanning
    // ========================================================================================
    // API
    func startScanning(service: String) throws {
        peripherals = [:]
        NSLog("Start scanning...")
        centralManager?.scanForPeripherals(withServices: [CBUUID(string: service)], options:nil)
    }
    
    // API
    func stopScanning() throws {
        NSLog("Stop scanning")
        centralManager?.stopScan()
    }
    
    // Delegate
    func centralManager(_ central: CBCentralManager,
                        didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any],
                        rssi RSSI: NSNumber) {
        if(peripheral.name != nil && peripherals[peripheral.name!] == nil) {
            peripherals.updateValue(peripheral, forKey: peripheral.name!)
            let scanEvent = ScanEvent(deviceName: peripheral.name!, deviceId: peripheral.name!)
            NSLog("Peripheral found %@", peripheral.name!)
            scanStream.onEvent(event: scanEvent)
        }
    }
    
    // ========================================================================================
    //                      Connection / disconnection
    // ========================================================================================
    // API
    func connect(deviceId: String, serviceId: String) throws {
        
        let p = peripherals[deviceId]
        if(p != nil) {
            NSLog("Connecting to device %@ service %@ ....", deviceId, serviceId)
            self.serviceId = serviceId
            connectionStream.onEvent(event: ConnectionEvent(deviceId: p!.name!, state: .connecting))
            connectedPeripheral = p
            peripherals = [:]
            centralManager!.connect(connectedPeripheral!)
        }
    }
    
    // API
    func disconnect(deviceId: String) throws {
        if deviceId == connectedPeripheral?.name {
            NSLog("Disconnecting from device %@", deviceId)
            centralManager?.cancelPeripheralConnection(connectedPeripheral!)
        }
    }
    
    // Central manager delegate
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        // Successfully connected. Store reference to peripheral if not already done.
        if(peripheral.name != nil) {
            NSLog("Peripheral %@ connected. Discovering services", peripheral.name!)
            peripheral.delegate = self
            self.connectedPeripheral = peripheral
            self.connectedPeripheral?.discoverServices([CBUUID(string: serviceId!)])
        } else {
            NSLog("Peripheral %@ connection failed", peripheral.name!)
            connectionStream.onEvent(event: ConnectionEvent(deviceId: peripheral.name!, state: .disconnected))
        }
    }
    
    // central manager delegate
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
    
        if(peripheral.name != nil) {
            NSLog("Peripheral %@ connection failed", peripheral.name!)
            self.connectedPeripheral = peripheral
            connectionStream.onEvent(event: ConnectionEvent(deviceId: peripheral.name!, state: .disconnected))
        }
    }
    
    // central manager delegate
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        NSLog("Peripheral disconnected");
        if(peripheral.name != nil) {
            NSLog("Peripheral %@ disconnected", peripheral.name!)
            self.connectedPeripheral = peripheral
            connectionStream.onEvent(event: ConnectionEvent(deviceId: peripheral.name!, state: .disconnected))
        }
    }
    
    // peripheral delegate
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: (any Error)?) {
        if peripheral.name == self.connectedPeripheral?.name {
            for s in peripheral.services! {
                if s.uuid.uuidString == serviceId!.uppercased() {
                    NSLog("Service %@ found", serviceId!)
                    service = s
                    break
                }
            }
            if service != nil {
                NSLog("Discovering characteristics...")
                connectedPeripheral?.discoverCharacteristics(nil, for: service!)
            } else {
                connectionStream.onEvent(event: ConnectionEvent(deviceId: peripheral.name!, state: .disconnected))
            }
        }
    }
    
    // peripheral delegate
    func peripheral( _ peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]){
        if service != nil && invalidatedServices.contains(service!) {
            NSLog("Service gone - disconnecting peripheral")
            service = nil
            centralManager?.cancelPeripheralConnection(connectedPeripheral!)
        }
    }
    
    //Peripheral delegate
    func peripheral(_ peripheral: CBPeripheral,  didDiscoverCharacteristicsFor service: CBService, error: (any Error)?){
        if(error == nil) {
            let charList = service.characteristics
            if charList?.count != 0 {
                for char in charList! {
                    characteristics[char.uuid.uuidString] = char
                    /*characteristicStream.onEvent(event:
                     CharacteristicEvent(
                     deviceId: connectedPeripheral!.name!,
                     serviceId: service.uuid.uuidString,
                     characteristicId: char.uuid.uuidString)
                     )*/
                }
                connectionStream.onEvent(event: ConnectionEvent(deviceId: peripheral.name!, state: .connected))
            } else {
                connectionStream.onEvent(event: ConnectionEvent(deviceId: peripheral.name!, state: .disconnected))
            }
        }
    }
    
    // ========================================================================================
    //                                   Characteristics
    // ========================================================================================
    // API
    func readCharacteristic(deviceId: String, service: String, characteristic: String) throws {

        NSLog("Read characteristic %@ %@ %@" , characteristic, service, deviceId)
        if deviceId == connectedPeripheral!.name && service.uppercased() == self.service!.uuid.uuidString {
            NSLog("Lookup characteristic")
            if let char = characteristics[characteristic.uppercased()] {
                NSLog("Setting value")
                self.connectedPeripheral!.readValue(for: char)
            }
        }
    }

    
    // API
    func writeCharacteristic(deviceId: String, service: String, characteristic: String, value: FlutterStandardTypedData) throws {
        NSLog("Write characteristic %@ %@ %@" , characteristic, service, deviceId)
        NSLog("Required %@ %@" , self.service!.uuid.uuidString, connectedPeripheral!.name!)
        
        if deviceId == connectedPeripheral!.name && service.uppercased() == self.service!.uuid.uuidString {
            NSLog("Lookup characteristic")
            if let char = characteristics[characteristic.uppercased()] {
                NSLog("Setting value")
                self.connectedPeripheral!.writeValue(value.data, for: char, type: .withResponse)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        NSLog("Wrote characteristic %@ %@" , peripheral.name!, characteristic.uuid.uuidString)
        if error != nil {
            NSLog("Write failed")
        }
    }

    // peripheral delegate
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        //NSLog("Characteristic %@ updated")
        guard let value = characteristic.value else {
            return
        }
        let evt = CharacteristicEvent(
                deviceId: connectedPeripheral!.name!,
                serviceId: service!.uuid.uuidString,
                characteristicId: characteristic.uuid.uuidString,
                data: FlutterStandardTypedData.init(bytes: value)
            )
            
        characteristicStream.onEvent(event: evt)
    }


    // API
    func subscribeCharacteristic(deviceId: String, service: String, characteristic: String) throws {
        NSLog("Setting notification for %@ ", characteristic)

        if let char = characteristics[characteristic.uppercased()] {
            NSLog("Setting notification for %@ ", characteristic)
            connectedPeripheral?.setNotifyValue(true, for: char)
        }
    }
}

