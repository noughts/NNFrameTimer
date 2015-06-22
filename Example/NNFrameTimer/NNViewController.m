//
//  NNViewController.m
//  NNFrameTimer
//
//  Created by Koichi Yamamoto on 06/22/2015.
//  Copyright (c) 2014 Koichi Yamamoto. All rights reserved.
//

#import "NNViewController.h"
#import <NNFrameTimer/NNFrameTimer.h>

@implementation NNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NNFrameTimer* timer = [[NNFrameTimer alloc] initWithInterval:60 target:self selector:@selector(hoge:)];
	[timer start];
}


-(void)hoge:(NNFrameTimer*)timer{
	NSLog( @"%@", timer );
	NSLog( @"%@", @(timer.currentCount) );
}


@end
