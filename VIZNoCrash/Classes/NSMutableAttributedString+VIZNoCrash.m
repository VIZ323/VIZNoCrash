//
//  NSMutableAttributedString+VIZNoCrash.m
//  FBSnapshotTestCase
//
//  Created by 位立志 on 2019/8/6.
//

#import "NSMutableAttributedString+VIZNoCrash.h"
#import "VIZNoCrashManger.h"

@implementation NSMutableAttributedString (VIZNoCrash)

+ (void)noCrashExchangeMethod{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class NSConcreteMutableAttributedString = NSClassFromString(@"NSConcreteMutableAttributedString");
        
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(initWithString:) newMethodSel:@selector(noCrashInitWithString:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(initWithString:attributes:) newMethodSel:@selector(noCrashInitWithString:attributes:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(initWithAttributedString:) newMethodSel:@selector(noCrashInitWithAttributedString:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(attributedSubstringFromRange:) newMethodSel:@selector(noCrashAttributedSubstringFromRange:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(replaceCharactersInRange:withString:) newMethodSel:@selector(noCrashReplaceCharactersInRange:withString:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(setAttributes:range:) newMethodSel:@selector(noCrashSetAttributes:range:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(addAttribute:value:range:) newMethodSel:@selector(noCrashAddAttribute:value:range:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(addAttributes:range:) newMethodSel:@selector(noCrashAddAttributes:range:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(removeAttribute:range:) newMethodSel:@selector(noCrashRemoveAttribute:range:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(replaceCharactersInRange:withAttributedString:) newMethodSel:@selector(noCrashReplaceCharactersInRange:withAttributedString:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(insertAttributedString:atIndex:) newMethodSel:@selector(noCrashInsertAttributedString:atIndex:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(appendAttributedString:) newMethodSel:@selector(noCrashAppendAttributedString:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(deleteCharactersInRange:) newMethodSel:@selector(noCrashDeleteCharactersInRange:)];
        [VIZNoCrashManger exchangeInstanceMethod:NSConcreteMutableAttributedString oldMethodSel:@selector(setAttributedString:) newMethodSel:@selector(noCrashSetAttributedString:)];
        
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

- (void)noCrashReplaceCharactersInRange:(NSRange)range withString:(NSString *)str{
    
    @try {
        [self noCrashReplaceCharactersInRange:range withString:str];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nstr:%@\nrange:(%ld,%ld)\n",kNowSelector,self,[self length],str,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashSetAttributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs range:(NSRange)range{
    
    @try {
        [self noCrashSetAttributes:attrs range:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nattrs:%@\nrange:(%ld,%ld)\n",kNowSelector,self,[self length],attrs,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashAddAttribute:(NSAttributedStringKey)name value:(id)value range:(NSRange)range{
    
    @try {
        [self noCrashAddAttribute:name value:value range:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nvalue:%@\nrange:(%ld,%ld)",kNowSelector,self,[self length],value,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashAddAttributes:(NSDictionary<NSAttributedStringKey, id> *)attrs range:(NSRange)range{
    
    @try {
        [self noCrashAddAttributes:attrs range:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nattrs:%@\nrange:(%ld,%ld)",kNowSelector,self,[self length],attrs,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashRemoveAttribute:(NSAttributedStringKey)name range:(NSRange)range{
    
    @try {
        [self noCrashRemoveAttribute:name range:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nname:%@\nrange:(%ld,%ld)",kNowSelector,self,[self length],name,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


- (void)noCrashReplaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString{
    
    @try {
        [self noCrashReplaceCharactersInRange:range withAttributedString:attrString];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nattrString:%@\nrange:(%ld,%ld)",kNowSelector,self,[self length],attrString,range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashInsertAttributedString:(NSAttributedString *)attrString atIndex:(NSUInteger)loc{
    
    @try {
        [self noCrashInsertAttributedString:attrString atIndex:loc];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nattrString:%@\nloc:%ld",kNowSelector,self,[self length],attrString,loc];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashAppendAttributedString:(NSAttributedString *)attrString{
    
    @try {
        [self noCrashAppendAttributedString:attrString];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nattrString:%@\n",kNowSelector,self,[self length],attrString];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashDeleteCharactersInRange:(NSRange)range{
    
    @try {
        [self noCrashDeleteCharactersInRange:range];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nrange:(%ld,%ld)\n",kNowSelector,self,[self length],range.location,range.length];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}

- (void)noCrashSetAttributedString:(NSAttributedString *)attrString{
    
    @try {
        [self noCrashSetAttributedString:attrString];
    } @catch (NSException *exception) {
        NSString *result = [NSString stringWithFormat:@"\n方法名称：%@\n原富文本：===%@===\n长度：%ld\nattrString:%@\n",kNowSelector,self,[self length],attrString];
        [VIZNoCrashManger dealErrorWithException:exception callStackSymbolsArrays:[NSThread callStackSymbols] result:result];
    } @finally {
        
    }
}


@end
