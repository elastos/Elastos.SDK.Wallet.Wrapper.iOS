//
//  AbstractLayer.cpp
//  lib
//
//  Created by mengxk on 2018/12/28.
//  Copyright © 2018 Elastos. All rights reserved.
//

#include "AbstractLayer.hpp"

#include <Elastos.SDK.Wallet.C/IdentityManager.h>

char* copyStr2Buf(std::string orgStr){
    
    char* ret = nullptr;
    int nLen = (int)orgStr.length()+1;
    ret = (char*)malloc(nLen);
    memset(ret, 0, nLen);
    orgStr.copy(ret,nLen,0);
    
    return ret;
}

void AbstractLayer_IdentityManager_FreeBuf(void* buf)
{
    free(buf);
}

char* AbstractLayer_IdentityManager_GetMnemonic(const char* language, const char* words)
{
    char* ret = nullptr;
    //printf("start AbstractLayer.cpp\n");
    std::string mnemonic = elastos::IdentityManager::GetMnemonic(language, words);
    ret = copyStr2Buf(mnemonic);
    
    return ret;
}

char* AbstractLayer_IdentityManager_GetSeed(const char*mnemonic, const char* language, const char* words,const char* mnemonicPassword)
{
    
    char* ret = nullptr;
    //printf("start AbstractLayer.cpp\n");
    std::string seed = elastos::IdentityManager::GetSeed(mnemonic, language, words,mnemonicPassword);
    ret = copyStr2Buf(seed);
    
    return ret;
}

char* AbstractLayer_IdentityManager_GetSignInfo(const char* path,const char* url,const char* seed,const char* jsonData){
    
    char* ret = nullptr;
    
    //create identity object
    std::shared_ptr<elastos::Identity> Identity;
    int nRet = elastos::IdentityManager::CreateIdentity(path, &Identity);
    if(nRet != 0){
        return nullptr;
    }
    
    //create Single AddressWallet
    //const std::shared_ptr<elastos::BlockChainNode> Node = (const std::shared_ptr<elastos::BlockChainNode>)new elastos::BlockChainNode(url);
    const std::shared_ptr<elastos::BlockChainNode> Node(new elastos::BlockChainNode(url));
    std::shared_ptr<elastos::HDWallet> HDWallet;
    Identity->CreateSingleAddressWallet(seed, Node, &HDWallet);
    if(nRet != 0){
        return nullptr;
    }
    
    //create DID manager
    std::shared_ptr<elastos::DidManager> DidManager;
    nRet = Identity->CreateDidManager(seed, &DidManager);
    if(nRet != 0){
        return nullptr;
    }
    
    //create DID
    std::shared_ptr<elastos::Did> Did;
    nRet = DidManager->CreateDid(0, &Did);
    if(nRet != 0){
        return nullptr;
    }
    
    std::string info = Did->SignInfo(seed, jsonData);
    ret = copyStr2Buf(info);
    
    return ret;
}


char* AbstractLayer_IdentityManager_GetInfo(const char* path,const char* seed,const char* key){
    
    char* ret = nullptr;
    
    //create identity object
    std::shared_ptr<elastos::Identity> Identity;
    int nRet = elastos::IdentityManager::CreateIdentity(path, &Identity);
    if(nRet != 0){
        return nullptr;
    }
    
    //create DID manager
    std::shared_ptr<elastos::DidManager> DidManager;
    nRet = Identity->CreateDidManager(seed, &DidManager);
    if(nRet != 0){
        return nullptr;
    }
    
    //create DID
    std::shared_ptr<elastos::Did> Did;
    nRet = DidManager->CreateDid(0, &Did);
    if(nRet != 0){
        return nullptr;
    }
    
    nRet = Did->SyncInfo();
    if(nRet < 0){
        return nullptr;
    }
    
    
    std::string info = Did->GetInfo(key);
    ret = copyStr2Buf(info);
    
    return ret;
}


