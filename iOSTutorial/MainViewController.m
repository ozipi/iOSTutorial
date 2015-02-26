//
//  MainViewController.m
//  iOSTutorial
//
//  Created by Omar Guzmán on 2/24/15.
//  Copyright (c) 2015 omar. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize tblProducts;
@synthesize arrProducts;
@synthesize token;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"Catalogo..."];
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary * dictUser = [defaults objectForKey:@"userInfo"];
    token = [dictUser objectForKey:@"access_token"];
    
    [tblProducts setDelegate:self];
    [tblProducts setDataSource:self];
    [self doCallProductsService];
}

-(void)doCallProductsService
{
    arrProducts = [[NSMutableArray alloc] init];
    [RESTManager sendData:nil toService:@"products" withMethod:@"GET" isTesting:NO withAccessToken:token toCallBack:^(id result){
        NSLog(@"rechult %@", result);
        arrProducts = result;
        [tblProducts reloadData];
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
    return [arrProducts count];
    //return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"CellProduct";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    NSMutableDictionary * dictProduct = [arrProducts objectAtIndex:indexPath.row];
    [[cell textLabel] setTextColor:[UIColor colorWithRed:95.0f/255.0 green:95.0f/255.0 blue:95.0f/255 alpha:1.0f]];
    //cell.textLabel.text = @"Producto...";
    cell.textLabel.text = [dictProduct objectForKey:@"description"];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

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
