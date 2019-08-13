//
//  VIZNoCrashManger.h
//  FBSnapshotTestCase
//
//  Created by 位立志 on 2019/7/25.
//

#import <Foundation/Foundation.h>

@interface VIZNoCrashManger : NSObject

#define kShenShou @"\n======================\n💐💐💐恭喜\n======================\n   _._ _..._ .-',     _.._(`))\n  '-. `     '  |-._.-'    ',|\n     )         /\            '.\n    | _    _    |             |\n   |  a    a    |              |\n   /\   .-.                     ;\n    '-('' ).-'       ,'       ;\n       '-;           |      .'\n          /\           /\    |\n          | 7  .__  _.-/\   |\n          | |  |  ``|  |`  |\n         |,_|  |   |,_|   |\n            |,_|      '`-'\n\n======================\n帮你拦截了一次崩溃\n======================\n"

#define kNowSelector [NSStringFromSelector(_cmd) stringByReplacingOccurrencesOfString:@"noCrash" withString:@""]

/**
 对象方法交换
 
 @param anClass 对应类
 @param oldMethodSel 原本方法
 @param newMethodSel 替换后的方法
 */
+ (void)exchangeInstanceMethod:(Class)anClass
                  oldMethodSel:(SEL)oldMethodSel
                  newMethodSel:(SEL)newMethodSel;

/**
 类方法交换
 
 @param anClass 对应类
 @param oldMethodSel 原本方法
 @param newMethodSel 替换后方法
 */
+ (void)exchangeClassMethod:(Class)anClass
               oldMethodSel:(SEL)oldMethodSel
               newMethodSel:(SEL)newMethodSel;


/**
 获取到的崩溃信息
 
 @param exception 捕获到的异常
 @param result 调整后的结果（）
 */
+ (void)dealErrorWithException:(NSException *)exception result:(id)result;



/**
 获取到的崩溃信息

 @param exception 捕获到的异常
 @param callStackSymbolsArrays 堆栈信息
 @param result 自定义结果
 */
+ (void)dealErrorWithException:(NSException *)exception callStackSymbolsArrays:(NSArray *)callStackSymbolsArrays result:(id)result;



/**
 调用bugly

 @param buglyKey buglyKey
 */
+ (void)startBugly:(NSString *)buglyKey;

/**
 替换未知方法
 */
- (void)objectNoSelectorCrash;

@end

