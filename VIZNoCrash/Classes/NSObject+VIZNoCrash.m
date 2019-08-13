//
//  NSObject+VIZNoCrash.m
//  VIZNoCrash
//
//  Created by 位立志 on 2019/8/8.
//

#import "NSObject+VIZNoCrash.h"
#import "VIZNoCrashManger.h"


@implementation NSObject (VIZNoCrash)


+ (void)noCrashExchangeMethod{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class object_class = [self class];
        
        [VIZNoCrashManger exchangeInstanceMethod:object_class oldMethodSel:@selector(setValue:forKey:) newMethodSel:@selector(noCrashSetValue:forKey:)];
        [VIZNoCrashManger exchangeInstanceMethod:object_class oldMethodSel:@selector(setValue:forKeyPath:) newMethodSel:@selector(noCrashSetValue:forKeyPath:)];
        [VIZNoCrashManger exchangeInstanceMethod:object_class oldMethodSel:@selector(setValue:forUndefinedKey:) newMethodSel:@selector(noCrashSetValue:forUndefinedKey:)];
        [VIZNoCrashManger exchangeInstanceMethod:object_class oldMethodSel:@selector(setValuesForKeysWithDictionary:) newMethodSel:@selector(noCrashSetValuesForKeysWithDictionary:)];
        
        [VIZNoCrashManger exchangeInstanceMethod:[self class] oldMethodSel:@selector(methodSignatureForSelector:) newMethodSel:@selector(noCrashMethodSignatureForSelector:)];
        [VIZNoCrashManger exchangeInstanceMethod:[self class] oldMethodSel:@selector(forwardInvocation:) newMethodSel:@selector(noCrashForwardInvocation:)];

    });
    
}

- (void)noCrashSetValue:(id)value forKey:(NSString *)key{
    
    @try {
        [self noCrashSetValue:value forKey:key];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\nself:%@\nvalue:%@\nkey:%@\n",kNowSelector,self,value,key];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashSetValue:(id)value forKeyPath:(NSString *)keyPath{
    
    @try {
        [self noCrashSetValue:value forKeyPath:keyPath];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\nself:%@\nvalue:%@\nkeyPath:%@\n",kNowSelector,self,value,keyPath];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashSetValue:(id)value forUndefinedKey:(NSString *)key{
    
    @try {
        [self noCrashSetValue:value forUndefinedKey:key];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\nself:%@\nvalue:%@\nkey:%@\n",kNowSelector,self,value,key];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashSetValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues{
    
    @try {
        [self noCrashSetValuesForKeysWithDictionary:keyedValues];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\nself:%@\nkeyedValues:%@\n",kNowSelector,self,keyedValues];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

#pragma mark - noselector
- (NSMethodSignature *)noCrashMethodSignatureForSelector:(SEL)aSelector {
    
    NSMethodSignature *ms = [self noCrashMethodSignatureForSelector:aSelector];
    
    if (ms == nil) {
        ms = [VIZNoCrashManger instanceMethodSignatureForSelector:@selector(objectNoSelectorCrash)];
    }
    return ms;
}

- (void)noCrashForwardInvocation:(NSInvocation *)anInvocation {
    
    @try {
        [self noCrashForwardInvocation:anInvocation];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n有方法未找到\nanInvocation:\n{target:%@\ntargetClass:%@\nselector:%@}\nself:%@\n",
                            anInvocation.target,
                            [anInvocation.target class],
                            NSStringFromSelector(anInvocation.selector),self];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
    
}



@end
