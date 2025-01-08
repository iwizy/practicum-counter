//
//  ViewController.swift
//  Counter
//

import UIKit
import Foundation

final class ViewController: UIViewController {
    // создаем переменную для счетчика
    private var counter: Int = 0
    
    // аутлеты для интерфейсных элементов
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var logTextView: UITextView!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    // функция для форматирования даты
    private func getDate() -> String {
        let date = Date.now
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    // свойство для получения текущей даты и времени
    lazy private var formattedDate = getDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logTextView.text = "История изменений:\n" // пишем в textview начальное значение
        counterLabel.text = "\(counter)" // проставляем начальное значение счетчика
    }
    
    // скролл после добавления строки, если она выходит за границы контроллера
    private func scrollToRange() {
        let range = NSMakeRange(logTextView.text.count - 1, 1)
        logTextView.scrollRangeToVisible(range)
    }
    
    
    @IBAction private func decrementDidTap(_ sender: Any) {
        if counter > 0 { // проверяем не меньше ли нуля
            counter -= 1
            counterLabel.text = "Значение счётчика: \(counter)"
            logTextView.text += "\(formattedDate): " + "значение изменено на -1\n"
            scrollToRange()
        } else {
            logTextView.text += "\(formattedDate): попытка уменьшить значение счётчика ниже 0\n"
            scrollToRange()
        }
    }
    
    @IBAction private func incrementDidTap(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        logTextView.text += "\(formattedDate): " + "значение изменено на +1\n"
        scrollToRange()
    }
    
    @IBAction private func resetDidTap(_ sender: Any) {
        counter = 0
        counterLabel.text = "\(counter)"
        logTextView.text += "\(formattedDate): значение сброшено\n"
        scrollToRange( )
    }
    
}

