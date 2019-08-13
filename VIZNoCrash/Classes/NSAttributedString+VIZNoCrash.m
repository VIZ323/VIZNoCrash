//
//  NSAttributedString+VIZNoCrash.m
//  FBSnapshotTestCase
//
//  Created by 位立志 on 2019/8/2.
//

#import "NSAttributedString+VIZNoCrash.h"
#import "VIZNoCrashManger.h"

@implementation NSAttributedString (VIZNoCrash)

+ (void)noCrashExchangeMethod{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class NSConcreteAttributedString = NSClassFromString(@"NSConcreteAttributedString");
        
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteAttributedString oldMethodSel:@selector(initWithString:) newMethodSel:@selector(noCrashInitWithString:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteAttributedString oldMethodSel:@selector(initWithString:attributes:) newMethodSel:@selector(noCrashInitWithString:attributes:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteAttributedString oldMethodSel:@selector(initWithAttributedString:) newMethodSel:@selector(noCrashInitWithAttributedString:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteAttributedString oldMethodSel:@selector(attributedSubstringFromRange:) newMethodSel:@selector(noCrashAttributedSubstringFromRange:)];

    });
    
}

- (instancetype)noCrashInitWithString:(NSString *)str{
    
    id obj = nil;
    @try {
        obj = [self noCrashInitWithString:str];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nstr:%@\n",kNowSelector,self,[self length],str];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return obj;
    }
}

- (instancetype)noCrashInitWithString:(NSString *)str attributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs{
    
    id obj = nil;
    @try {
        obj = [self noCrashInitWithString:str attributes:attrs];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nstr:%@\nattrs：%@\n",kNowSelector,self,[self length],str,attrs];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return obj;
    }
}


- (instancetype)noCrashInitWithAttributedString:(NSAttributedString *)attrStr{
    
    id obj = nil;
    @try {
        obj = [self noCrashInitWithAttributedString:attrStr];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nattrs：%@\n",kNowSelector,self,[self length],attrStr];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return obj;
    }
}


- (NSAttributedString *)noCrashAttributedSubstringFromRange:(NSRange)range{
    
    id obj = nil;
    @try {
        obj = [self noCrashAttributedSubstringFromRange:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nrange:(%ld,%ld)\n",kNowSelector,self,[self length],range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        return obj;
    }
}



@end
