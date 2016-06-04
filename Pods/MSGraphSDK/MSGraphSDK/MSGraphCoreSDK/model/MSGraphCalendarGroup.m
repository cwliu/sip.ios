// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphCalendarGroup()
{
    NSString* _name;
    NSString* _classId;
    NSString* _changeKey;
    NSArray* _calendars;
}
@end

@implementation MSGraphCalendarGroup

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.calendarGroup";
    }
    return self;
}
- (NSString*) name
{
    return self.dictionary[@"name"];
}
- (void) setName: (NSString*) val
{
    self.dictionary[@"name"] = val;
}
- (NSString*) classId
{
    return self.dictionary[@"classId"];
}
- (void) setClassId: (NSString*) val
{
    self.dictionary[@"classId"] = val;
}
- (NSString*) changeKey
{
    return self.dictionary[@"changeKey"];
}
- (void) setChangeKey: (NSString*) val
{
    self.dictionary[@"changeKey"] = val;
}
- (NSArray*) calendars
{
    if(!_calendars){
        
    NSMutableArray *calendarsResult = [NSMutableArray array];
    NSArray *calendars = self.dictionary[@"calendars"];

    if ([calendars isKindOfClass:[NSArray class]]){
        for (id calendar in calendars){
            [calendarsResult addObject:[[MSGraphCalendar alloc] initWithDictionary: calendar]];
        }
    }

    _calendars = calendarsResult;
        
    }
    return _calendars;
}
- (void) setCalendars: (NSArray*) val
{
    _calendars = val;
    self.dictionary[@"calendars"] = val;
}

@end
