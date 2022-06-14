public extension UIDevice {

    static let deviceId: String = {
        if let id = A0SimpleKeychain().string(forKey: "DEVICE_ID") {
            return id
        }
        let uuidString = UUID().uuidString
        if A0SimpleKeychain().setString(uuidString, forKey: "DEVICE_ID") {
            return uuidString
        }
        return current.identifierForVendor!.uuidString
    }()
   
    var deviceScreenWidth: CGFloat {
        let screenSize: CGRect = UIScreen.main.bounds
        let width = screenSize.width;
        return width
    }
    
    var deviceScreenHeight: CGFloat {
        let screenSize: CGRect = UIScreen.main.bounds
        let height = screenSize.height;
        return height
    }
    
    var isIPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    
    var isIPad: Bool {
        return UIDevice().userInterfaceIdiom == .pad
    }
    
    enum ScreenType: String {
        case iPhones_4_4S
        case iPhones_5_5s_5c_SE1st
        case iPhones_6_6s_7_8_SE2nd_SE3rd
        case iPhones_6Plus_6sPlus_7Plus
        case iPhones_8Plus
        case iPhones_X_XS_11Pro
        case iPhone_12mini_13mini
        case iPhones_XR_11
        case iPhones_XSMax_11ProMax
        case iPhones_12_12Pro_13_13Pro
        case iPhones_12ProMax_13ProMax
        case Unknown
    }
    
    var screenType: ScreenType? {
        guard isIPhone else { return nil }
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhones_4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE1st
        case 1334:
            return .iPhones_6_6s_7_8_SE2nd_SE3rd
        case 2208:
            return .iPhones_6Plus_6sPlus_7Plus
        case 1920:
            return .iPhones_8Plus
        case 2436:
            return .iPhones_X_XS_11Pro
        case 2340:
            return .iPhone_12mini_13mini
        case 1792:
            return .iPhones_XR_11
        case 2688:
            return .iPhones_XSMax_11ProMax
        case 2532:
            return .iPhones_12_12Pro_13_13Pro
        case 2778:
            return .iPhones_12ProMax_13ProMax
        default:
            return nil
        }
    }
    
    // helper funcs
    static func isScreen35inch() -> Bool {
        return UIDevice().screenType == .iPhones_4_4S
    }
    
    static func isScreen4inch() -> Bool {
        return UIDevice().screenType == .iPhones_5_5s_5c_SE1st
    }
    
    static func isScreen47inch() -> Bool {
        return UIDevice().screenType == .iPhones_6_6s_7_8_SE2nd_SE3rd
    }
    
    static func isScreen55inch() -> Bool {
        return UIDevice().screenType == .iPhones_6Plus_6sPlus_7Plus || UIDevice().screenType == .iPhones_8Plus
    }
    
    static func isScreen585inch() -> Bool {
        return UIDevice().screenType == .iPhones_X_XS_11Pro
    }
    
    static func isScreen646inch() -> Bool {
        return UIDevice().screenType == .iPhones_XSMax_11ProMax
    }
    
    static func isScreen606inch() -> Bool {
        return UIDevice().screenType == .iPhones_12_12Pro_13_13Pro
    }
    
    static func isScreen668inch() -> Bool {
        return UIDevice().screenType == .iPhones_12ProMax_13ProMax
    }
}
