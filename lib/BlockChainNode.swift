//
//  BlockChainNode.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension elastos {
  open class BlockChainNode : WalletBase  {
    public init(url: String) {
      super.init()
      mObj = AbstractLayer.BlockChainNode.NewBlockNode(url: url)
    }
    
    override func destroy() {
      if(mObj != 0) {
        AbstractLayer.BlockChainNode.DestroyNode(obj: mObj)
        mObj = 0
      }
    }
    
    public func setUrl(url: String) {
      AbstractLayer.BlockChainNode.SetUrl(obj: mObj, url: url)
    }
    
    public func getUrl() -> String? {
      let url = AbstractLayer.BlockChainNode.GetUrl(obj: mObj)
      return url;
    }
    
    public func setCertificate(cert: String) {
      AbstractLayer.BlockChainNode.SetCertificate(obj: mObj, cert: cert)
    }
  }
}
