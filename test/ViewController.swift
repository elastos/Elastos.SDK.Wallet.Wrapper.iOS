//
//  ViewController.swift
//  test
//
//  Created by mengxk on 2018/11/3.
//  Copyright © 2018 Elastos. All rights reserved.
//

import UIKit

import ElastosSDKWallet

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    ElastosSDKWallet.test()
    let mnemonic = "hobby theme load okay village inhale garlic box cement draft patrol net"
    
    var seed = Data()
    
    let seedStr = seed.hexEncodedString()
    
    let a = 0
  }


}

extension Data {
  func hexEncodedString() -> String {
    return map { String(format: "%02hhX", $0) }.joined()
  }
}
