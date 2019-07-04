//
//  PlacesModel.h
//  Lab7
//
//  Created by Nicholas Caceres on 11/27/15.
//  Copyright (c) 2015 Nicholas Caceres. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const kName = @"name";
static NSString * const kImage = @"image";
static NSString * const kWebsite = @"website";

@interface PlacesModel : NSObject

// class methods
+ (instancetype) sharedModel;

// public methods
- (NSUInteger) numberOfPlaces;
- (NSDictionary *) placeAtIndex: (NSUInteger) index;

@end
