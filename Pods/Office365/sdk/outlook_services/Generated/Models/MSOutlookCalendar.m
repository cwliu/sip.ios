/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/

#import "MSOutlookModels.h"

/**
* The implementation file for type MSOutlookCalendar.
*/

@implementation MSOutlookCalendar	

@synthesize odataType = _odataType;
@synthesize Name = _name;
@synthesize ChangeKey = _changeKey;
@synthesize Color = _color;
@synthesize CalendarView = _calendarView;
@synthesize Events = _events;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.OutlookServices.Calendar";
		_calendarView = [[NSMutableArray alloc] initWithCollectionType:@"MSOutlookEvent"];
		_events = [[NSMutableArray alloc] initWithCollectionType:@"MSOutlookEvent"];
    }

	return self;
}

- (void)setName:(NSString *) name {
    _name = name;
	[self valueChanged:name forProperty:@"Name"];
}
    
- (void)setChangeKey:(NSString *) changeKey {
    _changeKey = changeKey;
	[self valueChanged:changeKey forProperty:@"ChangeKey"];
}
    - (void)setColorString:(NSString *)value {

	if ([value isEqualToString:@"LightBlue"]) {	

		_color  = MSOutlook_CalendarColor_LightBlue;
        [self valueChangedForInt:MSOutlook_CalendarColor_LightBlue forProperty:@"Color"];
	}

	if ([value isEqualToString:@"LightGreen"]) {	

		_color  = MSOutlook_CalendarColor_LightGreen;
        [self valueChangedForInt:MSOutlook_CalendarColor_LightGreen forProperty:@"Color"];
	}

	if ([value isEqualToString:@"LightOrange"]) {	

		_color  = MSOutlook_CalendarColor_LightOrange;
        [self valueChangedForInt:MSOutlook_CalendarColor_LightOrange forProperty:@"Color"];
	}

	if ([value isEqualToString:@"LightGray"]) {	

		_color  = MSOutlook_CalendarColor_LightGray;
        [self valueChangedForInt:MSOutlook_CalendarColor_LightGray forProperty:@"Color"];
	}

	if ([value isEqualToString:@"LightYellow"]) {	

		_color  = MSOutlook_CalendarColor_LightYellow;
        [self valueChangedForInt:MSOutlook_CalendarColor_LightYellow forProperty:@"Color"];
	}

	if ([value isEqualToString:@"LightTeal"]) {	

		_color  = MSOutlook_CalendarColor_LightTeal;
        [self valueChangedForInt:MSOutlook_CalendarColor_LightTeal forProperty:@"Color"];
	}

	if ([value isEqualToString:@"LightPink"]) {	

		_color  = MSOutlook_CalendarColor_LightPink;
        [self valueChangedForInt:MSOutlook_CalendarColor_LightPink forProperty:@"Color"];
	}

	if ([value isEqualToString:@"LightBrown"]) {	

		_color  = MSOutlook_CalendarColor_LightBrown;
        [self valueChangedForInt:MSOutlook_CalendarColor_LightBrown forProperty:@"Color"];
	}

	if ([value isEqualToString:@"LightRed"]) {	

		_color  = MSOutlook_CalendarColor_LightRed;
        [self valueChangedForInt:MSOutlook_CalendarColor_LightRed forProperty:@"Color"];
	}

	if ([value isEqualToString:@"MaxColor"]) {	

		_color  = MSOutlook_CalendarColor_MaxColor;
        [self valueChangedForInt:MSOutlook_CalendarColor_MaxColor forProperty:@"Color"];
	}

	if ([value isEqualToString:@"Auto"]) {	

		_color  = MSOutlook_CalendarColor_Auto;
        [self valueChangedForInt:MSOutlook_CalendarColor_Auto forProperty:@"Color"];
	}
}

- (void)setCalendarView:(NSMutableArray *) calendarView {
    _calendarView = calendarView;
	[self valueChanged:calendarView forProperty:@"CalendarView"];
}
    
- (void)setEvents:(NSMutableArray *) events {
    _events = events;
	[self valueChanged:events forProperty:@"Events"];
}
    
@end