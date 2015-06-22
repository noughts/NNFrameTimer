#import "NNFrameTimer.h"

@implementation NNFrameTimer{
	NSInteger _currentCount;
	BOOL _running;
	
	CADisplayLink* _link;
	NSInteger _counter;
	NSInteger _interval;
	__weak id _target;
    SEL _selector;
}

-(instancetype)initWithInterval:(NSInteger)interval target:(id)target selector:(SEL)selector{
	if( self = [super init]){
		_interval = interval;
		_target = target;
		_selector = selector;
	}
	return self;
}

-(void)start{
	if( _running ){
		return;
	}
	_link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
//	[_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
	[_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
	_running = YES;
}


-(void)stop{
	[_link invalidate];
	_running = NO;
}


-(void)update:(CADisplayLink*)link{
	if( _counter % _interval == 0 ){
		if( [_target canPerformAction:_selector withSender:self] ){
			#pragma clang diagnostic push
			#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
			[_target performSelector:_selector withObject:self];
			#pragma clang diagnostic pop
		}
		_currentCount++;
	}
	_counter++;
}


-(NSInteger)currentCount{
	return _currentCount;
}

-(BOOL)running{
	return _running;
}


@end
