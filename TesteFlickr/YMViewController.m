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



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    return [super initWithNibName:nil bundle:nil];;
}

-(id) init{
    self = [self initWithNibName:nil bundle:nil];
    if(self){
        self.flickrKey = @"c560e91d3d9ed4a2483755244a0d4439";
        self.n = 0;
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [self searchFlickrPhotos:@"bikini"];
}

-(NSDictionary *) connect:(NSString *)urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    NSData* data = [NSData dataWithContentsOfURL:url];
    if(!data){
        return nil;
    }
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

-(NSArray*) flickrDictToArray:(NSDictionary*)flickrDict{
    if(!flickrDict){
        return nil;
    }
    return [[flickrDict objectForKey:@"photos"] objectForKey:@"photo"];
}

-(NSString *) getUrlSearchString:(NSString *)searchText{
    return [NSString stringWithFormat:
     @"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&per_page=30&format=json&nojsoncallback=1", self.flickrKey, searchText];
}

-(void)searchFlickrPhotos:(NSString *)text{
    NSString *urlString = [self getUrlSearchString:text];
    
    self.photos = [self flickrDictToArray:[self connect:urlString]];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(trocaPhoto:) userInfo:nil repeats:YES];
    
}

-(void) showPhoto:(NSNumber *)index{
    int i = [index intValue];
    if(i < [self.photos count]){
        NSDictionary *photo = [self.photos objectAtIndex:i];
        NSString *photoURLString =
        [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_b.jpg",
         [photo objectForKey:@"farm"], [photo objectForKey:@"server"],
         [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];
        NSLog(@"photoURLString: %@", photoURLString);
    
        self.imagem.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photoURLString]]];
        CABasicAnimation *a = [CABasicAnimation animationWithKeyPath:@"alpha"];
        a.fromValue = 0;
        a.toValue = [NSNumber numberWithFloat:1.0];
        a.duration = 3;
        [self.imagem.layer addAnimation:a forKey:nil];
        
    }
    else{
        self.n = 0;
    }
}

-(void) trocaPhoto:(NSTimer *)timer{
    [self performSelectorOnMainThread:@selector(showPhoto:) withObject:[NSNumber numberWithInt:self.n++] waitUntilDone:NO];
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
