import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var txtFieldDate: UITextField!
    
    private var commonDatePicker:CommonDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonDatePicker = CommonDatePicker()
        commonDatePicker.delegate = self
        commonDatePicker.showDatePickerWithTextField(txtField: txtFieldDate)
    }
}

extension ViewController : CommonDatePickerDelegate{
    func getDate(date:Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = DATE_FORMAT.Date_Month_Year.rawValue
        txtFieldDate.text = formatter.string(from: date)
        view.endEditing(true)
    }
    
    func cancel() {
        view.endEditing(true)
    }
}
