//
//  MutableSectionInfo.m
//  JLTableViewController
//
//  Created by Joseph Lin on 3/6/12.
//  Copyright (c) 2012 Joseph Lin. All rights reserved.
//

#import "JLSectionInfo.h"


@implementation JLSectionInfo

@synthesize objects, name;
@synthesize headerHeight;


+ (JLSectionInfo*)sectionInfoWithSectionInfo:(id <NSFetchedResultsSectionInfo>)theSectionInfo
{
    JLSectionInfo* sectionInfo = [[JLSectionInfo alloc] init];
    sectionInfo.objects = [NSMutableArray arrayWithArray:theSectionInfo.objects];
    sectionInfo.name = theSectionInfo.name;
    return sectionInfo;
}

- (NSUInteger)numberOfObjects
{
    return [self.objects count];
}

- (NSString*)indexTitle
{
    if ( [self.name length] > 0 )
        return [self.name substringToIndex:1];
    else
        return @"";
}



@end
