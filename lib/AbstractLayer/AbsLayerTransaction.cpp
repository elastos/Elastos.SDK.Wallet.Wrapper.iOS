//
//  AbsLayerTransaction.cpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#include "AbsLayerTransaction.hpp"

#include <Transaction.h>

int64_t AbsLayer_Transaction_CreateTransaction(const char* address, int64_t amount, int coinType)
{
  elastos::Transaction* tx = new elastos::Transaction(address, amount, coinType);
  return reinterpret_cast<int64_t>(tx);
}

void AbsLayer_Transaction_SetAddress(int64_t obj, const char* address, int coinType)
{
  elastos::Transaction* tx = reinterpret_cast<elastos::Transaction*>(obj);
  tx->SetAddress(address, coinType);
}

void AbsLayer_Transaction_SetAmount(int64_t obj, int64_t amount)
{
  elastos::Transaction* tx = reinterpret_cast<elastos::Transaction*>(obj);
  tx->SetAmount(amount);
}

int AbsLayer_Transaction_GetCoinTypeTx(int64_t obj)
{
  elastos::Transaction* tx = reinterpret_cast<elastos::Transaction*>(obj);
  return tx->GetCoinType();
}

char* AbsLayer_Transaction_GetAddress(int64_t obj)
{
  elastos::Transaction* tx = reinterpret_cast<elastos::Transaction*>(obj);
  std::string addr = tx->GetAddress();
  return strdup(addr.c_str());
}

int64_t AbsLayer_Transaction_GetAmount(int64_t obj)
{
  elastos::Transaction* tx = reinterpret_cast<elastos::Transaction*>(obj);
  return tx->GetAmount();
}

void AbsLayer_Transaction_DestroyTransaction(int64_t obj)
{
  if (obj == 0) {
    return;
  }
  
  elastos::Transaction* tx = reinterpret_cast<elastos::Transaction*>(obj);
  delete tx;
}
