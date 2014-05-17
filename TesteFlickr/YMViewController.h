//
//  YMViewController.h
//  TesteFlickr
//
//  Created by pedro  paulo on 3/12/14.
//  Copyright (c) 2014 pedro paulo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YMViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property NSArray *photos;
@property NSString *flickrKey;
@property int n;

-(void)searchFlickrPhotos:(NSString *)text;
-(void) trocaPhoto:(NSTimer *)timer;
-(void) showPhoto:(NSNumber *)index;
-(NSDictionary *) connect:(NSString *)urlString;
-(NSArray*) flickrDictToArray:(NSDictionary*)flickrDict;
-(NSString *) getUrlSearchString:(NSString *)searchText;
@end
