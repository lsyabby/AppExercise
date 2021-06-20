//
//  DetailView.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import UIKit
import SDWebImage

class DetailView: UIView {
    
    private let avatarImgView = UIImageView()
    private let nameLabel = UILabel()
    private let bioLabel = UILabel()

    private let loginLabel = UILabel()
    private let adminBtn = UIButton()

    private let locationLabel = UILabel()

    private let blogLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let avatarHeight: CGFloat = UIScreen.main.bounds.width / 2
        avatarImgView.clipsToBounds = true
        avatarImgView.layer.cornerRadius = avatarHeight / 2
        
        let line = UIView()
        line.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        
        loginLabel.textColor = .darkGray
        
        let adminBtnHeight: CGFloat = 24
        adminBtn.isEnabled = false
        adminBtn.clipsToBounds = true
        adminBtn.layer.cornerRadius = adminBtnHeight / 2
        adminBtn.backgroundColor = .systemBlue
        adminBtn.setTitle("STAFF", for: .normal)
        adminBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        let sv = UIStackView(arrangedSubviews: [ loginLabel, adminBtn ])
        sv.axis = .vertical
        sv.alignment = .leading
        sv.spacing = 5
        
        let img1 = UIImageView()
        img1.backgroundColor = .red
        let adminSV = UIStackView(arrangedSubviews: [ img1, sv ])
        adminSV.axis = .horizontal
        adminSV.alignment = .center
        adminSV.spacing = 24
        
        let img2 = UIImageView()
        img2.backgroundColor = .green
        let locationSV = UIStackView(arrangedSubviews: [ img2, locationLabel ])
        locationSV.axis = .horizontal
        locationSV.alignment = .center
        locationSV.spacing = 24
        
        let img3 = UIImageView()
        img3.backgroundColor = .cyan
        let blogSV = UIStackView(arrangedSubviews: [ img3, blogLabel ])
        blogSV.axis = .horizontal
        blogSV.alignment = .center
        blogSV.spacing = 24
        
        let imgHeight: CGFloat = 40
        [ img1, img2, img3 ].forEach {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = imgHeight / 2
        }
        
        let allSV = UIStackView(arrangedSubviews: [ adminSV, locationSV, blogSV ])
        allSV.axis = .vertical
        allSV.distribution = .fillEqually
        allSV.alignment = .leading
        allSV.spacing = 40
        
        [ avatarImgView, nameLabel, bioLabel, line, allSV ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        [
            avatarImgView.heightAnchor.constraint(equalToConstant: avatarHeight),
            avatarImgView.widthAnchor.constraint(equalTo: avatarImgView.heightAnchor),
            avatarImgView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            avatarImgView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: avatarImgView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            bioLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            line.heightAnchor.constraint(equalToConstant: 2),
            line.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 24),
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            allSV.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 35),
            allSV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            allSV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            img1.heightAnchor.constraint(equalToConstant: imgHeight),
            img1.widthAnchor.constraint(equalToConstant: imgHeight),
            img2.heightAnchor.constraint(equalToConstant: imgHeight),
            img2.widthAnchor.constraint(equalToConstant: imgHeight),
            img3.heightAnchor.constraint(equalToConstant: imgHeight),
            img3.widthAnchor.constraint(equalToConstant: imgHeight),
            
            adminBtn.heightAnchor.constraint(equalToConstant: adminBtnHeight),
            adminBtn.widthAnchor.constraint(equalToConstant: 65)
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    func setupView(detail: Detail) {
        avatarImgView.sd_setImage(with: URL(string: detail.avatarUrl), completed: nil)
        nameLabel.text = detail.name
        bioLabel.text = detail.bio ?? ""
        loginLabel.text = detail.login
        adminBtn.isHidden = !detail.isAdmin
        locationLabel.text = detail.location ?? ""
        blogLabel.text = detail.blog ?? ""
    }
}
