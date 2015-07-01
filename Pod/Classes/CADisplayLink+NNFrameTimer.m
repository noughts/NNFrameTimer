#import "CADisplayLink+NNFrameTimer.h"






@interface NNFrameTimerDisplayLinkTarget : NSObject
@end

@implementation NNFrameTimerDisplayLinkTarget

-(void)update:(CADisplayLink *)link{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"onEnterFrame" object:link];
}

@end








@implementation CADisplayLink (NNFrameTimer)

static CADisplayLink* _sharedLink = nil;

+ (CADisplayLink*)sharedLink{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NNFrameTimerDisplayLinkTarget* target = [NNFrameTimerDisplayLinkTarget new];
		_sharedLink = [CADisplayLink displayLinkWithTarget:target selector:@selector(update:)];
		[_sharedLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
	});
	return _sharedLink;
}




@end





