import UIKit

class DetailMemoViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!
    
    var detailMemoString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        memoTextView.text = detailMemoString
    }

}
