//
//  StoryModel.m
//  vidproto2
//
//  Created by Tom Howe on 06/03/2015.
//  Copyright (c) 2015 Tom Howe. All rights reserved.
//

#import "StoryModel.h"

@implementation StoryModel

- (void)addCaption:(NSString*)caption startTime:(NSNumber*)start endTime:(NSNumber*) end {

   //[self.captions addObject:@"test"];

   
}

-(void)loadFromURL:(NSURL*)url {
   
   self.captions = [[NSMutableArray alloc] init];
   NSLog(@"Loading from URL %@",url);
   // number formatter
   NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
   f.numberStyle = NSNumberFormatterDecimalStyle;
   
   NSString *jsonString = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
   NSError *e = nil;
   NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: [jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&e];
   if (!jsonArray) {
      //NSLog(@"Error reading json: %a",e);
   } else {
      for(NSDictionary *item in jsonArray) {
            NSLog(@"item is %@",item);
         //NSMutableDictionary *newItem = [[NSMutableDictionary alloc] initWithDictionary:item];
         [self.captions addObject:item];
         //newItem[@"start"] = [f numberFromString:item[@"start"]];
         //newItem[@"end"] = [f numberFromString:item[@"end"]];
         //  NSLog(@"item is %@",newItem);
         
         //[self.captions addObject:newItem];
      }
            NSLog(@"item is %@",self.captions.firstObject);
   }
   
}

- (NSDictionary*)getCaption:(int)i {
   return self.captions[i];
}

- (NSMutableArray*)getCaptions {
   return self.captions;
}
@end
