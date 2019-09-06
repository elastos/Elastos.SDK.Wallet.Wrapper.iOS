//
//  AbsLayerIdentityManager.hpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#ifndef AbsLayerIdentityManager_hpp
#define AbsLayerIdentityManager_hpp

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif
  
  char* AbsLayer_IdentityManager_GetMnemonic(const char* language, const char* words);
  char* AbsLayer_IdentityManager_GetSeed(const char* mnemonic, const char* mnemonicPassword);
  int64_t AbsLayer_IdentityManager_CreateIdentity(const char* localPath);
  
#ifdef __cplusplus
}
#endif

#endif /* AbsLayerIdentityManager_hpp */
