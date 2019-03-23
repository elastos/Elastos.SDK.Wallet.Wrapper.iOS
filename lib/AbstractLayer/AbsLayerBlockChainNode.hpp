//
//  BlockChainNode.hpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#ifndef AbsLayerBlockChainNode_hpp
#define AbsLayerBlockChainNode_hpp

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif
  
  int64_t AbsLayer_BlockChainNode_NewBlockNode(const char* url);
  void AbsLayer_BlockChainNode_SetUrl(int64_t obj, const char* url);
  char* AbsLayer_BlockChainNode_GetUrl(int64_t obj);
  void AbsLayer_BlockChainNode_SetCertificate(int64_t obj, const char* cert);
  void AbsLayer_BlockChainNode_DestroyNode(int64_t obj);

#ifdef __cplusplus
}
#endif

#endif /* AbsLayerBlockChainNode_hpp */
