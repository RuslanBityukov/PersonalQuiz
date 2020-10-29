//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    var textOfLabel: [Answer]!
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавится от кнопки возврата на предыдущий экран

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    private func updateResult() {
        var animalSelection: [AnimalType: Int] = [:]
        let animals = textOfLabel.map { $0.type }
        
        for animal in animals {
            animalSelection[animal] = (animalSelection[animal] ?? 0) + 1
        }
        let animalSorted = animalSelection.sorted { $0.value > $1.value }
        guard let commonTypeOfAnimal = animalSorted.first?.key else { return }
        updateUI(animals: commonTypeOfAnimal)
    }
    
    private func updateUI(animals: AnimalType) {
        animalLabel.text = "Вы \(animals.rawValue)"
        resultLabel.text = "\(animals.definition)"
    }
}

extension ResultsViewController {
    func updateUI() {
        let current = textOfLabel.first
        animalLabel.text = current?.text
    }
}
