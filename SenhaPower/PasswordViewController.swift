//
//  PasswordViewController.swift
//  SenhaPower
//
//  Created by Beatriz Castro on 21/03/21.
//

import UIKit

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacters = 10
    var numberOfPasswords = 1
    var useLowercaseLetters = true
    var useNumbers = true
    var useUppercaseLetters = false
    var useSpecialCharacters = false
    
    var passwordGenerator = PasswordGenerator(
          numberOfCharacters: 0,
          useLetters: true,
          useNumbers: true,
          useCapitalLetters: false,
          useSpecialLetters: false
      )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordGenerator = PasswordGenerator(
              numberOfCharacters: numberOfCharacters,
              useLetters: useLowercaseLetters,
              useNumbers: useNumbers,
              useCapitalLetters: useUppercaseLetters,
              useSpecialLetters: useSpecialCharacters
          )
        
        if(tvPasswords.text == "" &&  numberOfPasswords != 0){
            setPasswords()
        }
       
    }
    
    
    @IBAction func genereteNewPassword(_ sender: Any) {
        setPasswords()
    }
    
    func setPasswords(){
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0)) // posiciona a scroll no topo da view
        tvPasswords.text = "" // limpa a view
                
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
             tvPasswords.text.append(password + "\n\n")
        }
    }
    

}
