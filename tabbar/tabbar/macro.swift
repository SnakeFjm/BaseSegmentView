//
//  macro.swift
//  tabbar
//
//  Created by Snake on 17/8/27.
//  Copyright © 2017年 Snake. All rights reserved.
//

import UIKit

let TheApp = UIApplication.shared.delegate! as! AppDelegate

// ScreenSize
let ScreenSize = UIScreen.main.bounds.size

// ScreenRate
let ScreenRate: CGFloat = (WindowWidth / 640.0)

// 屏幕宽度
let WindowWidth = UIScreen.main.bounds.size.width

// 屏幕高度
let WindowHeight = UIScreen.main.bounds.size.height

// iPhone5 屏幕宽度
let iPhone5ScreenWidth: CGFloat = 320.0

// 系统版本
let SystemVersion = (UIDevice.current.systemVersion as NSString).floatValue

// 返回导航栏高度
let NavigationBarHeight: CGFloat = ((SystemVersion >= 7.0) ? 64.0 : 44.0)
let NavigationBarWithoutStatusBarHeight: CGFloat = 44.0
let TabbarHeight: CGFloat = 50.0

// 返回状态栏高度
let StatusBarHeight = ((SystemVersion >= 7.0) ? 20.0 : 0.0)

// 返回空的Rect
let CGRect_Zero = CGRect(x: 0, y: 0, width: 0, height: 0)




// 返回RGB颜色
func RGBCOLOR (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

// 判断是否为iPad
func isIPad()-> Bool {
    return UIDevice.current.userInterfaceIdiom == .pad
}

//// 返回主线程的CoreData上下文
//func appDelegateManagedObjectContext() -> NSManagedObjectContext {
//    return (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
//}

// 根控制器
let TheRootNavigationControllrt = (TheApp.window!.rootViewController as! UINavigationController)




// 整个App的基调颜色
// 粉色
let APP_COLOR_BASE = RGBCOLOR(r: 0x31, g: 0x9B, b: 0xFE, a: 1)

// 背景色
let APP_COLOR_BACKGROUND = RGBCOLOR(r: 0xEE, g: 0xEE, b: 0xEE, a: 1)
// 蓝色
let APP_COLOR_BLUE = RGBCOLOR(r: 0x31, g:0x9B, b:0xFE, a: 1)

// 整个app的常用色

let APP_COLOR_GRAY_33 = RGBCOLOR(r: 0x33, g: 0x33, b: 0x33, a: 1)

let APP_COLOR_GRAY_66 = RGBCOLOR(r: 0x66, g: 0x66, b: 0x66, a: 1)

let APP_COLOR_GRAY_99 = RGBCOLOR(r: 0x99, g: 0x99, b: 0x99, a: 1)

let APP_COLOR_YELLOW_1 = RGBCOLOR(r: 0xFF, g: 0xCB, b: 0x62, a: 1)

let APP_COLOR_GRAY_E5 = RGBCOLOR(r: 0xE5, g: 0xE5, b: 0xE5, a: 1)


// 返回同深度的颜色
func RGBSameColor(value: CGFloat) -> UIColor {
    return RGBCOLOR(r: value, g: value, b: value, a: 1)
}
