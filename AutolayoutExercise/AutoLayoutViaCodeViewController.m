//
//  AutoLayoutViaCodeViewController.m
//  AutolayoutExercise
//
//  Created by Nguyen Anh Viet on 9/4/15.
//  Copyright (c) 2015 NAV. All rights reserved.
//

#import "AutoLayoutViaCodeViewController.h"

@interface AutoLayoutViaCodeViewController ()

@property (nonatomic, strong) UIView* topView;
@property (nonatomic, strong) UIView* headerTableView;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIView* footerTableView;
@property (nonatomic, strong) UIView* botView;

@end

@implementation AutoLayoutViaCodeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setMainLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setMainLayout
{
    // init views
    self.topView = [[UIView alloc] init];
    [self setTopLayout];
    self.headerTableView = [[UIView alloc] init];
    [self setHeaderTableView];
    self.tableView = [[UITableView alloc] init];
    self.footerTableView = [[UIView alloc] init];
//    [self setFooterTableView];
    self.botView = [[UIView alloc] init];
//    [self setBotView];

    // set background for views
    [self.topView setBackgroundColor:[UIColor grayColor]];
    [self.headerTableView setBackgroundColor:[UIColor greenColor]];
    [self.footerTableView setBackgroundColor:[UIColor blueColor]];
    [self.botView setBackgroundColor:[UIColor grayColor]];

    // add subview
    [self.view addSubview:self.topView];
    [self.view addSubview:self.headerTableView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.footerTableView];
    [self.view addSubview:self.botView];

    // set Translates Autoresizing Mask Into Constraints
    [self.topView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.headerTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.footerTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.botView setTranslatesAutoresizingMaskIntoConstraints:NO];

    // create dictionary views
    //    NSDictionary* views = NSDictionaryOfVariableBindings(topView, headerTableView, tableView, footerTableView, botView);
    NSDictionary* views = @{ @"topView" : self.topView,
        @"headerTableView" : self.headerTableView,
        @"tableView" : self.tableView,
        @"footerTableView" : self.footerTableView,
        @"botView" : self.botView };

    // create list constraint
    NSArray* horizontalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topView]|" options:0 metrics:nil views:views];
    NSArray* horizontalConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[headerTableView]|" options:0 metrics:nil views:views];
    NSArray* horizontalConstraints3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views];
    NSArray* horizontalConstraints4 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[footerTableView]|" options:0 metrics:nil views:views];
    NSArray* horizontalConstraints5 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[botView]|" options:0 metrics:nil views:views];

    NSArray* verticalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topView(50)][headerTableView(30)][tableView]-[footerTableView(30)][botView(98)]|" options:0 metrics:nil views:views];

    // add constraint
    [self.view addConstraints:horizontalConstraints1];
    [self.view addConstraints:horizontalConstraints2];
    [self.view addConstraints:horizontalConstraints3];
    [self.view addConstraints:horizontalConstraints4];
    [self.view addConstraints:horizontalConstraints5];
    [self.view addConstraints:verticalConstraints1];
}

