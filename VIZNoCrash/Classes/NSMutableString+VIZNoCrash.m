//
//  NSMutableString+VIZNoCrash.m
//  FBSnapshotTestCase
//
//  Created by 位立志 on 2019/8/2.
//

#import "NSMutableString+VIZNoCrash.h"
#import "VIZNoCrashManger.h"


@implementation NSMutableString (VIZNoCrash)


+ (void)noCrashExchangeMethod{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class stringClass = NSClassFromString(@"__NSCFString");

        [VIZNoCrashManger exchangeInstanceMethod:stringClass oldMethodSel:@selector(replaceCharactersInRange:withString:) newMethodSel:@selector(noCrashReplaceCharactersInRange:withString:)];
        [VIZNoCrashManger exchangeInstanceMethod:stringClass oldMethodSel:@selector(insertString:atIndex:) newMethodSel:@selector(noCrashInsertString:atIndex:)];
        [VIZNoCrashManger exchangeInstanceMethod:stringClass oldMethodSel:@selector(deleteCharactersInRange:) newMethodSel:@selector(noCrashDeleteCharactersInRange:)];
        [VIZNoCrashManger exchangeInstanceMethod:stringClass oldMethodSel:@selector(replaceOccurrencesOfString:withString:options:range:) newMethodSel:@selector(noCrashReplaceOccurrencesOfString:withString:options:range:)];

    });
}

- (void)noCrashReplaceCharactersInRange:(NSRange)range withString:(NSString *)aString{
    
    @try {
        [self noCrashReplaceCharactersInRange:range withString:aString];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原字符串：===%@===\n长度：%ld\nrange:(%ld,%ld)\naString:%@",kNowSelector,self,[self length],range.location,range.length,aString];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashInsertString:(NSString *)aString atIndex:(NSUInteger)loc{
    
    @try {
        [self noCrashInsertString:aString atIndex:loc];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原字符串：===%@===\n长度：%ld\nloc:%ld",kNowSelector,self,[self length],loc];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashDeleteCharactersInRange:(NSRange)range{
    
    @try {
        [self noCrashDeleteCharactersInRange:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原字符串：===%@===\n长度：%ld\nrange:(%ld,%ld)",kNowSelector,self,[self length],range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (NSUInteger)noCrashReplaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange{
    
    NSUInteger num;
    @try {
        num = [self noCrashReplaceOccurrencesOfString:target withString:replacement options:options range:searchRange];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原字符串：===%@===\n长度：%ld\ntarget:%@\nreplacement:%@\noptions:%ld\nsearchRange:(%ld,%ld)",kNowSelector,self,[self length],target,replacement,options,searchRange.location,searchRange.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return num;
    }
}

@end
