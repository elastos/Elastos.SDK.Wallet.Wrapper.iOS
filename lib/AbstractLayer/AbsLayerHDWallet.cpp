//
//  AbsLayerHDWallet.cpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#include "AbsLayerHDWallet.hpp"

#include "HDWallet.h"
#include "Transaction.h"

int AbsLayer_HDWallet_GetCoinType(int64_t obj)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);
 
  return (*wallet)->GetCoinType();
}

char* AbsLayer_HDWallet_SendTransaction(int64_t obj, int64_t transactions[], int transactionsLen,
                                              const char* memo,  const char* seed, const char* chain)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);
  
  std::vector<elastos::Transaction> txs;
  for (int i = 0; i < transactionsLen; i++) {
    elastos::Transaction* tx = (elastos::Transaction*)transactions[i];
    if (tx == nullptr) {
       continue;
    }
    txs.push_back(*tx);
  }
  std::string txid;
  (*wallet)->SendTransaction(txs, memo, seed, txid, chain);

  char* txidBuf = strdup(txid.c_str());
  return txidBuf;
}

char* AbsLayer_HDWallet_GetAddress(int64_t obj, int chain, int index)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);
  
  std::string address = (*wallet)->GetAddress(chain, index);

  char* addressBuf = strdup(address.c_str());
  return addressBuf;
}

char* AbsLayer_HDWallet_GetPublickey(int64_t obj, int chain, int index)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);

  std::string pubKey = (*wallet)->GetPublicKey(chain, index);

  char* pubKeyBuf = strdup(pubKey.c_str());
  return pubKeyBuf;
}

int64_t AbsLayer_HDWallet_GetBalance(int64_t obj, const char* address)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);

  int64_t balance = (*wallet)->GetBalance(address);

  return balance;
}

int64_t AbsLayer_HDWallet_GetBalanceEx(int64_t obj)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);
  
  int64_t balance = (*wallet)->GetBalance();
  
  return balance;
}

int AbsLayer_HDWallet_SyncHistory(int64_t obj)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);
  
  int ret = (*wallet)->SyncHistory();
  
  return ret;
}

int AbsLayer_HDWallet_GetHistoryCount(int64_t obj, const char* address)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);
  
  int count = (*wallet)->GetHistoryCount(address);
  
  return count;
}

char* AbsLayer_HDWallet_GetHistory(int64_t obj, const char* address, int pageSize, int page, bool ascending)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);
  
  std::string histories;
 (*wallet)->GetHistory(address, pageSize, page, ascending, histories);
  
  char* historiesBuf = strdup(histories.c_str());
  return historiesBuf;
}

char** AbsLayer_HDWallet_GetUsedAddresses(int64_t obj)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);

  std::vector<std::string> addrs = (*wallet)->GetUsedAddresses();
  
  char** array = new char*[addrs.size() + 1];
  for(auto idx = 0; idx < addrs.size(); idx++) {
    array[idx] = strdup(addrs[idx].c_str());
  }
  array[addrs.size()] = nullptr;
  
  return array;
}

char** AbsLayer_HDWallet_GetUnUsedAddresses(int64_t obj, int count)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);
  
  std::vector<std::string> addrs = (*wallet)->GetUnUsedAddresses(count);
  
  char** array = new char*[addrs.size() + 1];
  for(auto idx = 0; idx < addrs.size(); idx++) {
    array[idx] = strdup(addrs[idx].c_str());
  }
  array[addrs.size()] = nullptr;

  
  return array;
}

void AbsLayer_HDWallet_FreeAddresses(char** addresses) {
  if(addresses == nullptr) {
    return;
  }
  
  int idx = 0;
  while(addresses[idx] != nullptr) {
    free(addresses[idx]);
    idx++;
  }
  
  delete[] addresses;
}

int AbsLayer_HDWallet_Recover(int64_t obj)
{
  if (obj == 0) {
    return 0;
  }
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);
  
  int recover = (*wallet)->Recover();
  
  return recover;
}

void AbsLayer_HDWallet_DestroyHDWallet(int64_t obj)
{
  if (obj == 0) {
    return;
  }
  
  std::shared_ptr<elastos::HDWallet>* wallet = reinterpret_cast<std::shared_ptr<elastos::HDWallet>*>(obj);
  wallet->reset();
  delete wallet;
}
