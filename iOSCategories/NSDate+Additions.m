//
//  NSDate+Additions.m
//
//  Created by Applico Inc. on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import "NSDate+Additions.h"

@implementation NSDate (Additions)

- (NSDate *)previousDay {
    NSDate *date = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit | NSCalendarUnitHour | NSMinuteCalendarUnit) fromDate:self];
    
    [dateComponents setDay:[dateComponents day]-1];
    
    date = [calendar dateFromComponents:dateComponents];
    
    return date;
    
}

- (NSDate *)previousDayWithoutTime {
    NSDate *date = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:self];
    
    [dateComponents setDay:[dateComponents day]-1];
    [dateComponents setHour:0];
    [dateComponents setMinute:0];
    [dateComponents setSecond:0];
    
    date = [calendar dateFromComponents:dateComponents];
    
    return date;
    
}

- (NSDate *)dateWithoutTime {
    NSDate *date = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:self];
    
    [dateComponents setHour:0];
    [dateComponents setMinute:0];
    [dateComponents setSecond:0];
    
    date = [calendar dateFromComponents:dateComponents];
    
    return date;
    
}

- (NSString *)shortStyleTimeString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    NSTimeZone *timezone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    [dateFormatter setTimeZone:timezone];

    return [dateFormatter stringFromDate:self];
    
}

- (NSString *)shortStyleString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSTimeZone *timezone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    [dateFormatter setTimeZone:timezone];
    
    return [dateFormatter stringFromDate:self];
    
}

- (NSString *)longStyleString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterLongStyle];
    
    NSTimeZone *timezone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    [dateFormatter setTimeZone:timezone];
    
    return [dateFormatter stringFromDate:self];
    
}

- (NSDate *)dateWithUTCTimeZone {
    NSDate *date = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents *dateComponents = [calendar components:(NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:self];
    
    [calendar setTimeZone:[NSTimeZone localTimeZone]];
    
    date = [calendar dateFromComponents:dateComponents];
    
    return date;
    
}

- (NSString *)daysAndHoursSinceDate:(NSDate *)date {

    NSMutableString *returnString = [[NSMutableString alloc] init];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDateComponents *components = [calendar components:(NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit)
                                                fromDate:date
                                                  toDate:[NSDate date] options:0];
    
    
    if([components month] > 0) {
        if([components month] > 1) {
            [returnString appendString:@"s"];
        }
        [returnString appendFormat:@"%dM ", [components month]];
       
    }
    
    if([components day] > 0) {
        if([components day] > 1) {
            [returnString appendString:@"s"];
        }
        [returnString appendFormat:@"%dd ", [components day]];

    }
    
    if([components hour] > 0) {
        if([components hour] > 1) {
            [returnString appendString:@"s"];
        }
        [returnString appendFormat:@"%dh ", [components hour]];

    }
    
    if([components minute] > 0) {
        if([components minute] > 1) {
            [returnString appendString:@"s"];
        }
        [returnString appendFormat:@"%d min", [components minute]];

    }
    

    if([returnString length] > 0) {
        [returnString appendString:@" ago"];
        return returnString;
    }

    return @"now";
}

@end
