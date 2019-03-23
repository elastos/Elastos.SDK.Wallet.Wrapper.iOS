//
//  AbsLayerIdentity.cpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#include "AbsLayerIdentity.hpp"

#include <memory>
#include "Identity.h"
#include "WalletError.h"

int64_t AbsLayer_Identity_CreateSingleAddressWallet(int64_t obj, const char* seed, int64_t node)
{
  std::shared_ptr<elastos::Identity>* identity
    = reinterpret_cast<std::shared_ptr<elastos::Identity>*>(obj);
  std::shared_ptr<elastos::BlockChainNode>* nodePtr
  = reinterpret_cast<std::shared_ptr<elastos::BlockChainNode>*>(node);
  if (nodePtr == nullptr) {
    return 0;
  }
  
  std::shared_ptr<elastos::HDWallet>* wallet
    = new std::shared_ptr<elastos::HDWallet>();
  
  int ret = (*identity)->CreateSingleAddressWallet(seed, *nodePtr, wallet);
  if (ret != E_WALLET_C_OK) {
    delete wallet;
    return 0;
  }
  
  return reinterpret_cast<int64_t>(wallet);
}

int64_t AbsLayer_Identity_CreateWallet(int64_t obj, const char* seed, int coinType, int64_t node)
{
  std::shared_ptr<elastos::Identity>* identity
    = reinterpret_cast<std::shared_ptr<elastos::Identity>*>(obj);
  std::shared_ptr<elastos::BlockChainNode>* nodePtr
    = reinterpret_cast<std::shared_ptr<elastos::BlockChainNode>*>(node);
  if (nodePtr == nullptr) {
    return 0;
  }
  
  std::shared_ptr<elastos::HDWallet>* wallet
    = new std::shared_ptr<elastos::HDWallet>();
  
  int ret = (*identity)->CreateWallet(seed, coinType, *nodePtr, wallet);
  if (ret != E_WALLET_C_OK) {
    delete wallet;
    return 0;
  }
  
  return reinterpret_cast<int64_t>(wallet);
}

int64_t AbsLayer_Identity_CreateDidManager(int64_t obj, const char* seed)
{
  if (obj == 0) {
    return 0;
  }
  
  std::shared_ptr<elastos::Identity>* identity
    = reinterpret_cast<std::shared_ptr<elastos::Identity>*>(obj);
  
  std::shared_ptr<elastos::DidManager>* manager = new std::shared_ptr<elastos::DidManager>();
  
  int ret = (*identity)->CreateDidManager(seed, manager);
  if (ret != E_WALLET_C_OK) {
    delete manager;
    return 0;
  }
  
  return reinterpret_cast<int64_t>(manager);
}

void  AbsLayer_Identity_DestroyIdentity(int64_t obj)
{
  if (obj == 0) {
     return;
  }
  
  std::shared_ptr<elastos::Identity>* identity
    = reinterpret_cast<std::shared_ptr<elastos::Identity>*>(obj);
  identity->reset();
  delete identity;
}
