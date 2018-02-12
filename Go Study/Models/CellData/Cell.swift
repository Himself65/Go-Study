//
//  Cell.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/11.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import Foundation
import CoreData

enum CellStyle{
    case defaultStyle
    case switchStyle
    case textStyle
    case numberCell
}

func converToIdentifier(_ style: CellStyle) -> String {
    switch style
    {
    case .defaultStyle:
        return "defaultCell"
    case .switchStyle:
        return "switchCell"
    case .textStyle:
        return "textCell"
    case .numberCell:
        return "numberCell"
    }
}


func getSettingData() -> [[DefaultCell]] {
    var data = Array<Array<DefaultCell>>()
    var itemOne = Array<DefaultCell>()
    var itemTwo = Array<DefaultCell>()
    var itemThree = Array<DefaultCell>()
    
    let userStandard = StaticContent.userDefault
    let userName: String = userStandard.string(forKey: "userName")!
    let userAge: Int = userStandard.integer(forKey: "userAge")
    
    itemOne.append(TextCell(label: "姓名", info: "这里填入你的姓名", text: userName))
    itemOne.append(NumberCell(label: "年龄", info: "填入你的年龄", num: userAge))
    itemOne.append(SwitchCell(label: "性别", info: "是男是女", isTrue: false))
    //
    let darkTheme: Bool = userStandard.bool(forKey: "dark_theme")
    itemTwo.append(SwitchCell(label: "夜间模式", info: "神说要有夜间模式", isTrue: darkTheme))
    //
    itemThree.append(DefaultCell(label: "关于"))
    //
    data.append(itemOne)
    data.append(itemTwo)
    data.append(itemThree)
    return data
}

func getGroupData() -> [String] {
    var data = Array<String>()
    data.append("基本设置")
    data.append("个性化")
    data.append("更多")
    
    return data
}

class DefaultCell: NSObject {
    var leftLabel: String?
    var style: CellStyle?
    var moreInfo: String?
    override init() {
        super.init()
        leftLabel = "如果你看到这个说明还没有初始化"
        moreInfo = "没有什么可说"
        style = .defaultStyle
    }
    init(label: String) {
        super.init()
        leftLabel = label
        style = .defaultStyle
    }
    
    convenience init(label: String, info: String) {
        self.init(label: label)
        moreInfo = info
    }
}

class SwitchCell: DefaultCell {
    var boolValue: Bool?
    
    init(label: String, info: String, isTrue: Bool) {
        boolValue = isTrue
        super.init(label: label)
        style = .switchStyle
    }
}

class TextCell: DefaultCell {
    var textFiled: String?
    
    init(label: String, info: String, text: String) {
        super.init(label: label)
        textFiled = text
        style = .textStyle
    }
}

class NumberCell: DefaultCell {
    var number: Int?
    
    init(label: String, info: String, num: Int) {
        super.init(label: label)
        number = num
    }
}