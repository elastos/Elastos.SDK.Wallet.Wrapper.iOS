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
    let mnemonic = ElastosWallet.GenerateMnemonic(language:"zh")
    print(mnemonic )
    
    let seed = ElastosWallet.GenerateSeed(mnemonic: mnemonic,language:"zh")
    print(seed)
    
    let path = NSHomeDirectory()
    let url = "https://api-wallet-ela-testnet.elastos.org"
    let appid  = "fe2dad7890d9cf301be581d5db5ad23a5efac604a9bc6a1ed3d15b24b4782d8da78b5b09eb80134209fd536505658fa151f685a50627b4f32bda209e967fc44a"
    
    let JsonData = "[{\"Key\":\"" + appid + "/nickName\", \"Value\":\"bob\"}]"
    
    let signInfo = ElastosWallet.GetSignInfo(path: path, url: url, seed: seed, jsonData: JsonData)
    print(signInfo ?? "")
    
    
    print("end call sdk")
    
    
    
    
  }


}

extension Data {
  func hexEncodedString() -> String {
    return map { String(format: "%02hhX", $0) }.joined()
  }
}
