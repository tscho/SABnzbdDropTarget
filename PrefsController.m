//
//  PrefsController.m
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-18.
//  Copyright 2010 Thomas Schoendorfer. All rights reserved.
//

#import "PrefsController.h"

NSString* const APIKeyPrefKey = @"APIKey";
NSString* const HostPrefKey = @"Host";

@implementation PrefsController

@synthesize host;
@synthesize apiKey;
@synthesize hostField;
@synthesize apiKeyField;

-(id) init {
	if(![super initWithWindowNibName:@"Prefs"])
		return nil;
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSLog(@"default host: %@", [defaults URLForKey:HostPrefKey]);
	[self setHost:[defaults URLForKey:HostPrefKey]];
	NSLog(@"default apikey: %@", [defaults objectForKey:APIKeyPrefKey]);
	[self setApiKey:[defaults objectForKey:APIKeyPrefKey]];
	
	return self;
}

-(void) windowDidLoad {
	[[self window] setDelegate:self];
	[self displayDefaults];
}

-(void) savePreferences {
	[self setHost:[NSURL URLWithString:[hostField stringValue]]];
	NSLog(@"New host value: %@", [self host]);
	[self setApiKey:[apiKeyField stringValue]];
	NSLog(@"New apikey value: %@", [self apiKey]);
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setURL:host forKey:HostPrefKey];
	NSLog(@"new default host: %@", [defaults URLForKey:HostPrefKey]);
	[defaults setObject:apiKey forKey:APIKeyPrefKey];
	NSLog(@"new default apikey: %@", [defaults objectForKey:APIKeyPrefKey]);
	[defaults synchronize];
}

-(void) displayDefaults {
	[hostField setStringValue:[[self host] description]];
	[apiKeyField setStringValue:[self apiKey]];
}

-(void)windowWillClose:(NSNotification *)notification {
	NSLog(@"Prefs window will close");
	[self savePreferences];
}

@end
