import UIKit
import FirebaseDatabase

class AddMemoViewController: UIViewController {
    
    var ref: DatabaseReference!

    @IBOutlet weak var memoTextView: UITextView!
    

    @IBAction func saveTapped() {
        
        if memoTextView.text.isEmpty { return }
        
        ref = Database.database().reference()
        
        // 메모 추가
        let key = ref.child("users/\(userId)/memoArray").childByAutoId()
        key.setValue(memoTextView.text!)
        
        navigationController?.popViewController(animated: true)
    }
    
}
