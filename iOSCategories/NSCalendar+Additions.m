//
//  NSCalendar+Additions.m
//
//  Created by Applico Inc on 7/22/14.
//  Copyright (c) 2014 Applico Inc. All rights reserved.
//

#import "NSCalendar+Additions.h"

@implementation NSCalendar (Additions)

-(NSInteger)daysWithinEraFromDate:(NSDate *) startDate toDate:(NSDate *) endDate
{
    NSInteger startDay=[self ordinalityOfUnit:NSDayCalendarUnit
                                       inUnit: NSEraCalendarUnit forDate:startDate];
    NSInteger endDay=[self ordinalityOfUnit:NSDayCalendarUnit
                                     inUnit: NSEraCalendarUnit forDate:endDate];
    
    return endDay-startDay;
}

-(NSInteger)hoursWithinEraFromDate:(NSDate *) startDate toDate:(NSDate *) endDate
{
    NSInteger startDay=[self ordinalityOfUnit:NSHourCalendarUnit
                                       inUnit: NSEraCalendarUnit forDate:startDate];
    NSInteger endDay=[self ordinalityOfUnit:NSHourCalendarUnit
                                     inUnit: NSEraCalendarUnit forDate:endDate];

    return endDay-startDay;
}

@end
