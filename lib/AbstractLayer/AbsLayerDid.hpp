//
//  Did.hpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#ifndef Did_hpp
#define Did_hpp

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

  char* AbsLayer_Did_GetId(int64_t obj);
  char* AbsLayer_Did_SignInfo(int64_t obj, const char* seed, const char* json);
  char* AbsLayer_Did_SetInfo(int64_t obj, const char* seed, const char* json, int64_t wallet);
  int AbsLayer_Did_SyncInfo(int64_t obj);
  char* AbsLayer_Did_GetInfo(int64_t obj, const char* key);
  void AbsLayer_Did_DestroyDid(int64_t obj);

  
#ifdef __cplusplus
}
#endif

#endif /* Did_hpp */
