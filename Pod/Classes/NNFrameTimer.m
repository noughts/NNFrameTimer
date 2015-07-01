#import "NNFrameTimer.h"
#import "CADisplayLink+NNFrameTimer.h"
#import <NBULog.h>

@implementation NNFrameTimer{
	NSInteger _currentCount;
	BOOL _running;
	
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
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(update:) name:@"onEnterFrame" object:[CADisplayLink sharedLink]];
		_running = YES;
	}
	return self;
}

-(void)dealloc{
	NBULogVerbose(@"dealloc");
	[self invalidate];
}



-(void)invalidate{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"onEnterFrame" object:[CADisplayLink sharedLink]];
	_running = NO;
}


-(void)update:(id)sender{
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
