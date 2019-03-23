//
//  AbsLayerTransaction.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension AbstractLayer {
  final class Transaction {
    private init() {}
   
    public static func CreateTransaction(address: String, amount: Int64, coinType: Int) -> Int64 {
      let addressPtr = String.ToUnsafeMutablePointer(data: address)
      let tx = AbsLayer_Transaction_CreateTransaction(addressPtr, amount, Int32(coinType))
      return tx
    }
    
    public static func SetAddress(obj: Int64, address: String, coinType: Int) {
      let addressPtr = String.ToUnsafeMutablePointer(data: address)
      AbsLayer_Transaction_SetAddress(obj, addressPtr, Int32(coinType))
    }
    
    public static func SetAmount(obj: Int64, amount: Int64) {
      AbsLayer_Transaction_SetAmount(obj, amount)
    }
    
    public static func GetCoinTypeTx(obj: Int64) -> Int {
      let ret = AbsLayer_Transaction_GetCoinTypeTx(obj)
      return Int(ret)
    }
    
    public static func GetAddress(obj: Int64) -> String? {
      let addressPtr = AbsLayer_Transaction_GetAddress(obj)
      let address = String.FromUnsafeMutablePointer(data: addressPtr)
      AbstractLayer_FreeBuf(addressPtr)
      return address
    }
    
    public static func GetAmount(obj: Int64) -> Int64 {
      let amount = AbsLayer_Transaction_GetAmount(obj)
      return amount
    }
    
    public static func DestroyTransaction(obj: Int64) {
      AbsLayer_Transaction_DestroyTransaction(obj)
    }
  }
}
