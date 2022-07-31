//
//  LoginForm.swift
//  WeatherApp
//
//  Created by Victor Garitskyu on 25.07.2022.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func loginButtonPressed(_ sender: Any) {
    }
    
    @objc func keyboardWasShow(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue) .cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }

    @objc func keyboardWillbeHidden(notification: Notification){
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
     let checkResult = checkUserData()
        
        if !checkResult {
            showLoginError()
        }
        
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard  let login = loginInput.text,
               let password = passwordInput.text else { return false }
                        if login == "" && password  == "" {
                            return true
                        } else
                        {
                          return false
                        }
}
    
    func showLoginError() {
        let alert = UIAlertController(title: "Error", message: "Data is not correct", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true , completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboadGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboadGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillbeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
}
