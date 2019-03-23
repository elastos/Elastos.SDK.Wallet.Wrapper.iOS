//
//  DidManager.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension elastos {
  open class DidManager : WalletBase  {
    init(obj: Int64) {
      super.init()
      mObj = obj
    }
    
    override func destroy() {
      if(mObj != 0) {
        AbstractLayer.DidManager.DestroyDidManager(obj: mObj)
        mObj = 0
      }
    }
    
    public func createDid(index: Int) -> Did {
      let obj = AbstractLayer.DidManager.CreateDid(obj: mObj, index: index)
      return Did(obj: obj)
    }
    
    public func recover() -> Int {
      return AbstractLayer.DidManager.DidRecover(obj: mObj)
    }
  }
}
