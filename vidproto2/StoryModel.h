//
//  StoryModel.h
//  vidproto2
//
//  Created by Tom Howe on 06/03/2015.
//  Copyright (c) 2015 Tom Howe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryModel : NSObject


@property (nonatomic) NSMutableArray* captions;

@property (nonatomic) NSString * title;
@property (nonatomic) NSArray * chapters;
@property (nonatomic) NSDictionary *extras;

-(void) loadFromURL:(NSURL*) url;
-(void)addCaption:(NSString*)caption startTime:(NSNumber*)start endTime:(NSNumber*) end;


@end
