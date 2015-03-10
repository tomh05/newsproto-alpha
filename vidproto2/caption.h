//
//  caption.h
//  vidproto2
//
//  Created by Tom Howe on 09/03/2015.
//  Copyright (c) 2015 Tom Howe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface caption : NSObject

@property (nonatomic) int start;
@property (nonatomic) int end;
@property (nonatomic) NSString* body;

-(id)init;

@end
