#import <Foundation/Foundation.h>
@import UIKit;

@interface NNFrameTimer : NSObject

-(instancetype)initWithInterval:(NSInteger)interval target:(id)target selector:(SEL)selector;
-(void)invalidate;
-(NSInteger)currentCount;
-(BOOL)running;

@end
