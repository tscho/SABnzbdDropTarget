//
//  PrefsController.h
//  SABnzbdDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-18.
//  Copyright 2010 Thomas Schoendorfer. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString* const APIKeyPrefKey;
extern NSString* const HostPrefKey;

@interface PrefsController : NSWindowController <NSWindowDelegate> {
	NSURL *host;
	NSString *apiKey;
	IBOutlet NSTextField *hostField;
	IBOutlet NSTextField *apiKeyField;
}

@property (retain) NSURL *host;
@property (retain) NSString *apiKey;
@property (assign) IBOutlet NSTextField *hostField;
@property (assign) IBOutlet NSTextField *apiKeyField;

-(void) displayDefaults;
-(void) savePreferences;

@end
