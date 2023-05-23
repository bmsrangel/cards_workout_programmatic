//
//  CWButton.swift
//  Cards Workout-Programmatic
//
//  Created by Bruno Rangel on 22/05/23.
//

import UIKit

class CWButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    // This is required by the UIButton class
    // This method would be called if this component was used in a Storyboard
    // As this project does not have a Storyboard, it can throw an error, as its instance through a Storyboard is impossible
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // Custom init that accepts a background color and a title as parameters
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }
    
    // Custom basic setup of the button appearence
    // It does not take color and title so this button can be reused
    func configure() {
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
