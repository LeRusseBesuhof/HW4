import Foundation
import UIKit

class AppUI {
    static func createMediaButton(withImage img: UIImage, action: String) -> UIButton {
        {
            $0.layer.cornerRadius = 17
            $0.clipsToBounds = true
            $0.backgroundColor = .black
            $0.setBackgroundImage(img, for: .normal)
            return $0
        }(UIButton(primaryAction: UIAction(handler: { _ in
            print("Open \(action) profile")
        })))
    }
    
    static func createManageButton(withImage img: UIImage, action: String, size: CGRect, tintColor: UIColor) -> UIButton {
        {
            $0.layer.cornerRadius = 35
            $0.backgroundColor = .appWhite
            $0.tintColor = tintColor
            $0.frame = size
            $0.setImage(img, for: .normal)
            return $0
        }(UIButton(primaryAction: UIAction(handler: { _ in
            print("\(action)")
        })))
    }
}

