//
//  AbsLayerDid.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension AbstractLayer {
  final class Did {
    private init() {}
    
    public static func GetId(obj: Int64) -> String? {
      let idPtr = AbsLayer_Did_GetId(obj)
      let id = String.FromUnsafeMutablePointer(data: idPtr)
      AbstractLayer_FreeBuf(idPtr)
      return id
    }
    
    public static func SignInfo(obj: Int64, seed: String, json: String) -> String? {
      let seedPtr = String.ToUnsafeMutablePointer(data: seed)
      let jsonPtr = String.ToUnsafeMutablePointer(data: json)
      let signedInfoPtr = AbsLayer_Did_SignInfo(obj, seedPtr, jsonPtr)
      let signedInfo = String.FromUnsafeMutablePointer(data: signedInfoPtr)
      AbstractLayer_FreeBuf(signedInfoPtr)
      return signedInfo
    }
    
    public static func SetInfo(obj: Int64, seed: String, json: String, wallet: Int64) -> String? {
      let seedPtr = String.ToUnsafeMutablePointer(data: seed)
      let jsonPtr = String.ToUnsafeMutablePointer(data: json)
      let txidPtr = AbsLayer_Did_SetInfo(obj, seedPtr, jsonPtr, wallet)
      let txid = String.FromUnsafeMutablePointer(data: txidPtr)
      AbstractLayer_FreeBuf(txidPtr)
      return txid
    }
    
    public static func SyncInfo(obj: Int64) {
      AbsLayer_Did_SyncInfo(obj)
    }
    
    public static func GetInfo(obj: Int64, key: String) -> String? {
      let keyPtr = String.ToUnsafeMutablePointer(data: key)
      let infoPtr = AbsLayer_Did_GetInfo(obj, keyPtr)
      let info = String.FromUnsafeMutablePointer(data: infoPtr)
      AbstractLayer_FreeBuf(infoPtr)
      return info
    }
    
    public static func DestroyDid(obj: Int64) {
      AbsLayer_Did_DestroyDid(obj)
    }
  }
}



