#import <Foundation/Foundation.h>
@import UIKit;

@interface NNFrameTimer : NSObject

+(instancetype)scheduledTimerWithTimeInterval:(NSUInteger)interval target:(id)target selector:(SEL)selector;

-(void)invalidate;
-(NSInteger)currentCount;
-(BOOL)running;

/// タイマーの経過時間
-(CGFloat)duration;

@end
