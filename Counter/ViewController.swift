//
//  ViewController.swift
//  Counter
//

import UIKit
import Foundation

class ViewController: UIViewController {
    // создаем переменную для счетчика
    private var counter: Int = 0
    
    // аутлеты для интерфейсных элементов
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
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

    
    @IBAction func decrementDidTap(_ sender: Any) {
        if counter > 0 { // проверяем не меньше ли нуля
            counter -= 1
            counterLabel.text = "Значение счётчика: \(counter)"
            logTextView.text += "\(formattedDate): " + "значение изменено на -1\n"
            
            // скролл после добавления строки, если она выходит за границы контроллера
            let range = NSMakeRange(logTextView.text.count - 1, 1)
            logTextView.scrollRangeToVisible(range)
        } else {
            logTextView.text += "\(formattedDate): попытка уменьшить значение счётчика ниже 0\n"
            
            // скролл после добавления строки, если она выходит за границы контроллера
            let range = NSMakeRange(logTextView.text.count - 1, 1)
            logTextView.scrollRangeToVisible(range)
        }
    }
 
    @IBAction func incrementDidTap(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        logTextView.text += "\(formattedDate): " + "значение изменено на +1\n"
                
        // скролл после добавления строки, если она выходит за границы контроллера
        let range = NSMakeRange(logTextView.text.count - 1, 1)
        logTextView.scrollRangeToVisible(range)
    }
    
    @IBAction func resetDidTap(_ sender: Any) {
        counter = 0
        counterLabel.text = "\(counter)"
        logTextView.text += "\(formattedDate): значение сброшено\n"
        
        // скролл после добавления строки, если она выходит за границы контроллера
        let range = NSMakeRange(logTextView.text.count - 1, 1)
        logTextView.scrollRangeToVisible(range)
    }
    
}

