//
//  SabNZBDDropDelegate.m
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-08.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SabNZBDDropDelegate.h"

@implementation SabNZBDDropDelegate

- (id)init {
	classArray = [[NSArray arrayWithObject:[NSURL class]] retain];
	options = [NSDictionary dictionary];
	return self;
}

- (void)didDrop:(NSPasteboard *)pasteboard {
	if ([pasteboard canReadObjectForClasses:classArray options:options]) {
		NSArray *objectsToPaste = [pasteboard readObjectsForClasses:classArray options:options];
		NSURL *pastedURL = [objectsToPaste objectAtIndex:0];
		NSLog(@"Pasted URL: %@", pastedURL);
	}
}

@end
