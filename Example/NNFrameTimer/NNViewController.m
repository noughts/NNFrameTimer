//
//  NNViewController.m
//  NNFrameTimer
//
//  Created by Koichi Yamamoto on 06/22/2015.
//  Copyright (c) 2014 Koichi Yamamoto. All rights reserved.
//

#import "NNViewController.h"
#import <NNFrameTimer/NNFrameTimer.h>
#import "MyTimer.h"

@implementation NNViewController{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NNFrameTimer* timer2 = [NNFrameTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(hoge:)];
	
//	NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
}

-(void)onTimer:(MyTimer*)timer{
	NSLog( @"%@", timer );
}


-(void)hoge:(NNFrameTimer*)timer{
	NSLog( @"%@", timer );
	NSLog( @"%@", @(timer.currentCount) );
}


@end
