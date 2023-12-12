//
//  TableViewController.m
//  HJRichTableViewCells
//
//  Created by 何静 on 2023/12/11.
//所有适用列表继承自HJRichBaseTableViewController,然后初始化列表数据self.dataList就可以了

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addData];
}
- (void)addData {
    SettingModel *set0 = [SettingModel settingModelWithType:AccessoryTypeArrow icon:@"aa" text:@"通用" detailText:@"" imgName:@"arrow" destinationVC:TableViewController.class];
    SettingModel *set1 = [SettingModel settingModelWithType:AccessoryTypeSwith icon:@"aa" text:@"飞行模式" status:NO block:^(SettingModel * _Nonnull model) {
        model.status = !model.status;
        NSLog(@"%@-%d",model.text,model.status);
    }];
    
    SettingModel *set12 = [SettingModel settingModelWithType:AccessoryTypeSwith icon:@"aa" text:@"通知" status:YES block:^(SettingModel * _Nonnull model) {
        model.status = !model.status;
        NSLog(@"%@-%d",model.text,model.status);
    }];
    SettingModel *set11 = [SettingModel settingModelWithType:AccessoryTypeDefault icon:@"aa" text:@"民族"  detailText:@"汉" block:^(SettingModel * _Nonnull model) {
        NSLog(@"弹框处理");
    }];
    SettingModel *set13 = [SettingModel settingModelWithType:AccessoryTypeArrow icon:@"aa" text:@"介绍" detailText:@"详情" imgName:@"arrow" destinationVC:TableViewController.class];
    
    SettingModel *set20 = [SettingModel settingModelWithType:AccessoryTypeArrow icon:@"" text:@"关于" detailText:@"" imgName:@"arrow" destinationVC:TableViewController.class];
    
    [self.dataList addObject:@[set0,set1]];
    [self.dataList addObject:@[set11,set12,set13]];
    [self.dataList addObject:@[set20]];
}


@end
