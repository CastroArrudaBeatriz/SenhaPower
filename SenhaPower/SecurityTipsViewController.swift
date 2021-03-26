//
//  SecurityTipsViewController.swift
//  SenhaPower
//
//  Created by Beatriz Castro on 21/03/21.
//

import UIKit

class SecurityTipsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        isModalInPresentation = true
    }
    
    ///Metodo para fechar tela ao clicar no botão
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
