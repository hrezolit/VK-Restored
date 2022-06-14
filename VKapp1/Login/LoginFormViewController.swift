//
//  LoginFormViewController.swift
//  VKapp1
//
//  Created by Nikita on 8/3/22.
//

import UIKit

class LoginFormViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var switchLabel: UILabel!
    
    var enteringPerson : String!
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Delegates
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
            
        // Tap gesture recognizer
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        // Assign to UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        // Changing color of placeholder's text
        loginTextField.attributedPlaceholder = NSAttributedString(
            string: "Login",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        setUpElements()
        
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Adding observers for observe keyboard condition
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Removing observers
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    //MARK: - Unwindsegue
    @IBAction func unwindToStart(_ sender: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    //MARK: - Switcher for Dark Mode
    @IBAction func changeMode(_ sender: UISwitch) {
        if sender.isOn {
            switchLabel.text = "Light Mode"
            switchLabel.textColor = .white
            view.backgroundColor = .black
            logo.image = UIImage(named: "Vk_Logo_Night")
            loginButton.backgroundColor = .black
            loginButton.layer.borderWidth = 1.5
            loginButton.layer.borderColor = UIColor.white.cgColor
            loginButton.layer.cornerRadius = 15.0
            loginButton.alpha = 0.6
        } else {
            switchLabel.text = "Dark Mode"
            switchLabel.textColor = .black
            logo.image = UIImage(named: "Vk_Logo.svg")
            view.backgroundColor = UIColor(named: "backgroundColor")
            loginButton.backgroundColor = UIColor(red: 32/255, green: 111/255, blue: 242/255, alpha: 1)
            loginButton.layer.borderWidth = 0
            loginButton.layer.borderColor = UIColor.blue.cgColor
            loginButton.layer.cornerRadius = 15.0
            loginButton.alpha = 1
        }
    }
    
    //MARK: - loginButtonPressed
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
    }
    
    // Making transition with data
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let checkResult = chekUserData()
        
        if !checkResult {
            showLoginError()
        }
        return checkResult
        
    }
    
    // Cheking data
    func chekUserData() -> Bool {
        guard let login = loginTextField.text,
              let password = passwordTextField.text else { return false }
        
        if login == "" && password == "" {
            return true
        } else {
            return false
        }
        
    }
    
    //MARK: - alert controller
    func showLoginError() {
        
        let alert = UIAlertController(title: "Sorry",
                                      message: "Login or Password not correct",
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Try again",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // Value capture for entering label
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passingInformation = segue.destination as? EnterViewController
        passingInformation?.enteringPerson = loginTextField.text!
    }
    
    /// Install customization for textFields
    func setUpElements() {
        Utilities.styleTextField(loginTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    
    //MARK: - keyboardWasShown
    @objc func keyboardWasShown(notification: Notification) {
        
        // Keyboard size
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Make a indent after UIScrollView equaling size of the keyboard
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // Keyboard disappearing
    @objc func keyboardWillBeHidden(notification: Notification) {
        
        // Initialize indent at the bottom of UIScrollView, equals 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
}
//MARK: - extention UITextFieldDelegate
extension LoginFormViewController: UITextFieldDelegate {
    
    //make "next" button switch to the next textField
    private func switchBasedNextTextField(_ textField: UITextField) {
        
        switch textField {
            
        case self.loginTextField:
            self.passwordTextField.becomeFirstResponder()
            
        case self.passwordTextField:
            self.passwordTextField.resignFirstResponder()
            
            let checkResult = chekUserData()
            if !checkResult {
                showLoginError()
            } else {
                performSegue(withIdentifier: "LogedInSegue", sender: nil)
            }
            
        default:
            break
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
}

