import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var idLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginTapped() {
        Auth.auth().signIn(withEmail: idLabel.text!, password: passwordLabel.text!) { (user, error) in
            if let error = error {
                let alert = UIAlertController(title: "알림", message: "로그인 실패(\(error.localizedDescription))", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                userId = user?.uid ?? ""
                self.performSegue(withIdentifier: "goMainSegue", sender: nil)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
