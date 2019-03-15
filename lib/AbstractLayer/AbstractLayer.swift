//
//  AbstractLayer.swift
//  lib
//
//  Created by mengxk on 2018/12/28.
//  Copyright © 2018 Elastos. All rights reserved.
//

import Foundation

open class AbstractLayer {
  private init() {}

  open class IdentityManager {
    public static func GetMnemonic(language: String, words: String?) -> String? {
      let languagePtr = String.ToUnsafeMutablePointer(data: language)
      let wordsPtr = String.ToUnsafeMutablePointer(data: words)
      
      let mnemonicPtr = AbstractLayer_IdentityManager_GetMnemonic(languagePtr, wordsPtr)
      let mnemonic = String.FromUnsafeMutablePointer(data: mnemonicPtr)
      
      return mnemonic
    }
  }
}
