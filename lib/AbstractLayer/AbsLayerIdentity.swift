//
//  AbsLayerIdentity.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension AbstractLayer {
  final class Identity {
    private init() {}
    
    public static func CreateSingleAddressWallet(obj: Int64, seed: String, node: Int64) -> Int64 {
      let seedPtr = String.ToUnsafeMutablePointer(data: seed)
      let obj = AbsLayer_Identity_CreateSingleAddressWallet(obj, seedPtr, node)
      return obj
    }
    
    public static func CreateWallet(obj: Int64, seed: String, coinType: Int, node: Int64) -> Int64 {
      let seedPtr = String.ToUnsafeMutablePointer(data: seed)
      let obj = AbsLayer_Identity_CreateWallet(obj, seedPtr, Int32(coinType), node)
      return obj
    }
    
    public static func CreateDidManager(obj: Int64, seed: String) -> Int64 {
      let seedPtr = String.ToUnsafeMutablePointer(data: seed)
      let obj = AbsLayer_Identity_CreateDidManager(obj, seedPtr)
      return obj
    }
    
    public static func DestroyIdentity(obj: Int64) {
      AbsLayer_Identity_DestroyIdentity(obj)
    }
  }
}



