//
//  AbsLayerIdentityManager.cpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#include "AbsLayerIdentityManager.hpp"

#include "IdentityManager.h"
#include "Identity.h"
#include "WalletError.h"

char* AbsLayer_IdentityManager_GetMnemonic(const char* language, const char* words)
{
  std::string mnemonic = elastos::IdentityManager::GetMnemonic(language, words);
  char* mnemonicBuf = strdup(mnemonic.c_str());
  return mnemonicBuf;
}

char* AbsLayer_IdentityManager_GetSeed(const char* mnemonic, const char* mnemonicPassword)
{
  std::string seed = elastos::IdentityManager::GetSeed(mnemonic, mnemonicPassword);
  char* seedBuf = strdup(seed.c_str());
  return seedBuf;
}

int64_t AbsLayer_IdentityManager_CreateIdentity(const char* localPath)
{
  std::shared_ptr<elastos::Identity>* identity = new std::shared_ptr<elastos::Identity>();
  int ret = elastos::IdentityManager::CreateIdentity(localPath, identity);
  if (ret != E_WALLET_C_OK) {
    delete identity;
    return 0;
  }
  
  return reinterpret_cast<int64_t>(identity);

}
