//
//  SettingModel.m
//  HJRichTableViewCells
//
//  Created by 何静 on 2023/12/11.
//

#import "SettingModel.h"



@implementation SettingModel
+(instancetype)settingModelWithType:(AccessoryType)type icon:(NSString *)icon text:(NSString *)text detailText:(NSString *)detailText imgName:(NSString *)imgName status:(BOOL)status destinationVC:(Class)destinationVC block:(OptionBlock)block {
    SettingModel *model = [[SettingModel alloc] init];
    model.icon = icon;
    model.text = text;
    model.type = type;
    model.detailText = detailText;
    model.imgName = imgName;
    model.status = status;
    model.destinationVC = destinationVC;
    model.block = block;
    return model;
}

+(instancetype)settingModelWithType:(AccessoryType)type icon:(NSString *)icon text:(NSString *)text detailText:(NSString *)detailText {
    SettingModel *model = [[SettingModel alloc] init];
    model.icon = icon;
    model.type = type;
    model.text = text;
    model.detailText = detailText;
    return model;
}

//右边是支持点击的文本
+(instancetype)settingModelWithType:(AccessoryType)type icon:(NSString *)icon text:(NSString *)text detailText:(NSString *)detailText block:(OptionBlock)block {
    SettingModel *model = [self settingModelWithType:type icon:icon text:text detailText:detailText];
    model.block = block;
    return model;
}

//右边是箭头
+(instancetype)settingModelWithType:(AccessoryType)type icon:(NSString *)icon text:(NSString *)text detailText:(NSString *)detailText imgName:(NSString *)imgName destinationVC:(Class)destinationVC {
    SettingModel *model = [self settingModelWithType:type icon:icon text:text detailText:detailText];
    model.imgName = imgName;
    model.destinationVC = destinationVC;
    return model;
}
//右边是开关
+(instancetype)settingModelWithType:(AccessoryType)type icon:(NSString *)icon text:(NSString *)text status:(BOOL)status block:(OptionBlock)block {
    SettingModel *model = [self settingModelWithType:type icon:icon text:text detailText:@"" block:block];
    model.status = status;
    return model;
}
@end
