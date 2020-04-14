//
//  ItlNetworkUserClient.cpp
//  TestService
//
//  Created by qcwap on 2020/4/14.
//  Copyright © 2020 lhy. All rights reserved.
//

#include "ItlNetworkUserClient.hpp"

#define super IOUserClient
OSDefineMetaClassAndStructors( ItlNetworkUserClient, IOUserClient );

bool ItlNetworkUserClient::initWithTask(task_t owningTask, void *securityID, UInt32 type, OSDictionary *properties)
{
    fTask = owningTask;
    return( super::initWithTask( owningTask, securityID, type, properties ));
}

bool ItlNetworkUserClient::start(IOService *provider)
{
    IOLog("ItlNetworkUserClient::start\n");
    if( !super::start( provider ))
        return( false );
    
    return true;
}

IOReturn ItlNetworkUserClient::clientClose()
{
    if( !isInactive())
        terminate();
    return( kIOReturnSuccess );
}

void ItlNetworkUserClient::stop(IOService *provider)
{
    super::stop( provider );
}

IOReturn ItlNetworkUserClient::externalMethod(uint32_t selector, IOExternalMethodArguments * arguments, IOExternalMethodDispatch * dispatch, OSObject * target, void * reference)
{
    IOReturn err;
    switch (selector) {
        default:
            err = super::externalMethod(selector, arguments, NULL, this, NULL);
            break;
    }
    return err;
}
