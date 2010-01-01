//
//  MacUI.m
//  zsnes
//
//  Created by Daniel Potter on 12/30/09.
//

#import "MacUI.h"

void macos_alert(char* format, ...) {
	va_list args;
	va_start(args, format);
	NSString* message = [[NSString alloc]
						 initWithFormat: [NSString stringWithUTF8String: format]
						 arguments: args];
	va_end(args);
	NSAlert* alert = [[NSAlert alloc] init];
	[alert setMessageText: message];
	[alert runModal];
	[alert release];
	[message release];
}