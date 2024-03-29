//
//  OpTextTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit

class OpTextTableViewCell: UITableViewCell {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileNickname: UILabel!
    @IBOutlet var chatText: UILabel!
    @IBOutlet var chatView: UIView!
    
    var inputCharacter : GameCharacter?
    var delegate : ProfileImageDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
        let gesture : UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileButtonTapped))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(gesture)
        // Initialization code
    }
    @objc func profileButtonTapped(){
        if let character = inputCharacter{
            delegate?.profileImageTapped(inputCharacter: character)
        }
    }
    func designCell() {

        chatView.layer.borderWidth = 1.7
        chatView.layer.borderColor = UIColor(red: 0.707, green: 0.76, blue: 0.804, alpha: 1).cgColor
        chatView.layer.cornerRadius = 22.41
        chatView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
   
    func opTextCellUpdate(name:GameCharacterID,chat:String, normalProfile:String, mainProfile:CharacterFace, isLocked : Bool, godchat : Bool){
        switch isLocked {
        case true:
            profileNickname.text = "???"
        case false:
            profileNickname.text = name.info().name
        }
        chatText.text = chat

        switch mainProfile {
        case .none:
            profileImage.isHidden = true
            profileNickname.isHidden = true
        default:
            profileNickname.isHidden = false
            profileImage.isHidden = false
        }
        switch godchat {
        case true:
            profileNickname.textColor = .black
            backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
            chatView.layer.borderColor = UIColor(red: 0.22, green: 0.357, blue: 0.463, alpha: 1).cgColor
        case false:
            profileNickname.textColor = .white
            backgroundColor =  UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
        }
        let face = findFaceImage(nickname: name, profile: mainProfile, normalProfile: normalProfile, currentDanhee: currentMainGameDanhee())
        profileImage.image = UIImage(named: face)
    }
}
