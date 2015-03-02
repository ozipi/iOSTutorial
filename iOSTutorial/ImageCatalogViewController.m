//
//  ImageCatalogViewController.m
//  iOSTutorial
//
//  Created by ozipi on 2/27/15.
//  Copyright (c) 2015 omar. All rights reserved.
//

#import "ImageCatalogViewController.h"
#import "RESTManager.h"

@interface ImageCatalogViewController ()

@end

@implementation ImageCatalogViewController
@synthesize tblImages, arrImages, dictProvider;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [tblImages setDataSource:self];
    [tblImages setDelegate:self];
    [self loadImages];
    // Do any additional setup after loading the view from its nib.
}

-(void) loadImages
{
    NSLog(@"ask");
    [RESTManager getProducts:@"all" toCallBack:^(id result) {
        NSLog(@"all products %@", result);
        arrImages = [[NSMutableArray alloc] init];
        for (NSMutableDictionary * dictProduct in [[result objectForKey:@"foods"][0] objectForKey:@"foods"]) {
            NSLog(@"Picture: %@", [dictProduct objectForKey:@"picture"]);
            if ([dictProduct objectForKey:@"picture"] != nil) {
                [arrImages addObject:dictProduct];
            }
        }
        
        [tblImages reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrImages count];
    //return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"CellImage";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell = nil;
    if (cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    NSMutableDictionary * dictImage = [arrImages objectAtIndex:indexPath.row];
    [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.textLabel.text = [dictImage objectForKey:@"name"];
    
    UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[dictImage objectForKey:@"picture_thumb"]]]];
    [cell.imageView setImage:img];
    return cell;
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
