//
//  ItlNetworkUserClient.hpp
//  TestService
//
//  Created by qcwap on 2020/4/14.
//  Copyright © 2020 lhy. All rights reserved.
//

#ifndef ItlNetworkUserClient_hpp
#define ItlNetworkUserClient_hpp

#include <IOKit/IOLib.h>
#include <IOKit/IOUserClient.h>
#include <IOKit/IOBufferMemoryDescriptor.h>

class ItlNetworkUserClient : public IOUserClient {
    
    OSDeclareDefaultStructors( ItlNetworkUserClient );
    
public:
    
    virtual bool start( IOService * provider ) override;
    virtual void stop( IOService * provider ) override;
    virtual bool initWithTask( task_t owningTask, void * securityID,
    UInt32 type,  OSDictionary * properties ) override;
    virtual IOReturn clientClose( void ) override;
    virtual IOExternalMethod * getTargetAndMethodForIndex(
                                            IOService ** targetP, UInt32 index ) override;
    virtual IOReturn externalMethod( uint32_t selector, IOExternalMethodArguments * arguments, IOExternalMethodDispatch * dispatch = 0, OSObject * target = 0, void * reference = 0 ) override;
    virtual IOReturn clientMemoryForType( UInt32 type, IOOptionBits * options, IOMemoryDescriptor ** memory ) override;
    
private:
    task_t fTask;
};


#endif /* ItlNetworkUserClient_hpp */
