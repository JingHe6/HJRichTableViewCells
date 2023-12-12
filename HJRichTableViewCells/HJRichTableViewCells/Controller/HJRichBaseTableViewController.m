//
//  ViewController.m
//  HJRichTableViewCells
//
//  Created by 何静 on 2023/12/11.
//

#import "HJRichBaseTableViewController.h"
#import "TableViewCell.h"

@interface HJRichBaseTableViewController ()

@end

@implementation HJRichBaseTableViewController

- (instancetype)init {
    return [super initWithStyle:UITableViewStylePlain];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 50;
    if (@available(iOS 15.0, *)) {
        self.tableView.sectionHeaderTopPadding = 0;
    }
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 8, 0, 0);
    if (@available(iOS 11.0, *)) {
        self.tableView.separatorInsetReference = UITableViewSeparatorInsetFromCellEdges;
    } else {
        // Fallback on earlier versions
    }

}

- (NSMutableArray *)dataList {
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataList[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView];
    cell.data = self.dataList[indexPath.section][indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.dataList.count > 0 ? 10.0 : CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SettingModel *data = self.dataList[indexPath.section][indexPath.row];
    if (data.destinationVC) {
        HJRichBaseTableViewController *vc = [[data.destinationVC alloc] init];
        vc.navigationItem.title = data.text;
        vc.model = data;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (data.type == AccessoryTypeDefault) {
        if (data.block) {
            data.block(data);
        }
    }
}

@end
