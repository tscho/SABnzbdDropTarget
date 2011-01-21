//
//  SABnzbdDropDelegate.m
//  SABnzbdDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-08.
//  Copyright 2010 Thomas Schoendorfer. All rights reserved.
//

#import "SABnzbdDropDelegate.h"

@implementation SABnzbdDropDelegate

@synthesize client;

- (id)init {
	if(self = [super init]) {
		classArray = [[NSArray arrayWithObject:[NSURL class]] retain];
		options = [[NSDictionary alloc] init];
		
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		client = [[SABnzbdClient alloc] initWithConnectionDetails:[defaults URLForKey:HostPrefKey] 
													   withApiKey:[defaults objectForKey:APIKeyPrefKey]];
		
		
		[defaults addObserver:self 
				   forKeyPath:HostPrefKey
					  options:0
					  context:nil];
		
		[defaults addObserver:self 
				   forKeyPath:APIKeyPrefKey
					  options:0 
					  context:nil];
	}
	return self;
}

- (void)didDrop:(NSPasteboard *)pasteboard {
	if ([pasteboard canReadObjectForClasses:classArray options:options]) {
		NSArray *objectsToPaste = [pasteboard readObjectsForClasses:classArray options:options];
		NSURL *pastedURL = [objectsToPaste objectAtIndex:0];
		NSLog(@"Pasted URL: %@", pastedURL);
		if(![client addNzb:pastedURL])
			NSLog(@"Failed to add pasted nzb");
		else {
			NSLog(@"Added pasted nzb succesfully");
		}
	}
}

- (void)observeValueForKeyPath:(NSString *)keyPath 
					  ofObject:(id)object 
						change:(NSDictionary *)change 
					   context:(void *)context {
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	if([keyPath isEqualToString:HostPrefKey]) {
		NSLog(@"Updated client host url");
		[client setHost:[defaults URLForKey:HostPrefKey]];
	}
	
	if ([keyPath isEqualToString:APIKeyPrefKey]) {
		NSLog(@"Updated client api key");
		[client setApiKey:[defaults objectForKey:APIKeyPrefKey]];
	}
}

-(void) dealloc {
	[classArray release];
	[options release];
	[client release];
	[super dealloc];
}
	

@end
