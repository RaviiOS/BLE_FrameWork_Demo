//
//  BLEHandler.swift
//  BLE_FrameWork_Demo
//
//  Created by Ravi kumar Yaganti on 28/10/19.
//  Copyright © 2019 Ravi kumar Yaganti. All rights reserved.
//

import Foundation
import CoreBluetooth

class BLEHandler: NSObject {
    
    override init (){
        super.init()
    }
}

extension BLEHandler: CBCentralManagerDelegate{
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unsupported:
            print("BLE is unsupported!")
            break
        case .unauthorized:
            print("BLE is unauthorized!")
        case .unknown:
            print("BLE is unknown!")
        case .resetting:
            print("BLE is resetting!")
        case .poweredOff:
            print("BLE is powered off!")
        case .poweredOn:
            print("BLE is powered on!")
            print("<=== Started scanning! ====>")
            central.scanForPeripherals(withServices: nil, options: nil)
        default:
            print("BLE default")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(" ***===== Device Found --> \(peripheral.name ?? "") : \(RSSI) ===****")
    }
}
