import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var idLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    @IBAction func registerTapped() {
        Auth.auth().createUser(withEmail: idLabel.text!, password: passwordLabel.text!) { (authResult, error) in
            
            if let error = error {
                let alert = UIAlertController(title: "알림", message: "회원가입 실패(\(error.localizedDescription))", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                
                guard let uId = authResult?.uid else { return }
                userId = uId
                print(userId)
                
                let alert = UIAlertController(title: "알림", message: "회원가입 완료", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (alertAction) in
                    print("확인 버튼 클릭")
                    self.navigationController?.popViewController(animated: true)
                }))
                
                self.present(alert, animated: true) {
                    print("메시지 박스 띄우기 완료")
                }
            }
        }

    }

}













