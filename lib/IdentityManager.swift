//
//  IdentityManager.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

extension elastos {
  public final class IdentityManager  {
    private init() {}
    
    public static func ImportFromFile(filePath: String) -> Identity {
      fatalError("Unimplement method has called.")
    }
    
    public static func ExportToFile(identity: Identity, filePath: String) {
       fatalError("Unimplement method has called.")
    }
    
    public static func GetMnemonic(language: String, words: String) -> String? {
      return AbstractLayer.IdentityManager.GetMnemonic(language: language, words: words);
    }
    
    public static func GetSeed(mnemonic: String, language: String, words: String, mnemonicPassword: String) -> String? {
      return AbstractLayer.IdentityManager.GetSeed(mnemonic: mnemonic, language: language,
                                                   words: words, mnemonicPassword: mnemonicPassword)
    }
    
    public static func CreateIdentity(localPath: String) -> Identity {
      let obj = AbstractLayer.IdentityManager.CreateIdentity(localPath: localPath);
      return Identity(obj: obj);
    }
  }
}
