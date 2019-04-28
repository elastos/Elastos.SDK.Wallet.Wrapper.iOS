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
    
    
    let bundle = Bundle(identifier: "org.elastos.sdk.wallet")
    let path = bundle?.path(forResource: "bip39words_zh", ofType: "txt")
    
    
    testGenrateMnemonic()
    testSingleWallet()
    testDid()
  }

  private func testGenrateMnemonic() -> String? {
    return elastos.IdentityManager.GetMnemonic(language: "english", words: "")
  }

  private func testSingleWallet() {
    let mnemonic: String? = "echo lounge olive vessel false bulk purse fitness pull luggage acquire audit"
    print("mnemonic: \(mnemonic!)")
    let seed = elastos.IdentityManager.GetSeed(mnemonic: mnemonic!, language: "english", words: "", mnemonicPassword: "")
    print("seed: \(seed!)")
    
    let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
    let cachesDir = paths[0]
    let identity = elastos.IdentityManager.CreateIdentity(localPath: cachesDir);
    
    let node = elastos.BlockChainNode(url: "https://api-wallet-ela-testnet.elastos.org")
    let singleWallet = identity.createSingleAddressWallet(seed: seed!, node: node)
    
    singleWallet.syncHistory();
    
    let address = singleWallet.getAddress(chain: 0, index: 0);
    print("address: \(address!)");
    
    let balance = singleWallet.getBalance(address: "EdVgb5RTdmwKf79pEUdVNnFprWyvmr1hPc");
    print("balance: \(balance)");
  }
  
  private func testDid() {
    let mnemonic = testGenrateMnemonic()
    print("mnemonic: \(mnemonic!)")
    let seed = elastos.IdentityManager.GetSeed(mnemonic: mnemonic!, language: "english", words: "", mnemonicPassword: "")
    print("seed: \(seed)")
    
    let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
    let cachesDir = paths[0]
    let identity = elastos.IdentityManager.CreateIdentity(localPath: cachesDir);
    
    let node = elastos.BlockChainNode(url: "https://api-wallet-did-testnet.elastos.org")
    let singleWallet = identity.createSingleAddressWallet(seed: seed!, node: node)
    singleWallet.syncHistory()
    let address = singleWallet.getAddress(chain: 0, index: 0)
    print("address: \(address)")
    let balance = singleWallet.getBalance(address: "EdVgb5RTdmwKf79pEUdVNnFprWyvmr1hPc")
    print("balance: \(balance)")
  
    let didManager = identity.createDidManager(seed: seed!)
    let did = didManager.createDid(index: 0)
    
    let id = did.getId()
    print("id: \(id)")
    
    let json = "[{\"Key\": \"name\", \"Value\":\"bob\"}]"
    var info = did.signInfo(seed: seed!, json: json)
    print("signedInfo: \(info)")
    
    info = did.signInfo(seed: seed!, json: json, encrypt: true)
    print("signedInfo: \(info)")
  
    var txid = did.setInfo(seed: seed!, json: json, wallet: singleWallet);
    print("set did info: \(txid)")
    
    txid = did.setInfo(seed: seed!, json: json, wallet: singleWallet, encrypt: true);
    print("set did info: \(txid)")
  
    did.syncInfo();
  
    var value = did.getInfo(key: "name");
    print("get did info: name=\(value)")
    
    value = did.getInfo(key: "name", encrypt: true, seed: "");
  }

}

extension Data {
  func hexEncodedString() -> String {
    return map { String(format: "%02hhX", $0) }.joined()
  }
}
