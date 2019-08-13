//
//  NSString+VIZNoCrash.m
//  VIZNoCrash
//
//  Created by 位立志 on 2019/8/1.
//

#import "NSString+VIZNoCrash.h"
#import "VIZNoCrashManger.h"

@implementation NSString (VIZNoCrash)

+ (void)noCrashExchangeMethod{
    
    static dispatch_once_t oneceToken;
    dispatch_once(&oneceToken, ^{
        
        Class stringClass = NSClassFromString(@"__NSCFConstantString");
        
        [VIZNoCrashManger exchangeInstanceMethod:stringClass oldMethodSel:@selector(characterAtIndex:) newMethodSel:@selector(noCrashCharacterAtIndex:)];
        [VIZNoCrashManger exchangeInstanceMethod:stringClass oldMethodSel:@selector(substringFromIndex:) newMethodSel:@selector(noCrashSubstringFromIndex:)];
        [VIZNoCrashManger exchangeInstanceMethod:stringClass oldMethodSel:@selector(substringToIndex:) newMethodSel:@selector(noCrashSubstringToIndex:)];
        [VIZNoCrashManger exchangeInstanceMethod:stringClass oldMethodSel:@selector(substringWithRange:) newMethodSel:@selector(noCrashSubstringWithRange:)];
        [VIZNoCrashManger exchangeInstanceMethod:stringClass oldMethodSel:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) newMethodSel:@selector(noCrashStringByReplacingOccurrencesOfString:withString:options:range:)];
        [VIZNoCrashManger exchangeInstanceMethod:stringClass oldMethodSel:@selector(stringByReplacingOccurrencesOfString:withString:) newMethodSel:@selector(noCrashStringByReplacingOccurrencesOfString:withString:)];
        [VIZNoCrashManger exchangeInstanceMethod:stringClass oldMethodSel:@selector(stringByReplacingCharactersInRange:withString:) newMethodSel:@selector(noCrashStringByReplacingCharactersInRange:withString:)];
    });
    
}

//characterAtIndex:
- (unichar)noCrashCharacterAtIndex:(NSUInteger)index{
    
    unichar charcter;
    @try {
        charcter = [self noCrashCharacterAtIndex:index];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原字符串：===%@===\n长度：%ld\nindex:%ld",kNowSelector,self,[self length],index];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return charcter;
    }
}

//substringFromIndex:
- (NSString *)noCrashSubstringFromIndex:(NSUInteger)from{
    
    NSString *str = nil;
    @try {
        str = [self noCrashSubstringFromIndex:from];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原字符串：===%@===\n长度：%ld\nfrom:%ld",kNowSelector,self,[self length],from];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return str;
    }
}

//substringToIndex:
- (NSString *)noCrashSubstringToIndex:(NSUInteger)to{
    
    NSString *str = nil;
    @try {
        str = [self noCrashSubstringToIndex:to];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原字符串：===%@===\n长度：%ld\nto:%ld",kNowSelector,self,[self length],to];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return str;
    }
}

//substringWithRange:
- (NSString *)noCrashSubstringWithRange:(NSRange)range{
    
    NSString *str = nil;
    @try {
        str = [self noCrashSubstringWithRange:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原字符串：===%@===\n长度：%ld\nRange:(%ld,%ld)",kNowSelector,self,[self length],range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return str;
    }
}

//stringByReplacingOccurrencesOfString:withString:options:range:
- (NSString *)noCrashStringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange{
    
    NSString *str = nil;
    @try {
        str = [self noCrashStringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原字符串：===%@===\n长度：%ld\ntarget:%@\nreplacement:%@\noptions:%ld\nRange:(%ld,%ld)",kNowSelector,self,[self length],target,replacement,options,searchRange.location,searchRange.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return str;
    }
}

//- (NSString *)stringByReplacingOccurrencesOfString:withString:
- (NSString *)noCrashStringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement{

    NSString *str = nil;
    @try {
        str = [self noCrashStringByReplacingOccurrencesOfString:target withString:replacement];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原字符串：===%@===\n长度：%ld\nreplacement:%@",kNowSelector,self,[self length],replacement];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return str;
    }
}

//stringByReplacingCharactersInRange:withString:
- (NSString *)noCrashStringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement{
    
    NSString *str = nil;
    @try {
        str = [self noCrashStringByReplacingCharactersInRange:range withString:replacement];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原字符串：===%@===\n长度：%ld\nreplacement:%@\nRange:(%ld,%ld)",kNowSelector,self,[self length],replacement,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return str;
    }
}

@end

