//
//  PrefsController.h
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-18.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString* const APIKeyPrefKey;
extern NSString* const HostPrefKey;

@interface PrefsController : NSWindowController {
	NSURL *host;
	NSString *apiKey;
	IBOutlet NSTextField *hostField;
	IBOutlet NSTextField *apiKeyField;
}

@property (retain) NSURL *host;
@property (retain) NSString *apiKey;
@property (assign) IBOutlet NSTextField *hostField;
@property (assign) IBOutlet NSTextField *apiKeyField;

-(IBAction)apply:(id)sender;
-(IBAction)cancel:(id)sender;

-(void) displayDefaults;

@end
