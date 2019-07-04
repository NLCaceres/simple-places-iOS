//
//  DetailViewController.m
//  Lab7
//
//  Created by Nicholas Caceres on 11/27/15.
//  Copyright (c) 2015 Nicholas Caceres. All rights reserved.
//

#import "DetailViewController.h"
#import "CollectionViewController.h"
#import "PlacesModel.h"

@interface DetailViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *placeWebView;

@property (strong, nonatomic) NSDictionary *placeDictionary;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = [self.placeDictionary valueForKey:kName];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    NSURL *url = [NSURL URLWithString: [self.placeDictionary valueForKey: kWebsite]];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    [self.placeWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setPlaceDict:(NSDictionary *)placeDict {
    
    NSString *Name = [placeDict valueForKey:kName];
    NSString *Website = [placeDict valueForKey:kWebsite];
    self.placeDictionary = [[NSDictionary alloc] initWithObjectsAndKeys: Name, kName,Website,kWebsite, nil];
}

// Originally issue was that it was practically invisible.
- (void) webViewDidStartLoad: (UIWebView *) webView {
    [self.activityIndicator startAnimating];
}

- (void) webViewDidFinishLoad: (UIWebView *) webView {
    [self.activityIndicator stopAnimating];
}

- (void) webView: (UIWebView *) webView didFailLoadWithError:(NSError *)error {
    [self.activityIndicator stopAnimating];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
