//
//  AbsLayerTransaction.hpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#ifndef AbsLayerTransaction_hpp
#define AbsLayerTransaction_hpp

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif
  
  int64_t AbsLayer_Transaction_CreateTransaction(const char* address, int64_t amount, int coinType);
  void AbsLayer_Transaction_SetAddress(int64_t obj, const char* address, int coinType);
  void AbsLayer_Transaction_SetAmount(int64_t obj, int64_t amount);
  int AbsLayer_Transaction_GetCoinTypeTx(int64_t obj);
  char* AbsLayer_Transaction_GetAddress(int64_t obj);
  int64_t AbsLayer_Transaction_GetAmount(int64_t obj);
  void AbsLayer_Transaction_DestroyTransaction(int64_t obj);
  
#ifdef __cplusplus
}
#endif

#endif /* AbsLayerTransaction_hpp */
