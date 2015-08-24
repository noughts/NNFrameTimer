#import "NNFrameTimer.h"
#import "NBULogStub.h"

@implementation NNFrameTimer{
	CADisplayLink* _displayLink;
	NSInteger _currentCount;
	BOOL _running;
	
	NSInteger _counter;
	NSInteger _interval;
	__weak id _target;
    SEL _selector;
}

static NSMutableArray* _frameTimers;

/// タイマー作成。直接initを呼んで作成すると、どこからも参照がない場合にすぐにreleaseされてしまうので、NSTimerにならってstaticメソッドからインスタンスを作成し、クラスでインスタンスを保持する
+(instancetype)scheduledTimerWithTimeInterval:(NSUInteger)interval target:(id)target selector:(SEL)selector{
	NNFrameTimer* timer = [[NNFrameTimer alloc] initWithInterval:interval target:target selector:selector];
	if( !_frameTimers ){
		_frameTimers = [NSMutableArray new];
	}
	[_frameTimers addObject:timer];
	return timer;
}

-(instancetype)initWithInterval:(NSInteger)interval target:(id)target selector:(SEL)selector{
	if( self = [super init]){
		_interval = interval;
		_target = target;
		_selector = selector;
		_running = YES;
		
		_displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
		[_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
	}
	return self;
}

-(void)dealloc{
	NBULogVerbose(@"dealloc");
	[self invalidate];
}



-(void)invalidate{
	if( [_frameTimers containsObject:self] ){
		[_frameTimers removeObject:self];
		[_displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
		[_displayLink invalidate];
		_running = NO;
	}
}


-(void)update:(id)sender{
	if( _counter % _interval == 0 ){
		if( [_target respondsToSelector:_selector] ){
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
