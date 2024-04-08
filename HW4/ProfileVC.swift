import UIKit

class ProfileVC: UIViewController {

    lazy var logo : UIImageView = {
        $0.frame = CGRect(x: 30, y: 50, width: view.frame.width - 60, height: 76)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView(image: .logo))
        
    lazy var avatar : UIImageView = {
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
        $0.contentMode = .scaleAspectFill
        $0.image = .prettyGirl
        return $0
    }(UIImageView(frame: CGRect(x: 30, y: logo.frame.maxY + 20, width: view.frame.width - 60, height: 392)))
    
    lazy var socialMediaArray : [UIButton] = [
        AppUI.createMediaButton(withImage: .instagram, action: " Instagram", bgColor: .black, cornerRadius: 17),
        AppUI.createMediaButton(withImage: .tikTok, action: "Tik-Tok", bgColor: .black, cornerRadius: 17),
        AppUI.createMediaButton(withImage: .vk, action: "VK", bgColor: .black, cornerRadius: 17),
        AppUI.createMediaButton(withImage: .tg, action: "Telegram", bgColor: .black, cornerRadius: 17)
    ]
    
    lazy var socialMediaStack : UIStackView = {
        $0.frame.origin = CGPoint(x: 31, y: 28)
        $0.frame.size = CGSize(width: avatar.frame.width - 206, height: 34)
        $0.layer.cornerRadius = 30
        
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 12
        $0.distribution = .fillEqually
        
        for el in socialMediaArray { $0.addArrangedSubview(el) }
        return $0
    }(UIStackView())
    
    let moreInfoConfig = {
        var imgConfig = UIImage.SymbolConfiguration(pointSize: 30)
        var btnConfig = UIButton.Configuration.plain()
        btnConfig.image = UIImage(systemName: "ellipsis", withConfiguration: imgConfig)
        return btnConfig
    }
    
    lazy var moreInfo : UIButton = {
        $0.frame.origin = CGPoint(x: socialMediaStack.frame.maxX + 89, y: 21)
        $0.frame.size = CGSize(width: 49, height: 49)
        $0.tintColor = .white
        return $0
    }(UIButton(configuration: moreInfoConfig(), primaryAction: UIAction(handler: { _ in
        print("More info about profile")
    })))
    
    lazy var nameSurnameLabel : UILabel = {
        $0.text = "Alexandra Gradova"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(900))
        
        let textSize = $0.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 24))
        $0.frame.size = CGSize(width: textSize.width, height: 24)
        
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        return $0
    }(UILabel())
    
    lazy var isPageVerifiedIcon : UIImageView = { return $0 }(UIImageView(image: .quality))
    
    // смог сделать стек с изменяющейся в зависимости от длины лейбла шириной
    lazy var nameAndStatusStack : UIStackView = {
        $0.frame.size = CGSize(width: nameSurnameLabel.frame.width + 29, height: 29)
        
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fill
        return $0
    }(UIStackView(arrangedSubviews: [nameSurnameLabel, isPageVerifiedIcon]))
    
    lazy var ageLabel :  UILabel = {
        $0.text = "19 лет"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16)
        return $0
    }(UILabel())
    
    lazy var userDataStack : UIStackView = {
        // почему нельзя инициализировать высоту стека так: avatar.frame.maxY - 51?
        $0.frame.origin = CGPoint(x: 31, y: socialMediaStack.frame.maxY + 236)
        $0.frame.size = CGSize(width: nameAndStatusStack.frame.width, height: 48)
        
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fill
        
        return $0
    }(UIStackView(arrangedSubviews: [nameAndStatusStack, ageLabel]))
    
    lazy var discardButton : UIButton = AppUI.createManageButton(
        withImage: .close,
        action: "Discard profile",
        size: CGRect(x: 30, y: avatar.frame.maxY + 28, width: 65, height: 65),
        bgColor: .appWhite,
        tintColor: .black)
    
    lazy var acceptButton : UIButton = AppUI.createManageButton(
        withImage: .heart,
        action: "Like profile",
        size: CGRect(x: messageButton.frame.maxX + 17, y: avatar.frame.maxY + 28, width: 65, height: 65),
        bgColor: .appWhite,
        tintColor: .red)
        
    lazy var messageButton : UIButton = {
        $0.frame.origin = CGPoint(x: discardButton.frame.maxX + 16, y: avatar.frame.maxY + 36)
        $0.frame.size = CGSize(width: view.frame.width - 220, height: 50)
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .appGreen
        $0.setTitle("Написать", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return $0
    }(UIButton(primaryAction: UIAction(handler: {_ in 
        print("Write some message")
    })))

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [logo, avatar, socialMediaStack, discardButton, messageButton, acceptButton].forEach { view.addSubview($0) }
        [socialMediaStack, moreInfo, userDataStack].forEach { avatar.addSubview($0) }
    }
}
