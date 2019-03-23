//
//  AbsLayerDidManager.hpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#ifndef AbsLayerDidManager_hpp
#define AbsLayerDidManager_hpp

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif
  
  int64_t AbsLayer_DidManager_CreateDid(int64_t obj, int index);
  int AbsLayer_DidManager_DidRecover(int64_t obj);
  void AbsLayer_DidManager_DestroyDidManager(int64_t obj);
  
#ifdef __cplusplus
}
#endif

#endif /* AbsLayerDidManager_hpp */
