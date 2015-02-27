//
//  ProductDetailViewController.h
//  iOSTutorial
//
//  Created by ozipi on 2/26/15.
//  Copyright (c) 2015 omar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel * lblProductName;
@property (nonatomic, strong) IBOutlet UITextView * txtProductDescription;
@property (nonatomic, strong) IBOutlet UILabel * lblCategory;
@property (nonatomic, strong) NSMutableDictionary * dictProduct;
@end