- (void)setTopLayout
{
    // init subviews
    UILabel* titLable = [[UILabel alloc] init];
    [titLable setText:@"Auto Layout"];

    UIButton* reloadButton = [[UIButton alloc] init];
    [reloadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [reloadButton setTitle:@"Reload" forState:UIControlStateNormal];

    UIButton* configButton = [[UIButton alloc] init];
    [configButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [configButton setTitle:@"Config" forState:UIControlStateNormal];

    // set background for subviews
    [reloadButton setBackgroundColor:[UIColor yellowColor]];
    [configButton setBackgroundColor:[UIColor yellowColor]];
    // add subview
    [self.topView addSubview:titLable];
    [self.topView addSubview:reloadButton];
    [self.topView addSubview:configButton];

    // set Translates Autoresizing Mask Into Constraints
    [titLable setTranslatesAutoresizingMaskIntoConstraints:NO];
    [reloadButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [configButton setTranslatesAutoresizingMaskIntoConstraints:NO];

    // create dictionary views
    NSDictionary* views = NSDictionaryOfVariableBindings(titLable, reloadButton, configButton);

    // create list constraint
    NSArray* horizontalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[titLable(95)]->=0-[reloadButton(65)]-20-[configButton(80)]-10-|" options:0 metrics:nil views:views];

    NSArray* verticalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[titLable]-19-|" options:0 metrics:nil views:views];
    NSArray* verticalConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[reloadButton]-10-|" options:0 metrics:nil views:views];
    NSArray* verticalConstraints3 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[configButton]-10-|" options:0 metrics:nil views:views];

    // add constraint
    [self.topView addConstraints:horizontalConstraints1];
    [self.topView addConstraints:verticalConstraints1];
    [self.topView addConstraints:verticalConstraints2];
    [self.topView addConstraints:verticalConstraints3];
}

- (void)setHeaderTableView
{
    // init subviews
    UILabel* noLable = [[UILabel alloc] init];
    [noLable setText:@"No"];
    [noLable setTextAlignment:NSTextAlignmentCenter];
    UILabel* firstnameLable = [[UILabel alloc] init];
    [firstnameLable setText:@"Firstname"];
    [firstnameLable setTextAlignment:NSTextAlignmentCenter];
    UILabel* lastnameLable = [[UILabel alloc] init];
    [lastnameLable setText:@"Lastname"];
    [lastnameLable setTextAlignment:NSTextAlignmentCenter];
    UILabel* sexLable = [[UILabel alloc] init];
    [sexLable setText:@"Sex"];
    [sexLable setTextAlignment:NSTextAlignmentCenter];
    UILabel* birthdayLable = [[UILabel alloc] init];
    [birthdayLable setText:@"Birthday"];
    [birthdayLable setTextAlignment:NSTextAlignmentCenter];

    // add subview
    [self.headerTableView addSubview:noLable];
    [self.headerTableView addSubview:firstnameLable];
    [self.headerTableView addSubview:lastnameLable];
    [self.headerTableView addSubview:sexLable];
    [self.headerTableView addSubview:birthdayLable];

    // set Translates Autoresizing Mask Into Constraints
    [noLable setTranslatesAutoresizingMaskIntoConstraints:NO];
    [firstnameLable setTranslatesAutoresizingMaskIntoConstraints:NO];
    [lastnameLable setTranslatesAutoresizingMaskIntoConstraints:NO];
    [sexLable setTranslatesAutoresizingMaskIntoConstraints:NO];
    [birthdayLable setTranslatesAutoresizingMaskIntoConstraints:NO];

    // create dictionary views
    NSDictionary* views = NSDictionaryOfVariableBindings(noLable, firstnameLable, lastnameLable, sexLable, birthdayLable);

    // create list constraint
    NSArray* horizontalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[noLable(30)][firstnameLable][lastnameLable(firstnameLable)][sexLable(50)][birthdayLable(80)]|" options:NSLayoutFormatAlignAllTop metrics:nil views:views];

    NSArray* verticalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-4-[noLable]-5-|" options:0 metrics:nil views:views];

    // add constraint
    [self.headerTableView addConstraints:horizontalConstraints1];
    [self.headerTableView addConstraints:verticalConstraints1];
}

//-(void)setFooterTableView{
//    // init subviews
//    UILabel* totalMemberLable = [[UILabel alloc] init];
//    [totalMemberLable setText:@"So Many People"];
//    [totalMemberLable setTextAlignment:NSTextAlignmentRight];
//    
//    // add subview
//    [self.headerTableView addSubview:totalMemberLable];
//    
//    // set Translates Autoresizing Mask Into Constraints
//    [totalMemberLable setTranslatesAutoresizingMaskIntoConstraints:NO];
//    
//    // create dictionary views
//    NSDictionary* views = NSDictionaryOfVariableBindings(totalMemberLable);
//    
//    // create list constraint
//    NSArray* horizontalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|->=0-[totalMemberLable(125)]|" options:NSLayoutFormatAlignAllTop metrics:nil views:views];
//    
//    NSArray* verticalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-4-[totalMemberLable]-5-|" options:0 metrics:nil views:views];
//    
//    // add constraint
//    [self.footerTableView addConstraints:horizontalConstraints1];
//    [self.footerTableView addConstraints:verticalConstraints1];
//}
//
//- (void)setBotView
//{
//    
//}

@end
