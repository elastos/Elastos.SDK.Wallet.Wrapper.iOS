//
//  AbsLayerHDWallet.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension AbstractLayer {
  final class HDWallet {
    private init() {}
    
    public static func GetCoinType(obj: Int64) -> Int {
      let coinType = AbsLayer_HDWallet_GetCoinType(obj)
      
      return Int(coinType)
    }
    
    public static func SendTransaction(obj: Int64, transactions: [Int64],
                                       memo: String, seed: String, chain: String) -> String? {
      let transactionsPtr = Array.ToUnsafeMutablePointer(data: transactions)
      let memoPtr = String.ToUnsafeMutablePointer(data: memo)
      let seedPtr = String.ToUnsafeMutablePointer(data: seed)
      let chainPtr = String.ToUnsafeMutablePointer(data: chain)
      
      let txidPtr = AbsLayer_HDWallet_SendTransaction(obj, transactionsPtr, Int32(transactions.count),
                                                      memoPtr, seedPtr, chainPtr)
      let txid = String.FromUnsafeMutablePointer(data: txidPtr)
      AbstractLayer_FreeBuf(txidPtr)
      
      return txid
    }

    public static func GetAddress(obj: Int64, chain: Int, index: Int) -> String? {
      let addrPtr = AbsLayer_HDWallet_GetAddress(obj, Int32(chain), Int32(index))
      let addr = String.FromUnsafeMutablePointer(data: addrPtr)
      AbstractLayer_FreeBuf(addrPtr)
      
      return addr
    }
    
    public static func GetPublickey(obj: Int64, chain: Int, index: Int) -> String? {
      let pubKeyPtr = AbsLayer_HDWallet_GetPublickey(obj, Int32(chain), Int32(index))
      let pubKey = String.FromUnsafeMutablePointer(data: pubKeyPtr)
      AbstractLayer_FreeBuf(pubKeyPtr)
      
      return pubKey
    }
    
    public static func GetBalance(obj: Int64, address: String) -> Int64 {
      let addressPtr = String.ToUnsafeMutablePointer(data: address)
      
      let balance = AbsLayer_HDWallet_GetBalance(obj, addressPtr)
      
      return balance
    }
    
    public static func GetBalanceEx(obj: Int64) -> Int64 {
      let balance = AbsLayer_HDWallet_GetBalanceEx(obj)
      
      return balance
    }
    
    public static func SyncHistory(obj: Int64) -> Int {
      let ret = AbsLayer_HDWallet_SyncHistory(obj)
      
      return Int(ret)
    }
    
    public static func GetHistoryCount(obj: Int64, address: String) -> Int {
      let addressPtr = String.ToUnsafeMutablePointer(data: address)
      
      let count = AbsLayer_HDWallet_GetHistoryCount(obj, addressPtr)
      
      return Int(count)
    }
    
    public static func GetHistory(obj: Int64, address: String, pageSize: Int, page: Int, ascending: Bool) -> String? {
      let addressPtr = String.ToUnsafeMutablePointer(data: address)
      
      let historyPtr = AbsLayer_HDWallet_GetHistory(obj, addressPtr, Int32(pageSize), Int32(page), ascending)
      let history = String.FromUnsafeMutablePointer(data: historyPtr)
      AbstractLayer_FreeBuf(historyPtr)
      
      return history
    }

    public static func GetUsedAddresses(obj: Int64) -> [String] {
      var usedAddresse = [String]()

      let usedAddressePtr = AbsLayer_HDWallet_GetUsedAddresses(obj)
      var idx = 0
      while(usedAddressePtr![idx] != nil) {
        let addr = String.FromUnsafeMutablePointer(data: usedAddressePtr![idx])
        usedAddresse.append(addr!)
        idx += 1
      }
      AbsLayer_HDWallet_FreeAddresses(usedAddressePtr)
      
      return usedAddresse
    }
    
    public static func GetUnUsedAddresses(obj: Int64, count: Int) -> [String] {
      var unusedAddresse = [String]()
      
      let unusedAddressePtr = AbsLayer_HDWallet_GetUnUsedAddresses(obj, Int32(count))
      var idx = 0
      while(unusedAddressePtr![idx] != nil) {
        let addr = String.FromUnsafeMutablePointer(data: unusedAddressePtr![idx])
        unusedAddresse.append(addr!)
        idx += 1
      }
      AbsLayer_HDWallet_FreeAddresses(unusedAddressePtr)
      
      return unusedAddresse
    }
    
    public static func Recover(obj: Int64) -> Int {
      let ret = AbsLayer_HDWallet_Recover(obj)
      return Int(ret)
    }

    public static func DestroyHDWallet(obj: Int64) {
      AbsLayer_HDWallet_DestroyHDWallet(obj)
    }
  }
}
