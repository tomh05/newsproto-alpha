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
   
   self.chapters = [[NSMutableArray alloc] init];
   NSLog(@"Loading from URL %@",url);
   
   NSString *jsonString = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
   NSError *e = nil;
   NSDictionary *parsedJson = [NSJSONSerialization JSONObjectWithData: [jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&e];
            NSLog(@"JSON Parsed%@",parsedJson);
   if (parsedJson) {
         NSLog(@"JSON Parsed okay: %@",parsedJson);
      // get title
      self.title = parsedJson[@"title"];
      self.chapters = parsedJson[@"chapters"];
      self.extras = parsedJson[@"extras"];
      // get captions
      //for(NSDictionary *item in parsedJson[@"chapters"]) {
      //  NSLog(@"item is %@",item);
      //   [self.captions addObject:item];
      //}
   } else {
      NSLog(@"Failed to parse JSON, %@",e);
   }
      NSLog(@"title is %@",self.title);
   NSLog(@"chapters is %@",self.chapters);
}




/*
 * old method
-(void)loadFromURL:(NSURL*)url {
   
   self.captions = [[NSMutableArray alloc] init];
   NSLog(@"Loading from URL %@",url);
    
   NSString *jsonString = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
   NSError *e = nil;
   NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: [jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&e];
   if (!jsonArray) {
      //NSLog(@"Error reading json: %a",e);
   } else {
      for(NSDictionary *item in jsonArray) {
            NSLog(@"item is %@",item);
         [self.captions addObject:item];
      }
   }
   
}
 */


@end
