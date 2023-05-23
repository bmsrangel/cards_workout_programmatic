//
//  CardSelectionVC.swift
//  Cards Workout-Programmatic
//
//  Created by Bruno Rangel on 22/05/23.
//

import UIKit

class CardSelectionVC: UIViewController {
    let cardImageView = UIImageView()
    let stopButton = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let resetButton = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules")

    var timer: Timer!
    var allCards: [UIImage] = CardDeck.allCards

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }

    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }

    func configureCardImageView() {
        // Same effect as dragging a component from the "Add" list to the screen
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")

        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75),
        ])
    }

    func configureStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(onStopButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 50),
        ])
    }

    func configureResetButton() {
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(onResetButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
        ])
    }

    func configureRulesButton() {
        view.addSubview(rulesButton)
        // This is how actions are defined
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)

        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
        ])
    }

    @objc func presentRulesVC() {
        // If data should be sent to the next screen, its controller could be instantiated in a variable,
        // the corresponding attribute could be set and the variable would be passed as argument for "present"
        // Additionally, "present" is being used because "Navigation Controller" is not in use for this app
        present(RulesVC(), animated: true)
    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(replaceCardImage), userInfo: nil, repeats: true)
    }

    @objc func replaceCardImage() {
        let card = allCards.randomElement() ?? UIImage(named: "AS")
        cardImageView.image = card
    }

    @objc func onStopButtonTapped() {
        timer.invalidate()
    }

    @objc func onResetButtonTapped() {
        timer.invalidate()
        startTimer()
    }
}
