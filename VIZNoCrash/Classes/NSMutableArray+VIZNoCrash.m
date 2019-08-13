//
//  NSMutableArray+VIZNoCrash.m
//  FBSnapshotTestCase
//
//  Created by 位立志 on 2019/8/1.
//

#import "NSMutableArray+VIZNoCrash.h"
#import "VIZNoCrashManger.h"

@implementation NSMutableArray (VIZNoCrash)

+ (void)noCrashExchangeMethod{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class arrayMClass = NSClassFromString(@"__NSArrayM");
        
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(objectAtIndex:) newMethodSel:@selector(noCrashObjectAtIndex:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(insertObject:atIndex:) newMethodSel:@selector(noCrashInsertObject:atIndex:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(removeObjectAtIndex:) newMethodSel:@selector(noCrashremoveObjectAtIndex:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(replaceObjectAtIndex:withObject:) newMethodSel:@selector(noCrashReplaceObjectAtIndex:withObject:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(exchangeObjectAtIndex:withObjectAtIndex:) newMethodSel:@selector(noCrashExchangeObjectAtIndex:withObjectAtIndex:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(removeObject:inRange:) newMethodSel:@selector(noCrashRemoveObject:inRange:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(removeObjectIdenticalTo:inRange:) newMethodSel:@selector(noCrashRemoveObjectIdenticalTo:inRange:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(removeObjectsInRange:) newMethodSel:@selector(noCrashRemoveObjectsInRange:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(replaceObjectsInRange:withObjectsFromArray:range:) newMethodSel:@selector(noCrashReplaceObjectsInRange:withObjectsFromArray:range:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(replaceObjectsInRange:withObjectsFromArray:) newMethodSel:@selector(noCrashReplaceObjectsInRange:withObjectsFromArray:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(insertObjects:atIndexes:) newMethodSel:@selector(noCrashInsertObjects:atIndexes:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(removeObjectsAtIndexes:) newMethodSel:@selector(noCrashRemoveObjectsAtIndexes:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(replaceObjectsAtIndexes:withObjects:) newMethodSel:@selector(noCrashReplaceObjectsAtIndexes:withObjects:)];
        [VIZNoCrashManger exchangeClassMethod:arrayMClass oldMethodSel:@selector(setObject:atIndexedSubscript:) newMethodSel:@selector(noCrashSetObject:atIndexedSubscript:)];
        
    });
    
}

- (id)noCrashObjectAtIndex:(NSUInteger)index{
    
    id obj = nil;
    
    @try {
        obj = [self noCrashObjectAtIndex:index];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nindex = %ld",kNowSelector,self,[self count],index];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return obj;
    }
}

- (void)noCrashInsertObject:(id)anObject atIndex:(NSUInteger)index{
    @try {
        [self noCrashInsertObject:anObject atIndex:index];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\nanObject:%@\n数组长度:%ld\nindex = %ld",kNowSelector,self,anObject,[self count],index];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashremoveObjectAtIndex:(NSUInteger)index{
    @try {
        [self noCrashObjectAtIndex:index];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nindex = %ld",kNowSelector,self,[self count],index];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    @try {
        [self noCrashReplaceObjectAtIndex:index withObject:anObject];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nindex:%ld\nanObject:%@",kNowSelector,self,[self count],index,anObject];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashExchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2{
    @try {
        [self noCrashExchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nidx1:%ld\nidx2:%ld",kNowSelector,self,[self count],idx1,idx2];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashRemoveObject:(id)anObject inRange:(NSRange)range{
    @try {
        [self noCrashRemoveObject:anObject inRange:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nanObject:%@\nRange:(%ld,%ld)",kNowSelector,self,[self count],anObject,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashRemoveObjectIdenticalTo:(id)anObject inRange:(NSRange)range{
    @try {
        [self noCrashRemoveObjectIdenticalTo:anObject inRange:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nanObject:%@\nRange:(%ld,%ld)",kNowSelector,self,[self count],anObject,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashRemoveObjectsInRange:(NSRange)range{
    @try {
        [self noCrashRemoveObjectsInRange:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nRange:(%ld,%ld)",kNowSelector,self,[self count],range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashReplaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray<id> *)otherArray range:(NSRange)otherRange{
    @try {
        [self noCrashReplaceObjectsInRange:range withObjectsFromArray:otherArray range:otherRange];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nRange:(%ld,%ld)\notherArray:%@\notherRange:(%ld,%ld)",kNowSelector,self,[self count],range.location,range.length,otherArray,otherRange.location,otherRange.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashReplaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray<id> *)otherArray{
    @try {
        [self noCrashReplaceObjectsInRange:range withObjectsFromArray:otherArray];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nRange:(%ld,%ld)\notherArray:%@\n",kNowSelector,self,[self count],range.location,range.length,otherArray];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashInsertObjects:(NSArray<id> *)objects atIndexes:(NSIndexSet *)indexes{
    @try {
        [self noCrashInsertObjects:objects atIndexes:indexes];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nobjects:%@\nindexes:%@\n",kNowSelector,self,[self count],objects,indexes];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashRemoveObjectsAtIndexes:(NSIndexSet *)indexes{
    @try {
        [self noCrashRemoveObjectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nindexes:%@\n",kNowSelector,self,[self count],indexes];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashReplaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray<id> *)objects{
    @try {
        [self noCrashReplaceObjectsAtIndexes:indexes withObjects:objects];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nobjects:%@\nindexes:%@\n",kNowSelector,self,[self count],objects,indexes];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashSetObject:(id)obj atIndexedSubscript:(NSUInteger)idx{
    @try {
        [self noCrashSetObject:obj atIndexedSubscript:idx];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n数组原数据:%@\n数组长度:%ld\nobj:%@\nidx:%ld\n",kNowSelector,self,[self count],obj,idx];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}



@end
