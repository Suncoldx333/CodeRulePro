//
//  MacroHeader.h
//  HelooTest
//
//  Created by ZhaoyunWang on 2018/12/12.
//  Copyright © 2018年 ZhaoyunWang. All rights reserved.
//

#ifndef MacroHeader_h
#define MacroHeader_h

#define createErrorWithDes(m) [NSError errorWithDomain:@"" code:4 userInfo:@{NSLocalizedDescriptionKey:m}]
#define getRectNavAndStatusHight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height

#define GetURLWith(tag) \
({ \
NSString *inputId = [NSString stringWithFormat:@"input = %ld",(long)tag]; \
(inputId);\
})\

#define navHeight \
({ \
CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame]; \
CGRect navRect = self.navigationController.navigationBar.frame; \
CGFloat height = statusRect.size.height + navRect.size.height;  \
(height);\
})\

#define kSafeAreaBottomPadding \
({ \
CGFloat bottomPadding = 0; \
if (@available(iOS 11.0, *)) \
bottomPadding = UIApplication.sharedApplication.keyWindow.safeAreaInsets.bottom; \
(bottomPadding); \
})\

#define pickerify(KLASS, PROPERTY) interface \
KLASS (Night) \
@property (nonatomic, copy, setter = dk_set ## PROPERTY ## Picker:) DKColorPicker dk_ ## PROPERTY ## Picker; \
@end \
@interface \
KLASS () \
@property (nonatomic, strong) NSMutableDictionary<NSString *, DKColorPicker> *pickers; \
@end \
@implementation \
KLASS (Night) \
- (DKColorPicker)dk_ ## PROPERTY ## Picker { \
return objc_getAssociatedObject(self, @selector(dk_ ## PROPERTY ## Picker)); \
} \
- (void)dk_set ## PROPERTY ## Picker:(DKColorPicker)picker { \
objc_setAssociatedObject(self, @selector(dk_ ## PROPERTY ## Picker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC); \
[self setValue:picker(self.dk_manager.themeVersion) forKeyPath:@keypath(self, PROPERTY)];\
[self.pickers setValue:[picker copy] forKey:_DKSetterWithPROPERTYerty(@#PROPERTY)]; \
} \
@end

#define __PASTE__(A,B) A##B


#endif /* MacroHeader_h */
