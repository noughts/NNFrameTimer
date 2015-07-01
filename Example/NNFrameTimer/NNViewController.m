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
	
	_timer = [NNFrameTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(hoge:)];
	NNFrameTimer* timer2 = [NNFrameTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(hoge:)];
}


-(IBAction)onButtonTap:(id)sender{
	[_timer invalidate];
}

-(void)hoge:(NNFrameTimer*)timer{
	NSLog( @"%@", timer );
	NSLog( @"%@", @(timer.currentCount) );
	if( timer.currentCount == 2 ){
		[timer invalidate];
	}
}


@end
