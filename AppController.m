//
//  AppController.m
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-06.
//  Copyright 2010 Thomas Schoendorfer. All rights reserved.
//

#import "AppController.h"
#import "SabNZBDDropDelegate.h"
#import "PrefsController.h"
#import "SabNZBDDropTargetAppDelegate.h"

@implementation AppController

@synthesize statusItem;
@synthesize statusMenu;
@synthesize dropView;

+ (void) initialize {
	NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
	
	[defaultValues setObject:@"" forKey:HostPrefKey];
	[defaultValues setObject:@"" forKey:APIKeyPrefKey];
	
	[[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
	
	NSLog(@"Registered defaults: %@", defaultValues);
}

- (void) setupStatusItem {
	[self setStatusItem:[[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength]];
	
	[dropView setStatusItem:statusItem];
	
	NSImage *statusImage = [NSImage imageNamed:@"sabnzbd"];
	[statusImage setSize:NSSizeFromString(@"16,16")];
	[dropView setIcon:statusImage];
	
	[dropView setMenu:statusMenu];
	
	[dropView registerForDraggedTypes:[NSArray arrayWithObjects:NSPasteboardTypeHTML,
									   NSPasteboardTypeString, nil]];
	
	[dropView setDropDelegate:[[SabNZBDDropDelegate alloc] init]];
	
	
	[statusItem setView:dropView];
	[statusItem setHighlightMode:YES];
}

@end
