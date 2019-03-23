//
//  AbstractLayer.swift
//  lib
//
//  Created by mengxk on 2018/12/28.
//  Copyright © 2018 Elastos. All rights reserved.
//

import Foundation

final class AbstractLayer {
    private init() {}
  
//    open class IdentityManager {
//        
//        public static func GetMnemonic(language: String, words: String?) -> String? {
//            
//            //print("start Abstract.swift GetMnemonic")
//            
//            let languagePtr = String.ToUnsafeMutablePointer(data: language)
//            let wordsPtr = String.ToUnsafeMutablePointer(data: words)
//            
//            let mnemonicPtr = AbstractLayer_IdentityManager_GetMnemonic(languagePtr, wordsPtr)
//            //print(mnemonicPtr)
//            let mnemonic = String.FromUnsafeMutablePointer(data: mnemonicPtr)
//            //print("end Abstract.swift GetMnemonic")
//            
//            AbstractLayer_IdentityManager_FreeBuf(mnemonicPtr)
//            
//            return mnemonic
//        }
//        
//        public static func GetSeed(mnemonic: String,language: String, words: String?,mnemonicPassword: String?) -> String? {
//            
//            //print("start Abstract.swift GetMnemonic")
//            let mnemonicPtr = String.ToUnsafeMutablePointer(data: mnemonic)
//            let languagePtr = String.ToUnsafeMutablePointer(data: language)
//            let wordsPtr = String.ToUnsafeMutablePointer(data: words)
//            let mnemonicPasswordPtr = String.ToUnsafeMutablePointer(data: mnemonicPassword)
//            
//            let seedPtr = AbstractLayer_IdentityManager_GetSeed(mnemonicPtr, languagePtr, wordsPtr, mnemonicPasswordPtr)
//            
//            //print(mnemonicPtr)
//            let seed = String.FromUnsafeMutablePointer(data: seedPtr)
//            //print("end Abstract.swift GetMnemonic")
//            AbstractLayer_IdentityManager_FreeBuf(seedPtr)
//            
//            return seed
//        }
//        
//        
//        public static func GetSignInfo(path:String,url:String,seed:String,jsonData:String) -> String?{
//            
//            //
//            let pathPtr = String.ToUnsafeMutablePointer(data: path)
//            let urlPtr = String.ToUnsafeMutablePointer(data: url)
//            let seedPtr = String.ToUnsafeMutablePointer(data: seed)
//            let jsonDataPtr = String.ToUnsafeMutablePointer(data: jsonData)
//            
//            let signInfoPtr = AbstractLayer_IdentityManager_GetSignInfo(pathPtr,urlPtr,seedPtr,jsonDataPtr)
//            let signInfo = String.FromUnsafeMutablePointer(data: signInfoPtr)
//            
//            AbstractLayer_IdentityManager_FreeBuf(signInfoPtr)
//            
//            return signInfo;
//            
//        }
//        
//        public static func GetInfo(path:String,seed:String,key:String) -> String?{
//            
//            //
//            let pathPtr = String.ToUnsafeMutablePointer(data: path)
//            let seedPtr = String.ToUnsafeMutablePointer(data: seed)
//            let keyPtr = String.ToUnsafeMutablePointer(data: key)
//            
//            let infoPtr = AbstractLayer_IdentityManager_GetInfo(pathPtr,seedPtr,keyPtr)
//            let info = String.FromUnsafeMutablePointer(data: infoPtr)
//            
//            AbstractLayer_IdentityManager_FreeBuf(infoPtr)
//            
//            return info;
//            
//        }
//        
//        
//    }
//    
//    
}

