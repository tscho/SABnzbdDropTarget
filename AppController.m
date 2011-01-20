//
//  AppController.m
//  SABnzbdDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-06.
//  Copyright 2010 Thomas Schoendorfer. All rights reserved.
//

#import "AppController.h"
#import "SABnzbdDropDelegate.h"
#import "PrefsController.h"
#import "SABnzbdDropTargetAppDelegate.h"

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
	
	[dropView setDropDelegate:[[SABnzbdDropDelegate alloc] init]];
	
	
	[statusItem setView:dropView];
	[statusItem setHighlightMode:YES];
}

@end
