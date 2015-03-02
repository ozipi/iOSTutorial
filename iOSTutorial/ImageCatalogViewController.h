//
//  ImageCatalogViewController.h
//  iOSTutorial
//
//  Created by ozipi on 2/27/15.
//  Copyright (c) 2015 omar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCatalogViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView * tblImages;
@property (nonatomic, strong) NSMutableArray * arrImages;
@property (nonatomic, strong) NSMutableDictionary  * dictProvider;
@end
