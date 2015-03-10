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

-(void) loadFromURL:(NSURL*) url;
-(void)addCaption:(NSString*)caption startTime:(NSNumber*)start endTime:(NSNumber*) end;

-(NSDictionary*)getCaption:(int)i;
-(NSMutableArray*)getCaptions;

@end
