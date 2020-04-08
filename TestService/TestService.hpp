//
//  TestService.hpp
//  TestService
//
//  Created by 钟先耀 on 2020/4/7.
//  Copyright © 2020 lhy. All rights reserved.
//

#include <IOKit/IOLib.h>
#include <IOKit/IOLocks.h>
#include <IOKit/IOService.h>

class TestService : public IOService {
    OSDeclareDefaultStructors(TestService)
    
public:
    bool init(OSDictionary *properties) override;
    void free() override;
    IOService* probe(IOService* provider, SInt32* score) override;
    bool start(IOService *provider) override;
    void stop(IOService *provider) override;
    
};
