//
//  SabNZBDDropDelegate.m
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-08.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SabNZBDDropDelegate.h"

@implementation SabNZBDDropDelegate

@synthesize client;

- (id)init {
	if(self = [super init]) {
		classArray = [[NSArray arrayWithObject:[NSURL class]] retain];
		options = [[[NSDictionary alloc] init] retain];
		
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		client = [[[SabNZBDClient alloc] initWithConnectionDetails:[defaults URLForKey:@"Host"] 
														withApiKey:[defaults objectForKey:@"APIKey"]] retain];
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
	}
}

-(void) dealloc {
	[classArray release];
	[options release];
	[client release];
	[super dealloc];
}
	

@end
