//
//  CollectionViewController.m
//  Lab7
//
//  Created by Nicholas Caceres on 11/26/15.
//  Copyright (c) 2015 Nicholas Caceres. All rights reserved.
//

#import "CollectionViewController.h"
#import "PlacesModel.h"
#import "CollectionViewCell.h"
#import "DetailViewController.h"

@interface CollectionViewController () 
@property (strong, nonatomic) PlacesModel *placeSet;
@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    self.placeSet = [PlacesModel sharedModel];
    self.navigationController.navigationBar.topItem.title = @"Los Angeles Sightseeing";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"detailWebView"]) {
        
        NSArray *arrayOfIndexPath = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath *chosenIndexPath = arrayOfIndexPath.firstObject;
        NSUInteger indexRow = chosenIndexPath.row;
        NSLog(@"%lu", indexRow);
        
        DetailViewController *detailVC = segue.destinationViewController;
        [detailVC setPlaceDict:[self.placeSet placeAtIndex:chosenIndexPath.row]];
    }
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    // placeSet is the data model class with the following public method to set up the Collection View
    return [self.placeSet numberOfPlaces];
}

- (CollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Place"
                                  forIndexPath:indexPath];
    
    NSDictionary *placeSetUp = [self.placeSet placeAtIndex:indexPath.row];
    [cell setUpCell: placeSetUp];
    
    return cell;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *) [self.collectionView collectionViewLayout];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        UIInterfaceOrientation orientation = UIApplication.sharedApplication.statusBarOrientation;
        if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
        {
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        }
        else
        {
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        }
    } completion:nil];
    
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
