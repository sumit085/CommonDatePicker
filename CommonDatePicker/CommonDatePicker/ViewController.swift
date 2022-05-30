import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtFieldDate: UITextField!
    
    private var commonDatePicker:CommonDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonDatePicker = CommonDatePicker(dateFormate : .Date_Month_Year_Hours_Min)
        commonDatePicker.delegate = self
        commonDatePicker.showDatePickerWithTextField(txtField: txtFieldDate)
    }
}

extension ViewController : CommonDatePickerDelegate{
    func getDate(date: String) {
        txtFieldDate.text = date
        view.endEditing(true)
    }
    
    func cancel() {
        view.endEditing(true)
    }
}
