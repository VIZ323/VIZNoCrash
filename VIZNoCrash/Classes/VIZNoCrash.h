//
//  VIZNoCrash.h
//  FBSnapshotTestCase
//
//  Created by 位立志 on 2019/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VIZNoCrash : NSObject

/**
 开始无崩溃旅程
 */
+ (void)beiginNoCrash;

+ (void)beiginNoCrashWithBuglyKey:(NSString *)buglyKey;

@end

NS_ASSUME_NONNULL_END
