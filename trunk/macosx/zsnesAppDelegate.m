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
