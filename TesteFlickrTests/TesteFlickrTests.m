//
//  TesteFlickrTests.m
//  TesteFlickrTests
//
//  Created by pedro  paulo on 3/12/14.
//  Copyright (c) 2014 pedro paulo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YMViewController.h"

@interface TesteFlickrTests : XCTestCase
    @property YMViewController *vc;
    @property NSString *searchText;
@end

@implementation TesteFlickrTests

- (void)setUp
{
    [super setUp];
    self.vc = [[YMViewController alloc] init];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testConnection{
    XCTAssertNoThrowSpecific([self.vc searchFlickrPhotos:@"p"], NSException, @"erro");
}

-(void) testSearchString{
    NSString *searchString = [self.vc getUrlSearchString:@"bikini"];
    NSString *urlSrtring = [NSString stringWithFormat:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=bikini&per_page=30&format=json&nojsoncallback=1", self.vc.flickrKey];
    XCTAssertTrue([searchString isEqualToString:urlSrtring], @"incorrect search string");
}

-(void) testConnectionToFlickr{
    
    XCTAssertNoThrow([self.vc connect:[self.vc getUrlSearchString:@"bikini"]], @"conexao levantou excecao");
    XCTAssertNotNil([self.vc connect:[self.vc getUrlSearchString:@"bikini"]], @"conexao devolvendo nulo");
    XCTAssertNotNil([self.vc connect:[self.vc getUrlSearchString:nil]], @"conexao devolvendo nulo");
}



@end
