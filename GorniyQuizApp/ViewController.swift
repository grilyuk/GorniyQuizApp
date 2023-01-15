//
//  ViewController.swift
//  GorniyQuizApp
//
//  Created by Григорий Данилюк on 14.01.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var optionsButtonOutlet: UIButton!
    @IBOutlet weak var resultButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func initialize() {
        
    }
}

