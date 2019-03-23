//
//  Did.cpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#include "AbsLayerDid.hpp"

#include <Did.h>
#include <WalletError.h>

char* AbsLayer_Did_GetId(int64_t obj)
{
  std::shared_ptr<elastos::Did>* did = reinterpret_cast<std::shared_ptr<elastos::Did>*>(obj);
  std::string id = (*did)->GetId();
  char* idBuf = strdup(id.c_str());
  return idBuf;
}

char* AbsLayer_Did_SignInfo(int64_t obj, const char* seed, const char* json)
{
  std::shared_ptr<elastos::Did>* did = reinterpret_cast<std::shared_ptr<elastos::Did>*>(obj);
  std::string signedInfo = (*did)->SignInfo(seed, json);
  char* signedInfoBuf = strdup(signedInfo.c_str());
  return signedInfoBuf;
}

char* AbsLayer_Did_SetInfo(int64_t obj, const char* seed, const char* json, int64_t wallet)
{
  std::shared_ptr<elastos::Did>* did = reinterpret_cast<std::shared_ptr<elastos::Did>*>(obj);
  std::shared_ptr<elastos::HDWallet>* hdWallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(wallet);
  std::string txid = (*did)->SetInfo(seed, json, *hdWallet);
  char* txidBuf = strdup(txid.c_str());
  return txidBuf;
}

int AbsLayer_Did_SyncInfo(int64_t obj)
{
  if (obj == 0) {
    return E_WALLET_C_INVALID_ARGUMENT;
  }
  std::shared_ptr<elastos::Did>* did = reinterpret_cast<std::shared_ptr<elastos::Did>*>(obj);
  int ret = (*did)->SyncInfo();
  return ret;
}

char* AbsLayer_Did_GetInfo(int64_t obj, const char* key)
{
  if (obj == 0) {
    return nullptr;
  }
  
  std::shared_ptr<elastos::Did>* did = reinterpret_cast<std::shared_ptr<elastos::Did>*>(obj);
  std::string value = (*did)->GetInfo(key);
  char* valueBuf = strdup(value.c_str());
  return valueBuf;
}

void AbsLayer_Did_DestroyDid(int64_t obj)
{
  if (obj == 0) {
    return;
  }
  std::shared_ptr<elastos::Did>* did = reinterpret_cast<std::shared_ptr<elastos::Did>*>(obj);
  did->reset();
  delete did;
}
