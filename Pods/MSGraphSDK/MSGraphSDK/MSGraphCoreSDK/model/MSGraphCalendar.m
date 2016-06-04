// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphCalendar()
{
    NSString* _name;
    MSGraphCalendarColor* _color;
    NSString* _changeKey;
    NSArray* _events;
    NSArray* _calendarView;
}
@end

@implementation MSGraphCalendar

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.calendar";
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
- (MSGraphCalendarColor*) color
{
    if(!_color){
        _color = [self.dictionary[@"color"] toMSGraphCalendarColor];
    }
    return _color;
}
- (void) setColor: (MSGraphCalendarColor*) val
{
    _color = val;
    self.dictionary[@"color"] = val;
}
- (NSString*) changeKey
{
    return self.dictionary[@"changeKey"];
}
- (void) setChangeKey: (NSString*) val
{
    self.dictionary[@"changeKey"] = val;
}
- (NSArray*) events
{
    if(!_events){
        
    NSMutableArray *eventsResult = [NSMutableArray array];
    NSArray *events = self.dictionary[@"events"];

    if ([events isKindOfClass:[NSArray class]]){
        for (id event in events){
            [eventsResult addObject:[[MSGraphEvent alloc] initWithDictionary: event]];
        }
    }

    _events = eventsResult;
        
    }
    return _events;
}
- (void) setEvents: (NSArray*) val
{
    _events = val;
    self.dictionary[@"events"] = val;
}
- (NSArray*) calendarView
{
    if(!_calendarView){
        
    NSMutableArray *calendarViewResult = [NSMutableArray array];
    NSArray *calendarView = self.dictionary[@"calendarView"];

    if ([calendarView isKindOfClass:[NSArray class]]){
        for (id event in calendarView){
            [calendarViewResult addObject:[[MSGraphEvent alloc] initWithDictionary: event]];
        }
    }

    _calendarView = calendarViewResult;
        
    }
    return _calendarView;
}
- (void) setCalendarView: (NSArray*) val
{
    _calendarView = val;
    self.dictionary[@"calendarView"] = val;
}
- (MSGraphEvent*) events:(NSInteger)index
{
   MSGraphEvent* events = nil;
   if (self.events) {
       events = self.events[index];
   }
   return events;
}

@end
