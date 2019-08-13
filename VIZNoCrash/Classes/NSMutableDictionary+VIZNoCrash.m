//
//  NSMutableDictionary+VIZNoCrash.m
//  VIZNoCrash
//
//  Created by 位立志 on 2019/8/8.
//

#import "NSMutableDictionary+VIZNoCrash.h"
#import "VIZNoCrashManger.h"

@implementation NSMutableDictionary (VIZNoCrash)

+ (void)noCrashExchangeMethod{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dictionaryM = NSClassFromString(@"__NSDictionaryM");
        
        [VIZNoCrashManger exchangeInstanceMethod:dictionaryM oldMethodSel:@selector(setObject:forKey:) newMethodSel:@selector(noCrashSetObject:forKey:)];
        [VIZNoCrashManger exchangeInstanceMethod:dictionaryM oldMethodSel:@selector(setObject:forKeyedSubscript:) newMethodSel:@selector(noCrashSetObject:forKeyedSubscript:)];
        [VIZNoCrashManger exchangeInstanceMethod:dictionaryM oldMethodSel:@selector(removeObjectForKey:) newMethodSel:@selector(noCrashRemoveObjectForKey:)];
    });
}

- (void)noCrashSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    @try {
        [self noCrashSetObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n字典原数据:%@\nobject:%@\nkey:%@\n",kNowSelector,self,anObject,aKey];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    }
    @finally {
        
    }
}


- (void)noCrashSetObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    @try {
        [self noCrashSetObject:obj forKeyedSubscript:key];
    }
    @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n字典原数据:%@\nobj:%@\nkey:%@\n",kNowSelector,self,obj,key];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    }
    @finally {
        
    }
}

- (void)noCrashRemoveObjectForKey:(id)aKey {
    
    @try {
        [self noCrashRemoveObjectForKey:aKey];
    }
    @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n字典原数据:%@\nakey:%@\n",kNowSelector,self,aKey];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    }
    @finally {
        
    }
}


@end
