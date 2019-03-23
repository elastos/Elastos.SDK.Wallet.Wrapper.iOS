//
//  AbsLayerDidManager.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension AbstractLayer {
  final class DidManager {
    private init() {}

    public static func CreateDid(obj: Int64, index: Int) -> Int64 {
      let did = AbsLayer_DidManager_CreateDid(obj, Int32(index))
      return did
    }
    
    public static func DidRecover(obj: Int64) -> Int {
      return Int(AbsLayer_DidManager_DidRecover(obj))
    }
    
    public static func DestroyDidManager(obj: Int64) {
      AbsLayer_DidManager_DestroyDidManager(obj)
    }
    
  }
}

