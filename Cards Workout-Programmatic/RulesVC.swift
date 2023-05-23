//
//  RulesVC.swift
//  Cards Workout-Programmatic
//
//  Created by Bruno Rangel on 22/05/23.
//

import UIKit

class RulesVC: UIViewController {
    let titleLabel = UILabel()
    let rulesLabel = UILabel()
    let exercisesLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureRulesLabel()
        configureExercisesLabel()
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    func configureRulesLabel() {
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = "The value of each card represents the number of exercises you do.\n\nJ = 11, Q = 12, K = 13, A = 14"
        rulesLabel.textAlignment = .center
        rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    func configureExercisesLabel() {
        view.addSubview(exercisesLabel)
        exercisesLabel.translatesAutoresizingMaskIntoConstraints = false
        exercisesLabel.text = "♠️ = Push-ups\n\n♥️ = Sit-ups\n\n♣️ = Burpees\n\n♦️ = Jumping-jacks"
        exercisesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        exercisesLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            exercisesLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 60),
            exercisesLabel.widthAnchor.constraint(equalToConstant: 200),
            exercisesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
