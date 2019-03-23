
import UIKit
import FirebaseDatabase

struct MemoInfo {
    var key: String
    var value: String
}

class MemoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var memoTableView: UITableView!
    
    var ref: DatabaseReference!
    
    var memoArray = [MemoInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTableView.dataSource = self
        memoTableView.delegate = self
        
        ref = Database.database().reference()

        // 메모 추가
//        let key = ref.child("users/\(userId)/memoArray").childByAutoId()
//        key.setValue("프로야구 개막~~!")
        
        // 모든 메모 가져오기
        ref.child("users/\(userId)/memoArray").observe(.childAdded) { (snapshot) in
            print("key: \(snapshot.key), value: \(snapshot.value ?? "")")
            self.memoArray.append(MemoInfo(key: snapshot.key, value: snapshot.value as? String ?? ""))
            self.memoTableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memoTableView.reloadData()
    }


    // MARK: - Navigation wtchoi@happysmile.kr

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let detailVC = segue.destination as? DetailMemoViewController {
            let indexPath = memoTableView.indexPath(for: sender as! UITableViewCell)
            detailVC.detailMemoString = memoArray[indexPath!.row].value
        }
    }

    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
        cell.textLabel?.text = memoArray[indexPath.row].value
        
        return cell
    }
}
