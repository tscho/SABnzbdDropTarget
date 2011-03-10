//
//  SABnzbdClient.m
//  SABnzbdDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-13.
//  Copyright 2010 Thomas Schoendorfer. All rights reserved.
//

#import "SABnzbdClient.h"

NSString* const APIKeyPrefKey = @"APIKey";
NSString* const HostPrefKey = @"Host";

@implementation SABnzbdClient

@synthesize host;
@synthesize apiKey;

- (id)initWithConnectionDetails:(NSURL *)withHost withApiKey:(NSString *)withApiKey {
	if(self = [super init]) {
		[self setHost:[withHost retain]];
		[self setApiKey:[withApiKey retain]];
	}
	return self;
}

- (BOOL)addNzb:(NSURL *)url {
	NSURL *requestUrl = [[NSURL alloc] initWithString:
						 [NSString stringWithFormat:@"%@/api?mode=addurl&name=%@&apikey=%@",
							[host description],
							[[url description] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
							apiKey]];
	
	NSLog(@"Request URL: %@", requestUrl);
	
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:requestUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
	NSHTTPURLResponse *response;
	NSError *error;
	
	[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

	NSLog(@"Got response %@", [response statusCode]);
	
	BOOL returnVal = [response statusCode] == 200;
	
	[requestUrl release];
	[request release];
	
	return returnVal;
}

-(void) dealloc {
	[host release];
	[apiKey release];
	[super dealloc];
}
@end
