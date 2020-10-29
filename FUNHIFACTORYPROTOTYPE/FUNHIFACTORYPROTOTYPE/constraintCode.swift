//
//  constraintCode.swift
//  FUNHIFACTORYPROTOTYPE
//
//  Created by 손영웅 on 2020/10/27.
//

import Foundation
import UIKit
func giveAll0ToView(viewA : UIView, targetView : UIView){
    viewA.translatesAutoresizingMaskIntoConstraints = false
            viewA.topAnchor.constraint(equalTo: targetView.topAnchor,constant: 0).isActive = true // ---- 1
            viewA.leftAnchor.constraint(equalTo: targetView.leftAnchor, constant: 0).isActive = true // ---- 2
            viewA.rightAnchor.constraint(equalTo: targetView.rightAnchor, constant: 0).isActive = true // ---- 3
    viewA.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: 0).isActive = true // ---- 4
}

func titleLabelConstraint(titleLabel : UIView, note : UIView){
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: note.topAnchor,constant: 14).isActive = true
    titleLabel.leftAnchor.constraint(equalTo: note.leftAnchor, constant: 0).isActive = true // ---- 2
    titleLabel.rightAnchor.constraint(equalTo: note.rightAnchor, constant: 0).isActive = true // ---- 3
}
func informationLabelConstraint(titleLabel : UIView, informationLabel : UIView, note : UIView){
    informationLabel.translatesAutoresizingMaskIntoConstraints = false
    informationLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor,constant: 1).isActive = true
    informationLabel.leftAnchor.constraint(equalTo: note.leftAnchor, constant: 0).isActive = true // ---- 2
    informationLabel.rightAnchor.constraint(equalTo: note.rightAnchor, constant: 0).isActive = true // ---- 3
    informationLabel.bottomAnchor.constraint(equalTo: note.bottomAnchor, constant: 12).isActive = true // ---- 4
}

//주석을 모아넣는 스택뷰에 사용할 코드
    //1개의 노트를 사용할 때
        func displayOneNote(noteView : UIView, topBar : UIView, exitButton : UIButton, wholeView: UIView){
            noteView.translatesAutoresizingMaskIntoConstraints = false
            noteView.topAnchor.constraint(equalTo: topBar.bottomAnchor,constant: 245).isActive = true
            noteView.bottomAnchor.constraint(equalTo: wholeView.bottomAnchor,constant: -448).isActive = true
            noteView.centerXAnchor.constraint(equalTo:wholeView.centerXAnchor).isActive = true
            noteView.heightAnchor.constraint(equalToConstant: 84).isActive = true
            noteView.widthAnchor.constraint(equalToConstant: 268).isActive = true
            
            exitButton.translatesAutoresizingMaskIntoConstraints = false
            exitButton.topAnchor.constraint(equalTo: topBar.bottomAnchor,constant: 183).isActive = true
            exitButton.rightAnchor.constraint(equalTo: wholeView.rightAnchor, constant: -33).isActive = true
        }
    //2개의 노트를 사용할 때
        func displayDoubleNote(noteView : UIView, topBar : UIView, exitButton : UIButton, wholeView: UIView){
            noteView.translatesAutoresizingMaskIntoConstraints = false
            noteView.topAnchor.constraint(equalTo: topBar.bottomAnchor,constant: 181).isActive = true
            noteView.bottomAnchor.constraint(equalTo: wholeView.bottomAnchor,constant: -312).isActive = true
            noteView.centerXAnchor.constraint(equalTo:wholeView.centerXAnchor).isActive = true
            noteView.frame = CGRect(x: 0, y: 0, width: 268, height: 201)
            
            exitButton.translatesAutoresizingMaskIntoConstraints = false
            exitButton.topAnchor.constraint(equalTo: topBar.bottomAnchor,constant: 119).isActive = true
            exitButton.rightAnchor.constraint(equalTo: wholeView.rightAnchor, constant: -33).isActive = true
        }
    //3개의 노트를 사용할 때
        func displayTripleNote(noteView : UIView, topBar : UIView, exitButton : UIButton, wholeView: UIView){
            noteView.translatesAutoresizingMaskIntoConstraints = false
            noteView.topAnchor.constraint(equalTo: topBar.bottomAnchor,constant: 128).isActive = true
            noteView.bottomAnchor.constraint(equalTo: wholeView.bottomAnchor,constant: -248).isActive = true
            noteView.centerXAnchor.constraint(equalTo:wholeView.centerXAnchor).isActive = true
            noteView.frame = CGRect(x: 0, y: 0, width: 268, height: 318)
            
            exitButton.translatesAutoresizingMaskIntoConstraints = false
            exitButton.topAnchor.constraint(equalTo: topBar.bottomAnchor,constant: 66).isActive = true
            exitButton.rightAnchor.constraint(equalTo: wholeView.rightAnchor, constant: -33).isActive = true
        }


