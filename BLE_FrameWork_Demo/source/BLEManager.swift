//
//  SDBLEHomeViewController.swift
//  BLE_FrameWork_Demo
//
//  Created by Ravi kumar Yaganti on 28/10/19.
//  Copyright © 2019 Ravi kumar Yaganti. All rights reserved.
//

import Foundation
import CoreBluetooth

public class BLEManager{
    var centeralManager: CBCentralManager!
    var bleHandler: BLEHandler // delegate
    
   public init() {
        self.bleHandler = BLEHandler()
        self.centeralManager = CBCentralManager(delegate: self.bleHandler, queue: nil)
    }
    
    public func connectPeripheral(peripheral: CBPeripheral){
        if self.centeralManager.isScanning{
            self.centeralManager.connect(peripheral, options: nil)
        }
    }
    
    public func disconnectPeripheral(peripheral: CBPeripheral){
        self.centeralManager.cancelPeripheralConnection(peripheral)
    }
}


/*
 
 Usage:
 
 var bleManager : BLEManager!
 
 override func viewDidLoad(){
    bleManager = BLEManager()
 }
 */
