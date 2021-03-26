//
//  ParametersViewController.swift
//  SenhaPower
//
//  Created by Beatriz Castro on 20/03/21.
//

import UIKit

class ParametersViewController: UIViewController {

    @IBOutlet weak var tTotalPasswords: UITextField!
    
    @IBOutlet weak var tNumberOfCaracterers: UITextField!
    
    @IBOutlet weak var swLowerCase: UISwitch!
    
    @IBOutlet weak var swUseNumbers: UISwitch!
    
    @IBOutlet weak var swUseSpecialCaracterers: UISwitch!
    
    @IBOutlet weak var swUseUperCase: UISwitch!
    
    @IBOutlet weak var btnGeneratePassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnGeneratePassword.isEnabled = true
        
        tTotalPasswords.addTarget(self, action: #selector(ParametersViewController.totalPasswordsChange(_:)),
                                  for: .editingChanged)
        
        tNumberOfCaracterers.addTarget(self, action: #selector(ParametersViewController.totalCaractersChange(_:)),
                                  for: .editingChanged)

        
    }
    
    /// Metodo que executa ao trocar o valor dos switchs
    @IBAction func switchChange(_ sender: Any) {
        
        btnGeneratePassword.isEnabled = swLowerCase.isOn ||
            swUseNumbers.isOn ||
            swUseSpecialCaracterers.isOn ||
            swUseUperCase.isOn
        
        //muda a opacidade do botão dependendo se ele esta habilitado ou não
        if(btnGeneratePassword.isEnabled){
            btnGeneratePassword.alpha = 1.0;
        }else{
            btnGeneratePassword.alpha = 0.5;
        }
        
    }
    
    
    /// Metodo que executa antes de ação da segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordViewController = segue.destination as! PasswordViewController
        
        if let numberOfPasswords = Int(tTotalPasswords.text!){
            passwordViewController.numberOfPasswords = numberOfPasswords
        }
        
        if let numberOfCaracters = Int(tNumberOfCaracterers.text!){
            passwordViewController.numberOfCharacters = numberOfCaracters
        }
        
        passwordViewController.useLowercaseLetters = swLowerCase.isOn
        passwordViewController.useNumbers = swUseNumbers.isOn
        passwordViewController.useSpecialCharacters = swUseSpecialCaracterers.isOn
        passwordViewController.useUppercaseLetters = swUseUperCase.isOn
        
        view.endEditing(true)
    }
    
    
    /// Change validate do campo de total de senhas
    @objc func totalPasswordsChange(_ textField: UITextField){
        if let totalPass = Int(tTotalPasswords.text!){
            if(totalPass == 0 || totalPass > 99){
                let template = "O valor %d é inválido para a quantidade de senhas."
                emitAlert(title: "Quantidade de senhas inválida", message: String(format: template, totalPass))
                tTotalPasswords.text = "1"
            }
        }
    }
    
    
    /// Change validate do campo de total de caracteres
    @objc func totalCaractersChange(_ textField: UITextField){
        if let totalCaracters = Int(tNumberOfCaracterers.text!){
            if(totalCaracters == 0 || totalCaracters > 16){
                let template = "O valor %d é inválido para o total de carateres."
                emitAlert(title: "Total de caracteres inválido", message: String(format: template, totalCaracters))
                tNumberOfCaracterers.text = "10"
            }
        }
    }
    
    
    /// Metodo emite alertas
    func emitAlert(title: String , message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
  
    
}

