//
//  Setting.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/17.
//

import UIKit

struct SettingSection: Hashable {
    let items: [SettingItem]
}

enum SettingItem: Hashable {
    case mode(ModeSetting)
    case share(ShareSetting)
}

enum ModeSetting: CaseIterable {
    case doNotDisturb
    case sleep
    case work
    case privateTime
    
    var title: String {
        switch self {
        case .doNotDisturb:     return "방해 금지 모드"
        case .sleep:            return "수면"
        case .work:             return "업무"
        case .privateTime:      return "개인 시간"
        }
    }
    
    var subTitle: String? {
        switch self {
        case .work:             return "09:00 ~ 06:00"
        default:                return nil
        }
    }
    
    var trailingText: String? {
        switch self {
        case .doNotDisturb:     return "켬"
        case .privateTime:      return "설정"
        default:                return nil
        }
    }
    
    var imgae: UIImage? {
        switch self {
        case .doNotDisturb:     return UIImage(systemName: "moon.fill")
        case .sleep:            return UIImage(systemName: "bed.double.fill")
        case .work:             return UIImage(systemName: "iphone")
        case .privateTime:      return UIImage(systemName: "person.fill")
        }
    }
    
    var imageTintColor: UIColor {
        switch self {
        case .doNotDisturb:     return .systemPurple
        case .sleep:            return .systemOrange
        case .work:             return .systemGreen
        case .privateTime:      return .systemBlue
        }
    }
}

enum ShareSetting: CaseIterable {
    case allDevice
    
    var title: String? {
        switch self {
        case .allDevice:        return "모든 기기에서 공유"
        }
    }
}
