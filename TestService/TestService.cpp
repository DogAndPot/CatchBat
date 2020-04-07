/* add your code here */
#include "TestService.hpp"

#define super IOService
OSDefineMetaClassAndStructors(TestService, IOService)

bool TestService::init(OSDictionary *properties) {
    IOLog("Driver init()");
    return super::init(properties);
}

void TestService::free() {
    IOLog("Driver free()");
    super::free();
}

IOService* TestService::probe(IOService* provider, SInt32 *score) {
    IOLog("Driver probe");
    return super::probe(provider, score);
}

bool TestService::start(IOService *provider) {
    IOLog("Driver start");
    
    if (!super::start(provider)) {
        IOLog("Super start call failed!");
        return false;
    }
    return true;
}

void TestService::stop(IOService *provider) {
    IOLog("Driver stop");
    super::stop(provider);
}
