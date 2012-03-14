//
//  MutableSectionInfo.h
//  JLTableViewController
//
//  Created by Joseph Lin on 3/6/12.
//  Copyright (c) 2012 Joseph Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface JLSectionInfo : NSObject <NSFetchedResultsSectionInfo>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *objects;
@property (nonatomic, readonly) NSString *indexTitle;
@property (nonatomic, readonly) NSUInteger numberOfObjects;

@property (nonatomic) CGFloat headerHeight;

+ (JLSectionInfo*)sectionInfoWithSectionInfo:(id <NSFetchedResultsSectionInfo>)theSectionInfo;

@end
