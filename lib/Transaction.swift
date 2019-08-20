//
//  Transaction.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension elastos {
  open class Transaction : WalletBase  {
    public init(address: String, amount: Int64, coinType: Int) {
      super.init()
      mObj = AbstractLayer.Transaction.CreateTransaction(address: address, amount: amount, coinType: coinType)
    }
    
    override func destroy() {
      if(mObj != 0) {
        AbstractLayer.Transaction.DestroyTransaction(obj: mObj)
        mObj = 0
      }
    }
    
    public func setAddress(address: String, coinType: Int) {
      AbstractLayer.Transaction.SetAddress(obj: mObj, address: address, coinType: coinType)
    }
    
    public func setAmount(amount: Int64) {
      AbstractLayer.Transaction.SetAmount(obj: mObj, amount: amount)
    }
    
    public func getCoinTypeTx() -> Int {
      let ret = AbstractLayer.Transaction.GetCoinTypeTx(obj: mObj)
      return ret
    }
    
    public func getAddress() -> String? {
      let address = AbstractLayer.Transaction.GetAddress(obj: mObj)
      return address
    }
    
    public func getAmount() -> Int64 {
      let amount = AbstractLayer.Transaction.GetAmount(obj: mObj)
      return amount
    }
  }
}
