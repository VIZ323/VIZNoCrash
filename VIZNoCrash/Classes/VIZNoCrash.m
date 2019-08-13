//
//  VIZNoCrash.m
//  FBSnapshotTestCase
//
//  Created by 位立志 on 2019/7/24.
//

#import "VIZNoCrash.h"
#import "NSArray+VIZNoCrash.h"
#import "NSMutableArray+VIZNoCrash.h"
#import "NSAttributedString+VIZNoCrash.h"
#import "NSMutableAttributedString+VIZNoCrash.h"
#import "NSDictionary+VIZNoCrash.h"
#import "NSMutableDictionary+VIZNoCrash.h"
#import "NSString+VIZNoCrash.h"
#import "NSMutableString+VIZNoCrash.h"
#import "NSObject+VIZNoCrash.h"

#import "VIZNoCrashManger.m"

@implementation VIZNoCrash

//+ (void)beiginNoCrashWithBuglyKey:(NSString *)buglyKey{
//    [self beiginNoCrash];
//    [VIZNoCrashManger startBugly:buglyKey];
//}


+ (void)noCrashArray{
    [NSArray noCrashExchangeMethod];
}

+ (void)noCrashMutableArray{
    [NSMutableArray noCrashExchangeMethod];
}

+ (void)noCrashAttribute{
    [NSAttributedString noCrashExchangeMethod];
}

+ (void)noCrashMutableAttribute{
    [NSMutableAttributedString noCrashExchangeMethod];
}

+ (void)noCrashDictionary{
    [NSDictionary noCrashExchangeMethod];
}

+ (void)noCrashMutableDictionary{
    [NSMutableDictionary noCrashExchangeMethod];
}

+ (void)noCrashString{
    [NSString noCrashExchangeMethod];
}

+ (void)noCrashMutableString{
    [NSMutableString noCrashExchangeMethod];
}

+ (void)noCrashObject{
    [NSObject noCrashExchangeMethod];
}

+ (void)beiginNoCrash{
    
    [NSArray noCrashExchangeMethod];
    [NSMutableArray noCrashExchangeMethod];
    [NSAttributedString noCrashExchangeMethod];
    [NSMutableAttributedString noCrashExchangeMethod];
    [NSDictionary noCrashExchangeMethod];
    [NSMutableDictionary noCrashExchangeMethod];
    [NSString noCrashExchangeMethod];
    [NSMutableString noCrashExchangeMethod];
    [NSObject noCrashExchangeMethod];
}




@end
