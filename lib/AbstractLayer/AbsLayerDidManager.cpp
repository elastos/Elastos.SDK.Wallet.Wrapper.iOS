//
//  AbsLayerDidManager.cpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#include "AbsLayerDidManager.hpp"

#include <DidManager.h>
#include <WalletError.h>

int64_t AbsLayer_DidManager_CreateDid(int64_t obj, int index)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::DidManager>* didManager = reinterpret_cast<std::shared_ptr<elastos::DidManager>*>(obj);

  std::shared_ptr<elastos::Did>* did = new std::shared_ptr<elastos::Did>();
  int ret = (*didManager)->CreateDid(index,  did);
  if (ret != E_WALLET_C_OK) {
    return 0;
  }
  
    return reinterpret_cast<int64_t>(did);
}

int AbsLayer_DidManager_DidRecover(int64_t obj)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::DidManager>* didManager = reinterpret_cast<std::shared_ptr<elastos::DidManager>*>(obj);
  
  return (*didManager)->Recover();
}

void AbsLayer_DidManager_DestroyDidManager(int64_t obj)
{
  if (obj == 0) {
    return;
  }
  std::shared_ptr<elastos::DidManager>* didManager = reinterpret_cast<std::shared_ptr<elastos::DidManager>*>(obj);
  
  didManager->reset();
  delete didManager;
}
