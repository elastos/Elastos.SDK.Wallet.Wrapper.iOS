//
//  AbsLayerIdentityManager.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension AbstractLayer {
  final class IdentityManager {
    private init() {}

    public static func GetMnemonic(language: String, words: String) -> String? {
      let languagePtr = String.ToUnsafeMutablePointer(data: language)
      let wordsPtr = String.ToUnsafeMutablePointer(data: words)
      
      let mnemonicPtr = AbsLayer_IdentityManager_GetMnemonic(languagePtr, wordsPtr)
      let mnemonic = String.FromUnsafeMutablePointer(data: mnemonicPtr)
      AbstractLayer_FreeBuf(mnemonicPtr)
      
      return mnemonic
    }
    
    public static func GetSeed(mnemonic: String, language: String,
                               words: String, mnemonicPassword: String) -> String? {
      let mnemonicPtr = String.ToUnsafeMutablePointer(data: mnemonic)
      let languagePtr = String.ToUnsafeMutablePointer(data: language)
      let wordsPtr = String.ToUnsafeMutablePointer(data: words)
      let mnemonicPasswordPtr = String.ToUnsafeMutablePointer(data: mnemonicPassword)
      
      let seedPtr = AbsLayer_IdentityManager_GetSeed(mnemonicPtr, languagePtr,
                                                          wordsPtr, mnemonicPasswordPtr)
      let seed = String.FromUnsafeMutablePointer(data: seedPtr)
      AbstractLayer_FreeBuf(seedPtr)
      
      return seed
    }
    
    public static func CreateIdentity(localPath: String) -> Int64 {
      let localPathPtr = String.ToUnsafeMutablePointer(data: localPath)
      
      let obj = AbsLayer_IdentityManager_CreateIdentity(localPathPtr)
      
      return obj
    }
    
  }
}
