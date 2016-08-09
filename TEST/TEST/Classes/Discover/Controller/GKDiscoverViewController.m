//
//  GKDiscoverViewController.m
//  TEST
//
//  Created by 花菜ChrisCai on 2016/8/8.
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import "GKDiscoverViewController.h"
#import "GKDataModel.h"
#import "GKDiscoverViewCell.h"

@interface GKDiscoverViewController ()
/** 数据源 */
@property(nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation GKDiscoverViewController

- (instancetype)init {
    if (self = [super init]) {
        [self setupNotification];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setupNotification {
    GKLogFunc;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSaveSuccess:) name:GKDidSaveDataSuccessNotification object:nil];
}

- (void)didSaveSuccess:(NSNotification *)noti {
    [self.dataSource addObject:noti.object];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource =  [[NSMutableArray alloc] init];
        
    }
    return _dataSource;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GKDiscoverViewCell *cell = [GKDiscoverViewCell cellWithTableView:tableView];
    
    cell.dataModel = self.dataSource[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    GKDataModel * model = self.dataSource[indexPath.row];
    
    NSLog(@"%f",model.cellHeight);
    return model.cellHeight;
}



@end
