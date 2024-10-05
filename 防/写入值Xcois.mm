#include <sys/mman.h>
#import <Foundation/Foundation.h>
#include <string>
#include <math.h>
#include <vector>
#include <dlfcn.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <mach/mach.h>
#include <mach-o/dyld.h>
#import "对应读取依赖1Xcois.h"
#import "对应读取依赖2Xcois.h"
#import "SaQ水印Xcois.h"
static uintptr_t Get_module_base() {
    
    uint32_t count = _dyld_image_count();
    for (int i = 0; i < count; i++) {
        std::string path = (const char *)_dyld_get_image_name(i);
        if (path.find("ShadowTrackerExtra.app/Frameworks/anogs.framework/anogs") != path.npos) {
            return (uintptr_t)_dyld_get_image_vmaddr_slide(i);
        }
    }
    return 0;
}
static void mj(){

            NSString *filepath9= [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/ano_tmp"];
            NSFileManager *fileManager9= [NSFileManager defaultManager];
            [fileManager9 removeItemAtPath:filepath9 error:nil];


        NSString *filepath91= [NSHomeDirectory() stringByAppendingPathComponent:@"/tmp"];
        NSFileManager *fileManager91= [NSFileManager defaultManager];
        [fileManager91 removeItemAtPath:filepath91 error:nil];
    

}
template<typename T> void Patch(vm_address_t addr, T data, int size = 0) {
    if(size == 0) size = sizeof(T);
    
    vm_protect(mach_task_self(), (vm_address_t) addr, size, NO, VM_PROT_READ | VM_PROT_WRITE | VM_PROT_COPY);
    memcpy((void*)addr, &data, size);
    vm_protect(mach_task_self(), (vm_address_t)addr, size, NO, VM_PROT_READ | VM_PROT_EXECUTE);
}
__attribute__((constructor))
static void Init(){
   
    mj();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
    uintptr_t abc=Get_module_base();
 
       Patch<int>(abc+std::stol(std::string("0x00045EAC"), nullptr, 16), CFSwapInt32(0x05000014));
       Patch<int>(abc+std::stol(std::string("0x00045E8C"), nullptr, 16), CFSwapInt32(0xC0035FD6));
       Patch<int>(abc+std::stol(std::string("0x00029BE0"), nullptr, 16), CFSwapInt32(0x25000014));
       Patch<int>(abc+std::stol(std::string("0x0012A130"), nullptr, 16), CFSwapInt32(0x010B0014));
       Patch<int>(abc+std::stol(std::string("0x00006F98"), nullptr, 16), CFSwapInt32(0x78000014));
       Patch<int>(abc+std::stol(std::string("0x00149D44"), nullptr, 16), CFSwapInt32(0x9E020014));
       Patch<int>(abc+std::stol(std::string("0x000BF0A0"), nullptr, 16), CFSwapInt32(0X42010014));
    });
}
