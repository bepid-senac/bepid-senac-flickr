//
//  YMViewController.m
//  TesteFlickr
//
//  Created by pedro  paulo on 3/12/14.
//  Copyright (c) 2014 pedro paulo. All rights reserved.
//

#import "YMViewController.h"

@interface YMViewController ()

@end

@implementation YMViewController

NSString * const FLICKR_API_KEY = @"c560e91d3d9ed4a2483755244a0d4439";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    return [super initWithNibName:nil bundle:nil];;
}

-(id) init{
    self = [self initWithNibName:nil bundle:nil];
    if(self){
        
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [self searchFlickrPhotos:@"girls"];
}


-(void)searchFlickrPhotos:(NSString *)text{
    // Build the string to call the Flickr API
    NSString *urlString =
    [NSString stringWithFormat:
     @"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&per_page=15&format=json&nojsoncallback=1", FLICKR_API_KEY, text];
    
    // Create NSURL string from formatted string
    NSURL *url = [NSURL URLWithString:urlString];
    NSData* data = [NSData dataWithContentsOfURL:url];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSLog(@"%@", dict[@"photos"]);
    
    // Setup and start async download
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
//    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
