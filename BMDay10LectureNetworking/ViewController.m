//
//  ViewController.m
//  BMDay10LectureNetworking
//
//  Created by Kunwardeep Gill on 2015-04-17.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.APILogin = @"o_75n03ibmkm";
  self.APIKey = @"R_759990dc73d540e5bb6e4f001ff5d8f4";
  self.longURL = @"http://rypress.com/tutorials/objective-c/index";
  self.requestString = [NSString stringWithFormat:@"http://api.bit.ly/shorten?version=2.0.1&longUrl=%25@&login=%25@&apiKey=%25@&format=json", self.longURL, self.APILogin, self.APIKey];
  NSURL *requestURL = [NSURL URLWithString:self.requestString];
  NSURLSession *session = [NSURLSession sharedSession];
  
  [[session dataTaskWithURL:requestURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    //This is a code block where we will be doing the following:
    //handle errors
    NSError *e = nil;
    NSLog(@"%@",data);
    NSDictionary *bitlyJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&e];
    NSLog(@"%@", bitlyJSON);
    if(!error){
      NSDictionary *results = [bitlyJSON objectForKey:@"results"];
      NSDictionary *resultsForLongURL = [results objectForKey:self.longURL];
      NSString *shortURL = [resultsForLongURL objectForKey:@"shortUrl"];
      NSLog(@"The short URL = %@", shortURL);
    }
    //parse JSON
    //return JSON Value
  }]resume];
  sleep(60);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
