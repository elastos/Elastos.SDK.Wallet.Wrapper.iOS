//
//  WalletBase.swift
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

public final class elastos {
  private init() {}
}

extension elastos {
  open class WalletBase  {
    var mObj: Int64 = 0;
    
    deinit {
      destroy()
    }
    
    public func close() {
      destroy();
    }

    func getObject() ->Int64 {
      return mObj;
    }

    func destroy() {
      fatalError("Subclasses need to implement the `sound()` method.")
    }
  }
}
