//
//  AbsLayerBlockChainNode.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension AbstractLayer {
  final class BlockChainNode {
    private init() {}
    
    public static func NewBlockNode(url: String) -> Int64 {
      let urlPtr = String.ToUnsafeMutablePointer(data: url)
      let obj = AbsLayer_BlockChainNode_NewBlockNode(urlPtr)
      return obj
    }
    
    public static func SetUrl(obj: Int64, url: String) {
      let urlPtr = String.ToUnsafeMutablePointer(data: url)
      AbsLayer_BlockChainNode_SetUrl(obj, urlPtr)
    }
    
    public static func GetUrl(obj: Int64) -> String? {
      let urlPtr = AbsLayer_BlockChainNode_GetUrl(obj)
      let url = String.FromUnsafeMutablePointer(data: urlPtr)
      AbstractLayer_FreeBuf(urlPtr)
      return url
    }
    
    public static func SetCertificate(obj: Int64, cert: String) {
      let certPtr = String.ToUnsafeMutablePointer(data: cert)
      AbsLayer_BlockChainNode_SetCertificate(obj, certPtr)
    }
    
    public static func DestroyNode(obj: Int64) {
      AbsLayer_BlockChainNode_DestroyNode(obj)
    }
    
  }
}


