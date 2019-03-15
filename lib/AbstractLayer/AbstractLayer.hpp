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

char* AbstractLayer_IdentityManager_GetMnemonic(const char* language, const char* words);
  
#ifdef __cplusplus
}
#endif

#endif /* AbstractLayer_hpp */
