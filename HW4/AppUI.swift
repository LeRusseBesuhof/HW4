import Foundation
import UIKit

class AppUI {
    static func createMediaButton(withImage img: UIImage? = nil, action: String, size: CGRect? = nil, bgColor: UIColor, cornerRadius: CGFloat) -> UIButton {
        {
            $0.layer.cornerRadius = cornerRadius
            $0.clipsToBounds = true
            $0.backgroundColor = bgColor
            if let rect = size { $0.frame = rect }
            if let img = img { $0.setBackgroundImage(img, for: .normal) }
            return $0
        }(UIButton(primaryAction: UIAction(handler: { _ in
            print("Open \(action) profile")
        })))
    }
    
    static func createManageButton(withImage img: UIImage, action: String, size: CGRect, bgColor: UIColor, tintColor: UIColor) -> UIButton {
        {
            $0.layer.cornerRadius = 35
            $0.backgroundColor = bgColor
            $0.tintColor = tintColor
            $0.frame = size
            $0.setImage(img, for: .normal)
            return $0
        }(UIButton(primaryAction: UIAction(handler: { _ in
            print("\(action)")
        })))
    }
}

