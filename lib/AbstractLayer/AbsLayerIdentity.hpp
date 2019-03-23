//
//  AbsLayerIdentity.hpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#ifndef AbsLayerIdentity_hpp
#define AbsLayerIdentity_hpp

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif
  
  int64_t AbsLayer_Identity_CreateSingleAddressWallet(int64_t obj, const char* seed, int64_t node);
  int64_t AbsLayer_Identity_CreateWallet(int64_t obj, const char* seed, int coinType, int64_t node);
  int64_t AbsLayer_Identity_CreateDidManager(int64_t obj, const char* seed);
  void  AbsLayer_Identity_DestroyIdentity(int64_t obj);

#ifdef __cplusplus
}
#endif

#endif /* AbsLayerIdentity_hpp */
