//
//  zsnesAppDelegate.m
//  zsnes
//
//  Created by Daniel Potter on 12/27/09.
//

#import "zsnesAppDelegate.h"
#import "AboutDialog.h"

#include "zpath.h"

// From zloader.c
void zstart(void);
// bool definition is in zpath.h
void powercycle(bool, bool);

@implementation zsnesAppDelegate

@synthesize window;

- (id) init {
	self = [super init];
	if (self) {
		haveLaunched = NO;
		cartpath = nil;
	}
	return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// This is where SDL launches the "real" main
	haveLaunched = YES;
	zstart();
}

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename {
	// We should attempt to open the file (unless we're yet to init, stupid
	// Cocoa)
	char* p = strdup([filename UTF8String]);
	if (init_rom_path(p)) {
		// TODO: We should probably ask to replace the existing ROM if the
		// emulator is running
		if (haveLaunched)
			powercycle(false, true);
		free(p);
		return YES;
	}
	free(p);
	return NO;
}

- (IBAction) showAboutWindow:(id)sender {
	// Should this open the GUI window or the Mac OS X window?
	// For now, a Mac OS X window
	[[[AboutDialog alloc] init] showWindow:sender];
}

@end
