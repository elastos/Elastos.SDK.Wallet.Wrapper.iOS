//
//  ViewController.swift
//  test
//
//  Created by mengxk on 2018/11/3.
//  Copyright © 2018 Elastos. All rights reserved.
//

import UIKit

import ElastosSdkWallet

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    print("star call sdk")
    let mnemonic = ElastosWalletSDK.GenerateMnemonic(language:"zh")
    print(mnemonic )
    
    let seed = ElastosWalletSDK.GenerateSeed(mnemonic: mnemonic,language:"zh")
    print(seed)
    
    //Get SignInfo
    let path = NSHomeDirectory()
    let url = "https://api-wallet-ela-testnet.elastos.org"
    let appid  = "fe2dad7890d9cf301be581d5db5ad23a5efac604a9bc6a1ed3d15b24b4782d8da78b5b09eb80134209fd536505658fa151f685a50627b4f32bda209e967fc44a"
    
    let JsonData = "[{\"Key\":\"" + appid + "/nickName\", \"Value\":\"bob\"}]"
    
    let signInfo = ElastosWalletSDK.GetSignInfo(path: path, url: url, seed: seed, jsonData: JsonData)
    
    
    print("sign info is start ...:\n")
    print(signInfo ?? "")
    
    
    //Write info
    
    
    
    
    
    
    //Get getInfo
    let key = "DID/Publickey"
    let info = ElastosWalletSDK.GetInfo(path: path, seed: seed, key: key)
    print("info is start ...:\n")
    print(info ?? "")
    print("info is end ...:\n")
    
    
    print("end call sdk")
    
    
    
    
  }


}

extension Data {
  func hexEncodedString() -> String {
    return map { String(format: "%02hhX", $0) }.joined()
  }
}
