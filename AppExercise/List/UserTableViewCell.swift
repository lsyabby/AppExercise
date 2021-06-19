//
//  UserTableViewCell.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell {

    private let avatarImgView = UIImageView()
    private let loginLabel = UILabel()
    private let adminBtn = UIButton()
    
    // fix: abby
    var user: User? {
        didSet {
            avatarImgView.sd_setImage(with: URL(string: user?.avatarUrl ?? ""), completed: nil)
            loginLabel.text = user?.login ?? ""
            adminBtn.isHidden = !(user?.isAdmin ?? false)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
        translatesAutoresizingMaskIntoConstraints = false
        
        contentView.backgroundColor = .clear
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        
        let avatarHeight: CGFloat = 60
        avatarImgView.clipsToBounds = true
        avatarImgView.layer.cornerRadius = avatarHeight / 2
        
        loginLabel.textColor = .darkGray
        
        let adminHeigh: CGFloat = 24
        adminBtn.isEnabled = false
        adminBtn.backgroundColor = .systemBlue
        adminBtn.clipsToBounds = true
        adminBtn.layer.cornerRadius = adminHeigh / 2
        adminBtn.setTitle("STAFF", for: .normal)
        adminBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        let sv = UIStackView(arrangedSubviews: [ loginLabel, adminBtn ])
        sv.axis = .vertical
        sv.alignment = .leading
        sv.spacing = 5
        
        [
            avatarImgView.heightAnchor.constraint(equalToConstant: avatarHeight),
            avatarImgView.widthAnchor.constraint(equalTo: avatarImgView.heightAnchor),
            avatarImgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            avatarImgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            sv.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            sv.leadingAnchor.constraint(equalTo: avatarImgView.trailingAnchor, constant: 16),
            sv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            adminBtn.heightAnchor.constraint(equalToConstant: adminHeigh),
            adminBtn.widthAnchor.constraint(equalToConstant: 65)
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 2, bottom: 5, right: 2))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
