#import <Foundation/Foundation.h>
@import UIKit;

@interface NNFrameTimer : NSObject

-(instancetype)initWithInterval:(NSInteger)interval target:(id)target selector:(SEL)selector;
-(void)start;
-(void)stop;
-(NSInteger)currentCount;
-(BOOL)running;

@end
