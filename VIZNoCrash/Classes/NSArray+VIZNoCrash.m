//
//  NSArray+VIZNoCrash.m
//  FBSnapshotTestCase
//
//  Created by 位立志 on 2019/7/24.
//

#import "NSArray+VIZNoCrash.h"
#import "VIZNoCrashManger.h"

@implementation NSArray (VIZNoCrash)

+ (void)noCrashExchangeMethod{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //InstanceMetho exChange
        Class __NSArray = NSClassFromString(@"NSArray");
        Class __NSArrayI = NSClassFromString(@"__NSArrayI");
        Class __NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
        Class __NSArray0 = NSClassFromString(@"__NSArray0");
        
        //ClassesMetho exChange
        //arrayWithObjects:count:
        [VIZNoCrashManger exchangeClassMethod:[self class] oldMethodSel:@selector(arrayWithObjects:count:) newMethodSel:@selector(NoCrasharrayWithObjects:count:)];
        
        //objectsAtIndexes:
        [VIZNoCrashManger exchangeInstanceMethod:__NSArrayI oldMethodSel:@selector(objectAtIndexedSubscript:) newMethodSel:@selector(__NSArrayINoCrashObjectAtIndexedSubscript:)];
        
        //getObjects:range:
        [VIZNoCrashManger exchangeInstanceMethod:__NSArray oldMethodSel:@selector(getObjects:range:) newMethodSel:@selector(__NSArrayGetObjects:range:)];
        [VIZNoCrashManger exchangeInstanceMethod:__NSArrayI oldMethodSel:@selector(getObjects:range:) newMethodSel:@selector(__NSArrayIGetObjects:range:)];
        [VIZNoCrashManger exchangeInstanceMethod:__NSSingleObjectArrayI oldMethodSel:@selector(getObjects:range:) newMethodSel:@selector(__NSSingleObjectArrayIGetObjects:range:)];
        [VIZNoCrashManger exchangeInstanceMethod:__NSArray0 oldMethodSel:@selector(getObjects:range:) newMethodSel:@selector(__NSArray0GetObjects:range:)];

        //objectAtIndex:
        [VIZNoCrashManger exchangeInstanceMethod:__NSArrayI oldMethodSel:@selector(__NSArrayIObjectAtIndex:) newMethodSel:@selector(objectAtIndex:)];
        [VIZNoCrashManger exchangeInstanceMethod:__NSArrayI oldMethodSel:@selector(objectAtIndex:) newMethodSel:@selector(__NSArrayIObjectAtIndex:)];
        [VIZNoCrashManger exchangeInstanceMethod:__NSSingleObjectArrayI oldMethodSel:@selector(__NSSingleObjectArrayIObjectAtIndex:) newMethodSel:@selector(objectAtIndex:)];
        [VIZNoCrashManger exchangeInstanceMethod:__NSArray0 oldMethodSel:@selector(objectAtIndex:) newMethodSel:@selector(__NSArray0ObjectAtIndex:)];

    });
    
}

#pragma mark - arrayWithObjects

+ (instancetype)NoCrasharrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {

    id instance = nil;
    @try {
        instance = [self NoCrasharrayWithObjects:objects count:cnt];
    } @catch (NSException *exception) {
        
        NSInteger objectsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        for (int i = 0; i<cnt; i++) {
            if (objects[i] != nil) {
                newObjects[objectsIndex] = objects[i];
                objectsIndex ++;
            }
        }
        instance = [self NoCrasharrayWithObjects:newObjects count:objectsIndex];
        //记录崩溃信息
        [VIZNoCrashManger dealErrorWithException:exception result:instance];
    } @finally {
        return instance;
    }
}

#pragma mark - objectAtIndexedSubscript

- (id)__NSArrayINoCrashObjectAtIndexedSubscript:(NSUInteger)idx {
    
    id object = nil;
    @try {
        object = [self __NSArrayINoCrashObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据 %@\n,index = %ld",kNowSelector,self,idx];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    }
    @finally {
        return object;
    }
}

#pragma mark - getObjects:range:

- (void)__NSArrayGetObjects:(__unsafe_unretained id  _Nonnull [])objects range:(NSRange)range{
    
    @try {
        [self __NSArrayGetObjects:objects range:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据 %@\nrange:(%ld,%ld)",kNowSelector,self,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)__NSArrayIGetObjects:(__unsafe_unretained id  _Nonnull [])objects range:(NSRange)range{
    
    @try {
        [self __NSArrayIGetObjects:objects range:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据 %@\nrange:(%ld,%ld)",kNowSelector,self,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)__NSSingleObjectArrayIGetObjects:(__unsafe_unretained id  _Nonnull [])objects range:(NSRange)range{
    
    @try {
        [self __NSSingleObjectArrayIGetObjects:objects range:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据 %@\nrange:(%ld,%ld)",kNowSelector,self,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)__NSArray0GetObjects:(__unsafe_unretained id  _Nonnull [])objects range:(NSRange)range{
    
    @try {
        [self __NSArray0GetObjects:objects range:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据 %@\nrange:(%ld,%ld)",kNowSelector,self,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


#pragma mark - objectAtIndex:

- (id)__NSArrayObjectAtIndex:(NSUInteger)index{
    
    id object = nil;
    @try {
        object = [self __NSArrayObjectAtIndex:index];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据 %@\n,index = %ld",kNowSelector,self,index];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return object;
    }
}

- (id)__NSArrayIObjectAtIndex:(NSUInteger)index{
    
    id object = nil;
    @try {
        object = [self __NSArrayIObjectAtIndex:index];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据 %@\n,index = %ld",kNowSelector,self,index];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return object;
    }
}

- (id)__NSSingleObjectArrayIObjectAtIndex:(NSUInteger)index{
    
    id object = nil;
    @try {
        object = [self __NSSingleObjectArrayIObjectAtIndex:index];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据 %@\n,index = %ld",kNowSelector,self,index];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return object;
    }
}

- (id)__NSArray0ObjectAtIndex:(NSUInteger)index{
    
    id object = nil;
    @try {
        object = [self __NSArray0ObjectAtIndex:index];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据 %@\n,index = %ld",kNowSelector,self,index];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return object;
    }
}


@end
