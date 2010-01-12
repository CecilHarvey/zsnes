/*
 * Copyright (C) 2010 Daniel Potter
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#import "AboutDialog.h"


@implementation AboutDialog

-(id) init {
	self = [super initWithWindowNibName:@"About"];
	if (self) {
	}
	return self;
}

-(void) windowDidLoad {
	// Grab the version
	NSString* version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
	[versionLabel setStringValue:
	 [[versionLabel stringValue] stringByReplacingOccurrencesOfString:@"$(version)" withString:version]];
	NSWindow* window = [self window];
	NSLog(@"Title: %@", [window title]);
	// And now generate the links
	[linkTextView setEditable:NO];
	[linkTextView setDrawsBackground:NO];
	NSAttributedString* links =
	[[NSAttributedString alloc] initWithRTF: [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"AboutLinks" withExtension:@"rtf"]]
						 documentAttributes: nil];
	[[linkTextView textStorage] appendAttributedString: links];
	[links release];
	[window center];
}

@end

@implementation ZAboutWindow

- (void) awakeFromNib {
	NSString* version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
	[self setTitle:
	 [[self title] stringByReplacingOccurrencesOfString:@"$(version)" withString:version]];
}

- (void)keyDown:(NSEvent *)event {
	NSLog(@"Event");
	if ([event modifierFlags] & (NSControlKeyMask | NSAlternateKeyMask | NSCommandKeyMask) == 0) {
		if ([[event characters] caseInsensitiveCompare:@"E"] == NSOrderedSame) {
			NSLog(@"Toggle easter egg.");
		}
	}
}

- (BOOL)canBecomeKeyWindow {
	return YES;
}

@end