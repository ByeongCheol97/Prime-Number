// Prime Number Checker
import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var LblA: UILabel!
    @IBOutlet weak var textA: UITextField!
    
    var isPrime = true
    
    @IBAction func Check(_ sender: Any) {
        
        if let number = Int(textA.text!) {
            
            var isPrime = true
            
            if number <= 0 {
                LblA.text = "XX!"
                textA.text = ""
                return
            }
            
            if number == 1 {
                isPrime = false
            }
            
            if number != 1 && number != 2 {
                for i in 2 ..< number {
                    if number % i == 0 {
                        isPrime = false
                    }
                }
            }
            
            if isPrime == true {
                LblA.text = "Prime number"
            } else {
                LblA.text = "Not Prime number"
            }
            textA.text = ""
        } else {
            print("nil 발생")
            LblA.text = "XX!"
            textA.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textA.delegate = self
        textA.placeholder = "ex) 1"
        textA.clearButtonMode = UITextField.ViewMode.always
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textA.resignFirstResponder()
        return true
    }
}

