//
//  CollectionViewCell.m
//  Lab7
//
//  Created by Nicholas Caceres on 11/26/15.
//  Copyright (c) 2015 Nicholas Caceres. All rights reserved.
//

#import "CollectionViewCell.h"
#import "PlacesModel.h"
#import "CollectionViewController.h"

@interface CollectionViewCell ()
// IBOutlets
@property (weak, nonatomic) IBOutlet UIImageView *placeImageView;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

@end

@implementation CollectionViewCell

- (void) setUpCell:(NSMutableDictionary *) placeDictionary {
    
    // Set up the image in the cell
    NSString *imageFileName = [placeDictionary valueForKey:kImage];
    self.placeImageView.image = [UIImage imageNamed:imageFileName];
    
    // Set up the label for the cell
    NSString *placeName = [placeDictionary valueForKey:kName];
    self.placeLabel.text = placeName;
}

@end
