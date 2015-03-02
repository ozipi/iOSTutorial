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
@synthesize progressHud;
@synthesize productDetailViewController;
@synthesize imageCatalogViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"Catalogo..."];
    
    progressHud = [JGProgressHUD progressHUDWithStyle:(JGProgressHUDStyleExtraLight)];
    [[progressHud textLabel] setText:@"Loading service"];
    
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
    [progressHud showInView:[self view] animated:YES];
    [RESTManager sendData:nil toService:@"products" withMethod:@"GET" isTesting:NO withAccessToken:token toCallBack:^(id result){
        NSLog(@"rechult %@", result);
        arrProducts = result;
        [tblProducts reloadData];
        [progressHud dismissAnimated:YES];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary * dictProduct = [arrProducts objectAtIndex:indexPath.row];
    
    productDetailViewController = [[ProductDetailViewController alloc] init];
    productDetailViewController.dictProduct = dictProduct;
    [self.navigationController pushViewController:productDetailViewController animated:YES];
}

-(void)doShowImageCatalog:(id)sender
{
    NSLog(@"nox");
    imageCatalogViewController = [[ImageCatalogViewController alloc] init];
    [self.navigationController pushViewController:imageCatalogViewController animated:YES];
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
