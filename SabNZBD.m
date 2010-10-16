//
//  SabNZBD.m
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SabNZBD.h"


@implementation SabNZBD

@synthesize host;
@synthesize apiKey;

- (id)initWithConnectionDetails:(NSString *)host apiKey:(NSString *)apiKey {
	if(self = [super init]) {
		[self setHost:host];
		[self setApiKey:apiKey];
	}
	
	return self;
}

- (BOOL)addNzb:(NSURL *)url {
	NSURL *requestUrl = [[NSURL alloc] initWithString:
						 [NSString stringWithFormat:@"%@/api?mode=addurl&name=%@&apikey=%@",
							host,
							[url description],
							apiKey]];
	
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:requestUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	
	if (connection) {
		response = [[NSMutableData data] retain];
		return YES;
	}
	return NO;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSData *)data {
	[response setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[response appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[connection release];
	[response release];
	
	NSLog(@"Connection error: %@", [error localizedDescription]);
}

-(void)connection:(NSURLConnection *)connectoin didFinishLoading:(NSURLConnection *)connection {
	[connection release];
	
	//do something with data
	
	[response release];
}

@end
