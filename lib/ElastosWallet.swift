//
//  ElastosWallet.swift
//  lib
//
//  Created by mengxk on 2018/11/3.
//  Copyright © 2018 Elastos. All rights reserved.
//

import Foundation

open class ElastosWallet  {
  private init() {}


  public static func GenerateMnemonic(language: String, words: String?) -> String? {
    let mnemonic = AbstractLayer.IdentityManager.GetMnemonic(language: language, words: words)
    return mnemonic
  }
}
