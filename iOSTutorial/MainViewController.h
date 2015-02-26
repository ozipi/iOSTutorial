//
//  MainViewController.h
//  iOSTutorial
//
//  Created by Omar Guzmán on 2/24/15.
//  Copyright (c) 2015 omar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESTManager.h"

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, atomic) IBOutlet UITableView * tblProducts;
@property (strong, atomic) NSMutableArray * arrProducts;
@property (strong, atomic) NSString * token;
@end

