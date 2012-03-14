//
//  BasicCellObject.h
//  JLTableViewController
//
//  Created by Joseph Lin on 3/9/12.
//  Copyright (c) 2012 Joseph Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface DefaultCellObject : NSObject

@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) NSString* detailText;
@property (nonatomic, strong) NSString* imageName;
@property (nonatomic, strong) void (^action)(void);

@property (nonatomic, strong) UIView* accessoryView;
@property (nonatomic) UITableViewCellAccessoryType accessoryType;

@property (nonatomic, strong) NSString* cellIdentifier;
@property (nonatomic) UITableViewCellStyle cellStyle;

@property (nonatomic, readonly) UITableViewCellSelectionStyle selectionStyle;
@property (nonatomic, strong) UIFont* textFont;
@property (nonatomic, strong) UIFont* detailTextFont;
@property (nonatomic, strong) UIColor* textColor;
@property (nonatomic, strong) UIColor* detailTextColor;

+ (id)objectWithText:(NSString*)text detailText:(NSString*)detailText imageName:(NSString*)imageName accessoryType:(UITableViewCellAccessoryType)accessoryType action:(void (^)(void))action;

@end
