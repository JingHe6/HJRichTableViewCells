//
//  SettingModel.h
//  HJRichTableViewCells
//
//  Created by 何静 on 2023/12/11.
//

#import <Foundation/Foundation.h>
@class SettingModel;

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    AccessoryTypeArrow,
    AccessoryTypeSwith,
    AccessoryTypeDefault
}AccessoryType;

typedef void(^OptionBlock)(SettingModel *model);

@interface SettingModel : NSObject
@property (nonatomic,copy) NSString *icon;//左边logo
@property (nonatomic,copy) NSString *text;//左边文本
@property (nonatomic,copy) NSString *detailText;//右边的文本
@property (nonatomic,copy) NSString *imgName;//右边的箭头
@property (nonatomic,assign) BOOL status;//开关状态
@property (nonatomic,assign) AccessoryType type;//cell右边的类型
@property (nonatomic,assign) Class destinationVC;//目标控制器类
@property (nonatomic,copy) OptionBlock block;//保存代码块，在合适的时候执行

/// 支持所有AccessoryType的样式
/// @param type AccessoryType
/// @param icon 左边logo
/// @param text 左边文本
/// @param detailText 右边的文本
/// @param imgName 右边的箭头
/// @param status 开关状态
/// @param destinationVC 目标控制器类
/// @param block 点击cell或者子控件时的回调
+(instancetype)settingModelWithType:(AccessoryType)type icon:(NSString *)icon text:(NSString *)text detailText:(NSString *)detailText imgName:(NSString *)imgName status:(BOOL)status destinationVC:(Class)destinationVC block:(OptionBlock)block;

//以下是简单化调用-----
//basic右边是文本
+(instancetype)settingModelWithType:(AccessoryType)type icon:(NSString *)icon text:(NSString *)text detailText:(NSString *)detailText;

//右边是文本且支持点击
+(instancetype)settingModelWithType:(AccessoryType)type icon:(NSString *)icon text:(NSString *)text detailText:(NSString *)detailText block:(OptionBlock)block;
//右边是箭头
+(instancetype)settingModelWithType:(AccessoryType)type icon:(NSString *)icon text:(NSString *)text detailText:(NSString *)detailText imgName:(NSString *)imgName destinationVC:(Class)destinationVC ;
//右边是开关
+(instancetype)settingModelWithType:(AccessoryType)type icon:(NSString *)icon text:(NSString *)text status:(BOOL)status block:(OptionBlock)block;
@end

NS_ASSUME_NONNULL_END
