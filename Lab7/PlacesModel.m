//
//  PlacesModel.m
//  Lab7
//
//  Created by Nicholas Caceres on 11/27/15.
//  Copyright (c) 2015 Nicholas Caceres. All rights reserved.
//

#import "PlacesModel.h"

@interface PlacesModel ()
// private array
@property (strong, nonatomic) NSMutableArray *places;
@end

@implementation PlacesModel

+ (instancetype) sharedModel {
    
    static PlacesModel *_sharedModel = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // code to be executed once - thread safe version
        _sharedModel = [[self alloc] init];
    });
    return _sharedModel;
}

- (id) init {
    self = [super init];
    if (self) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Places" ofType:@"plist"];
        
        _places = [ [NSMutableArray alloc] initWithContentsOfFile:path];
        
        if (!_places)
        {
            
            NSDictionary *place1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"California Science Center", kName, @"california_science_center.jpg", kImage, @"http://californiasciencecenter.org", kWebsite, nil];
            NSDictionary *place2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Dodger Stadium", kName, @"dodger_stadium.jpg", kImage, @"losangeles.dodgers.mlb.com/la/ballpark", kWebsite, nil];
            NSDictionary *place3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Griffith Observatory", kName, @"griffith_observatory.jpg", kImage, @"http://www.griffithobservatory.org", kWebsite, nil];
            NSDictionary *place4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Disneyland", kName, @"disneyland.jpg", kImage, @"http://disneyland.disney.go.com", kWebsite, nil];
            NSDictionary *place5 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Six Flags Magic Mountain", kName, @"six_flags_magic_mountain.jpg", kImage, @"http://www.sixflags.com/magicmountain", kWebsite, nil];
            NSDictionary *place6 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Universal Studios", kName, @"universal_studios.jpg", kImage, @"www.universalstudioshollywood.com", kWebsite, nil];
            
            _places = [[NSMutableArray alloc] initWithObjects:place1, place2, place3, place4, place5, place6, nil];
        }
    }
    return self;
}

- (NSUInteger) numberOfPlaces {
    
    return [self.places count];
    
}

- (NSDictionary *) placeAtIndex: (NSUInteger)index {
    
    return [self.places objectAtIndex: index];
    
}

@end
