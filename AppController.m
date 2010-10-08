//
//  AppController.m
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-06.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

@synthesize statusItem;
@synthesize statusMenu;
@synthesize dropView;

- (void) setupStatusItem {
	[self setStatusItem:[[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength]];
	
	[dropView setStatusItem:statusItem];
	
	NSImage *statusImage = [NSImage imageNamed:@"sabnzbd"];
	[statusImage setSize:NSSizeFromString(@"16,16")];
	[dropView setIcon:statusImage];
	
	[dropView setMenu:statusMenu];
	
	[dropView registerForDraggedTypes:[NSArray arrayWithObjects:NSPasteboardTypeRTF,
									   NSPasteboardTypeHTML, 
									   NSPasteboardTypeString, nil]];
	[dropView setDropHandler:self];
	
	[statusItem setView:dropView];
	[statusItem setHighlightMode:YES];
}

- (void) didDrop:(NSPasteboard *)pasteboard {
	
}

@end
