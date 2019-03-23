//
//  AbstractLayer.hpp
//  lib
//
//  Created by mengxk on 2018/12/28.
//  Copyright © 2018 Elastos. All rights reserved.
//

#ifndef AbstractLayer_hpp
#define AbstractLayer_hpp

#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif
    
    //
    char* AbstractLayer_IdentityManager_GetMnemonic(const char* language, const char* words);
    char* AbstractLayer_IdentityManager_GetSeed(const char*mnemonic,const char* language,const char* words,const char* mnemonicPassword);
    char* AbstractLayer_IdentityManager_GetSignInfo(const char* path,const char* url,const char* mnemonic,const char* jsonData);

    char* AbstractLayer_IdentityManager_GetInfo(const char* path,const char* seed,const char* key);
    void AbstractLayer_IdentityManager_FreeBuf(void*);

    void AbstractLayer_FreeBuf(void*);
  
#ifdef __cplusplus
}
#endif

#endif /* AbstractLayer_hpp */

