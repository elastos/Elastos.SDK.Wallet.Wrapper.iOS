//
//  Identity.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension elastos {
  open class Identity : WalletBase  {
    init(obj: Int64) {
      super.init()
      mObj = obj
    }
    
    override func destroy() {
      if(mObj != 0) {
        AbstractLayer.Identity.DestroyIdentity(obj: mObj)
        mObj = 0
      }
    }
    
    public func createSingleAddressWallet(seed: String, node: BlockChainNode) -> HDWallet {
      let obj = AbstractLayer.Identity.CreateSingleAddressWallet(obj: mObj, seed: seed, node: node.getObject())
      return HDWallet(obj: obj)
    }
    
    public func createWallet(seed: String, coinType: Int, node: BlockChainNode) -> HDWallet {
      let obj = AbstractLayer.Identity.CreateWallet(obj: mObj, seed: seed, coinType: coinType, node: node.getObject())
      return HDWallet(obj: obj)
    }
    
    public func createDidManager(seed: String) -> DidManager {
      let obj = AbstractLayer.Identity.CreateDidManager(obj: mObj, seed: seed)
      return DidManager(obj: obj)
    }
  }
}


