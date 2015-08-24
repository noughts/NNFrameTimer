//
//  NNViewController.m
//  NNFrameTimer
//
//  Created by Koichi Yamamoto on 06/22/2015.
//  Copyright (c) 2014 Koichi Yamamoto. All rights reserved.
//

#import "NNViewController.h"
#import <NNFrameTimer/NNFrameTimer.h>
#import <NBULogStub.h>

@implementation NNViewController{
	NNFrameTimer* _timer;
}

- (void)viewDidLoad{
	[NBULog setKitLogLevel:DDLogLevelVerbose];
	
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	_timer = [NNFrameTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(hoge1:)];
//	[NNFrameTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(hoge:)];/// <- NSTimerと同じようにクラスで参照を保持しているので、timerをインスタンス変数にしなくても動作します
}


-(IBAction)onButtonTap:(id)sender{
	[_timer invalidate];
}

-(void)hoge1:(NNFrameTimer*)timer{
	NSLog( @"%@", timer );
	NSLog( @"%@", @(timer.currentCount) );
	NSLog( @"%@", @(timer.duration) );
	if( timer.currentCount == 60*2 ){
		[timer invalidate];
	}
}

-(void)hoge:(NNFrameTimer*)timer{
	NSLog( @"%@", timer );
	NSLog( @"%@", @(timer.currentCount) );
	NSLog( @"%@", @(timer.duration) );
	if( timer.currentCount == 2 ){
		[timer invalidate];
	}
}


@end
