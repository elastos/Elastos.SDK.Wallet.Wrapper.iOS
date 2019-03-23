//
//  BlockChainNode.cpp
//  lib
//
//  Created by mengxk on 2019/3/23.
//  Copyright © 2019 Elastos. All rights reserved.
//

#include "AbsLayerBlockChainNode.hpp"

#include <memory>
#include "BlockChainNode.h"

int64_t AbsLayer_BlockChainNode_NewBlockNode(const char* url)
{
  std::shared_ptr<elastos::BlockChainNode>* node
    = new std::shared_ptr<elastos::BlockChainNode>();
  *node = std::make_shared<elastos::BlockChainNode>(url);
 
  return reinterpret_cast<int64_t>(node);
}

void AbsLayer_BlockChainNode_SetUrl(int64_t obj, const char* url)
{
  std::shared_ptr<elastos::BlockChainNode>* node
    = reinterpret_cast<std::shared_ptr<elastos::BlockChainNode>*>(obj);
  (*node)->SetUrl(url);
}

char* AbsLayer_BlockChainNode_GetUrl(int64_t obj)
{
  std::shared_ptr<elastos::BlockChainNode>* node
    = reinterpret_cast<std::shared_ptr<elastos::BlockChainNode>*>(obj);
  std::string url = (*node)->GetUrl();
  char* urlBuf = strdup(url.c_str());
  return urlBuf;
}

void AbsLayer_BlockChainNode_SetCertificate(int64_t obj, const char* cert)
{
  std::shared_ptr<elastos::BlockChainNode>* node
    = reinterpret_cast<std::shared_ptr<elastos::BlockChainNode>*>(obj);
  (*node)->SetCertificate(cert);
}

void AbsLayer_BlockChainNode_DestroyNode(int64_t obj)
{
  std::shared_ptr<elastos::BlockChainNode>* node
    = reinterpret_cast<std::shared_ptr<elastos::BlockChainNode>*>(obj);
  node->reset();
  delete node;
}
