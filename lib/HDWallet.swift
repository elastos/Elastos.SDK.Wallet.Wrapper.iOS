//
//  HDWallet.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension elastos {
  open class HDWallet : WalletBase  {
    init(obj: Int64) {
      super.init()
      mObj = obj
    }
    
    override func destroy() {
      if(mObj != 0) {
        AbstractLayer.HDWallet.DestroyHDWallet(obj: mObj)
        mObj = 0
      }
    }
    
    public func getCoinType() -> Int {
      return AbstractLayer.HDWallet.GetCoinType(obj: mObj)
    }
    
    public func sendTransaction(transactions: [Transaction],
                                memo: String, seed: String, chain: String) -> String? {
      var txObjs = [Int64]()
      transactions.forEach { tx in
        txObjs.append(tx.getObject())
      }
      
      let txid = AbstractLayer.HDWallet.SendTransaction(obj: mObj, transactions: txObjs, memo: memo, seed: seed, chain: chain)
      
      return txid
    }
    
    public func getAddress(chain: Int, index: Int) -> String? {
      return AbstractLayer.HDWallet.GetAddress(obj: mObj, chain: chain, index:index)
    }
    
    public func getPublickey(chain: Int, index: Int) -> String? {
      return AbstractLayer.HDWallet.GetPublickey(obj: mObj, chain: chain, index: index)
    }
    
    public func getBalance(address: String) -> Int64 {
      return AbstractLayer.HDWallet.GetBalance(obj: mObj, address: address)
    }
    
    public func getBalance() -> Int64 {
      return AbstractLayer.HDWallet.GetBalanceEx(obj: mObj)
    }
    
    public func syncHistory() -> Int {
      return AbstractLayer.HDWallet.SyncHistory(obj: mObj)
    }
    
    public func getHistoryCount(address: String) -> Int {
      return AbstractLayer.HDWallet.GetHistoryCount(obj: mObj, address: address)
    }
    
    public func getHistory(address: String, pageSize: Int, page: Int, ascending: Bool) -> String? {
      return AbstractLayer.HDWallet.GetHistory(obj: mObj, address: address, pageSize: pageSize, page: page, ascending: ascending)
    }
    
    public func getUsedAddresses() -> [String] {
      return AbstractLayer.HDWallet.GetUsedAddresses(obj: mObj)
    }
    
    public func getUnUsedAddresses(count: Int) -> [String] {
      return AbstractLayer.HDWallet.GetUnUsedAddresses(obj: mObj, count: count)
    }
    
    public func recover() -> Int {
      return AbstractLayer.HDWallet.Recover(obj: mObj)
    }
  }
}
