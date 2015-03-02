//
//  MainViewController.h
//  iOSTutorial
//
//  Created by Omar Guzmán on 2/24/15.
//  Copyright (c) 2015 omar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESTManager.h"
#import <JGProgressHUD.h>
#import "ProductDetailViewController.h"
#import "ImageCatalogViewController.h"

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView * tblProducts;
//@property (strong, nonatomic) IBOutlet UIButton * btnCatalog;
@property (strong, nonatomic) NSMutableArray * arrProducts;
@property (strong, nonatomic) NSString * token;
@property (nonatomic, strong) JGProgressHUD * progressHud;
@property (nonatomic, strong) ProductDetailViewController * productDetailViewController;
@property (nonatomic, strong) ImageCatalogViewController * imageCatalogViewController;

-(IBAction)doShowImageCatalog:(id)sender;
@end

