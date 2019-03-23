//
//  Did.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension elastos {
  open class Did : WalletBase  {
    init(obj: Int64) {
      super.init()
      mObj = obj
    }
    
    override func destroy() {
      if(mObj != 0) {
        AbstractLayer.Did.DestroyDid(obj: mObj)
        mObj = 0
      }
    }
    
    public func getId() -> String? {
      return AbstractLayer.Did.GetId(obj: mObj)
    }
    
    public func signInfo(seed: String, json: String) -> String? {
      return AbstractLayer.Did.SignInfo(obj: mObj, seed: seed, json: json)
    }
    
    public func setInfo(seed: String, json: String, wallet: HDWallet) -> String? {
      return AbstractLayer.Did.SetInfo(obj: mObj, seed: seed, json: json, wallet: wallet.getObject())
    }
    
    public func syncInfo() {
      AbstractLayer.Did.SyncInfo(obj: mObj)
    }
    
    public func getInfo(key: String) -> String? {
      return AbstractLayer.Did.GetInfo(obj: mObj, key: key)
    }
  }
}


