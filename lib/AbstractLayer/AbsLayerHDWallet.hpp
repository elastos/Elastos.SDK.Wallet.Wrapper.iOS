//
//  AbsLayerHDWallet.hpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#ifndef AbsLayerHDWallet_hpp
#define AbsLayerHDWallet_hpp

#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

  int AbsLayer_HDWallet_GetCoinType(int64_t obj);
  char* AbsLayer_HDWallet_SendTransaction(int64_t obj, int64_t transactions[], int transactionsLen,
                                          const char* memo, const char* seed, const char* chain);
  char* AbsLayer_HDWallet_GetAddress(int64_t obj, int chain, int index);
  char* AbsLayer_HDWallet_GetPublickey(int64_t obj, int chain, int index);
  int64_t AbsLayer_HDWallet_GetBalance(int64_t obj, const char* address);
  int64_t AbsLayer_HDWallet_GetBalanceEx(int64_t obj);
  int AbsLayer_HDWallet_SyncHistory(int64_t obj);
  int AbsLayer_HDWallet_GetHistoryCount(int64_t obj, const char* address);
  char* AbsLayer_HDWallet_GetHistory(int64_t obj, const char* address, int pageSize, int page, bool ascending);
  char** AbsLayer_HDWallet_GetUsedAddresses(int64_t obj);
  char** AbsLayer_HDWallet_GetUnUsedAddresses(int64_t obj, int count);
  void AbsLayer_HDWallet_FreeAddresses(char** addresses);
  int AbsLayer_HDWallet_Recover(int64_t obj);
  void AbsLayer_HDWallet_DestroyHDWallet(int64_t obj);

  
#ifdef __cplusplus
}
#endif

#endif /* AbsLayerHDWallet_hpp */
