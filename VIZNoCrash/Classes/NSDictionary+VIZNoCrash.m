//
//  NSDictionary+VIZNoCrash.m
//  VIZNoCrash
//
//  Created by 位立志 on 2019/8/8.
//

#import "NSDictionary+VIZNoCrash.h"
#import "VIZNoCrashManger.h"

@implementation NSDictionary (VIZNoCrash)

+ (void)noCrashExchangeMethod{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSDictionary0 = NSClassFromString(@"__NSDictionary0");
        [VIZNoCrashManger exchangeInstanceMethod:__NSDictionary0 oldMethodSel:@selector(dictionaryWithObjects:forKeys:count:) newMethodSel:@selector(noCrashDictionaryWithObjects:forKeys:count:)];
    });

}


+ (instancetype)noCrashDictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt {

    id obj = nil;
    @try {
        obj = [self noCrashDictionaryWithObjects:objects forKeys:keys count:cnt];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n字典原数据:%@\nobjects:%@\nkeys:%@\ncnt:%ld\n",kNowSelector,self,objects,keys,cnt];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return obj;
    }
}



@end
