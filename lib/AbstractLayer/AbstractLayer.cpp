//
//  AbstractLayer.cpp
//  lib
//
//  Created by mengxk on 2018/12/28.
//  Copyright © 2018 Elastos. All rights reserved.
//

#include "AbstractLayer.hpp"

#include <Elastos.SDK.Wallet.C/IdentityManager.h>

char* AbstractLayer_IdentityManager_GetMnemonic(const char* language, const char* words)
{
  std::string mnemonic = elastos::IdentityManager::GetMnemonic(language, words);
  
  return nullptr;
}
