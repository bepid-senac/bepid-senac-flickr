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
    self.searchText = @"bikini";
    
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
    NSString *searchString = [self.vc getUrlSearchString:self.searchText];
    NSString *urlSrring = [NSString stringWithFormat:@""];
    XCTAssertTrue([searchString isEqualToString:@""], @"incorrect search string");
}



@end
