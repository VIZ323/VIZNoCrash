//
//  VIZNoCrashManger.m
//  FBSnapshotTestCase
//
//  Created by 位立志 on 2019/7/25.
//

#import "VIZNoCrashManger.h"
#import <objc/runtime.h>
#import "NSArray+VIZNoCrash.h"
#import "NSDictionary+VIZNoCrash.h"
#import <Bugly/Bugly.h>

@implementation VIZNoCrashManger

static NSInteger errornum = 0;

/**
 对象方法交换
 
 @param anClass 对应类
 @param oldMethodSel 原本方法
 @param newMethodSel 替换后的方法
 */
+ (void)exchangeInstanceMethod:(Class)anClass
                  oldMethodSel:(SEL)oldMethodSel
                  newMethodSel:(SEL)newMethodSel{
    
    Method originalMethod = class_getInstanceMethod(anClass, oldMethodSel);
    Method swizzledMethod = class_getInstanceMethod(anClass, newMethodSel);
    
    BOOL isAddMethod = class_addMethod(anClass, oldMethodSel,
                                       method_getImplementation(swizzledMethod),
                                       method_getTypeEncoding(swizzledMethod));
    
    if (isAddMethod) {
        class_replaceMethod(anClass, newMethodSel,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}


/**
 类方法交换
 
 @param anClass 对应类
 @param oldMethodSel 原本方法
 @param newMethodSel 替换后方法
 */
+ (void)exchangeClassMethod:(Class)anClass
               oldMethodSel:(SEL)oldMethodSel
               newMethodSel:(SEL)newMethodSel{
    
    Method originalMethod = class_getClassMethod(anClass, oldMethodSel);
    Method swizzledMethod = class_getClassMethod(anClass, newMethodSel);
    method_exchangeImplementations(originalMethod, swizzledMethod);
    
}

/**
 获取到的崩溃信息
 
 @param exception 捕获到的异常
 @param result 提示信息
 */
+ (void)dealErrorWithException:(NSException *)exception result:(id)result{
    
    //堆栈数据
    NSArray *callStackSymbolsArrays = [NSThread callStackSymbols];
    
    //获取对应的崩溃信息以及方法
    NSString *mainCallStackSymbolMsg = [self getMainCallStackSymbolMessageWithCallStackSymbols:callStackSymbolsArrays];
    
    NSString *errorName = [NSString stringWithFormat:@"Error   Name: %@",exception.name];
    NSString *errorReason = [NSString stringWithFormat:@"Error Reason: %@",[exception.reason stringByReplacingOccurrencesOfString:@"noCrash" withString:@""]];
    NSString *errorResult = [NSString stringWithFormat:@"Error Result: %@",result];
    errorReason = [errorReason stringByReplacingOccurrencesOfString:@"NoCrash" withString:@""];
    
    NSString *errorPlace = [NSString stringWithFormat:@"Error  Place: %@",mainCallStackSymbolMsg];
    NSString *allErrorMessage = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n",errorPlace,errorName,errorReason,errorResult];
//    [Bugly reportException:exception];
//    [Bugly reportError:[NSError errorWithDomain:exception.name code:errornum userInfo:@{@"allErrorMessage":allErrorMessage}]];
    NSLog(@"\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n错误 %ld信息如下\n%@\n%@\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n错误 %ld信息结束",errornum,kShenShou,allErrorMessage,errornum);
    errornum ++;
}

+ (void)dealErrorWithException:(NSException *)exception callStackSymbolsArrays:(NSArray *)callStackSymbolsArrays result:(id)result{
    //获取对应的崩溃信息以及方法
    NSString *mainCallStackSymbolMsg = [self getMainCallStackSymbolMessageWithCallStackSymbols:callStackSymbolsArrays];
    
    NSString *errorName = [NSString stringWithFormat:@"Error   Name: %@",exception.name];
    NSString *errorReason = [NSString stringWithFormat:@"Error Reason: %@",[exception.reason stringByReplacingOccurrencesOfString:@"noCrash" withString:@""]];
    NSString *errorResult = [NSString stringWithFormat:@"Error Result: %@",result];
    errorReason = [errorReason stringByReplacingOccurrencesOfString:@"NoCrash" withString:@""];
    
    NSString *errorPlace = [NSString stringWithFormat:@"Error  Place: %@",mainCallStackSymbolMsg];
    NSString *allErrorMessage = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n",errorPlace,errorName,errorReason,errorResult];
//    [Bugly reportException:exception];
    [Bugly reportError:[NSError errorWithDomain:exception.name code:errornum userInfo:@{@"allErrorMessage":allErrorMessage,@"exception":exception}]];
    NSLog(@"\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n错误 %ld信息如下\n%@\n%@\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n错误 %ld信息结束",errornum,kShenShou,allErrorMessage,errornum);
    errornum ++;
}

/**
 分析崩溃信息,获取对应的类以及方法
 
 @param callStackSymbols 堆栈数据
 @return 整理后崩溃信息
 */
+ (NSString *)getMainCallStackSymbolMessageWithCallStackSymbols:(NSArray<NSString *> *)callStackSymbols{
    
    __block NSString *mainCallStackSymbolMsg = nil;
    
    //匹配格式为 -[类名 方法名]  或者 +[类名 方法名]
    NSString *regularStr = @"[-\\+]\\[.+\\]";
    
    NSRegularExpression *regularExp = [[NSRegularExpression alloc] initWithPattern:regularStr options:NSRegularExpressionCaseInsensitive error:nil];
    
    for (int i = 0; i<callStackSymbols.count; i++) {
        NSString *callStackSymbol = callStackSymbols[i];
        [regularExp enumerateMatchesInString:callStackSymbol options:NSMatchingReportProgress range:NSMakeRange(0, callStackSymbol.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
            if (result) {
                
                NSString *tempCallStackSymbol = [callStackSymbol substringWithRange:result.range];
                //className
                NSString *className = [tempCallStackSymbol componentsSeparatedByString:@" "].firstObject;
                className = [className componentsSeparatedByString:@"["].lastObject;
                
                NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(className)];
                if (![className hasSuffix:@")"] && bundle == [NSBundle mainBundle]) {
                    mainCallStackSymbolMsg = tempCallStackSymbol;
                }
                *stop = YES;
            }
        }];
        if (mainCallStackSymbolMsg.length) {
            break;
        }
    }
    
    if (mainCallStackSymbolMsg ==nil) {
        mainCallStackSymbolMsg = @"未定位到崩溃方法，请您手动排查问题";
    }
    
    return mainCallStackSymbolMsg;
}

+ (void)startBugly:(NSString *)buglyKey{
    
    [Bugly startWithAppId:buglyKey];
    
}


- (void)objectNoSelectorCrash{
    
    
}


@end
