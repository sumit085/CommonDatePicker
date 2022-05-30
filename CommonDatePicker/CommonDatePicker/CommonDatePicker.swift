import UIKit

enum DATE_FORMAT : String{
    case Date_Month_Year = "MM/dd/yyyy"
    case Date_Month_Year_Hours_Min = "MM-dd-yyyy HH:mm"

    
//    Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
//    09/12/2018                        --> MM/dd/yyyy
//    09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
//    Sep 12, 2:11 PM                   --> MMM d, h:mm a
//    September 2018                    --> MMMM yyyy
//    Sep 12, 2018                      --> MMM d, yyyy
//    Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
//    2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
//    12.09.18                          --> dd.MM.yy
//    10:41:02.112                      --> HH:mm:ss.SSS
}
protocol CommonDatePickerDelegate: AnyObject {
    func getDate(date:String)
    func cancel()
}

class CommonDatePicker : NSObject {
    
    private let datePicker = UIDatePicker()
    private var dateFormate : DATE_FORMAT
    weak var delegate:CommonDatePickerDelegate?
    
    init(dateFormate:DATE_FORMAT){
        self.dateFormate = dateFormate
    }
   
    func showDatePickerWithTextField(txtField:UITextField){
        //Formate Date
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action:       #selector(doneDatePicker));
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action:       #selector(cancelDatePicker));
        
        toolbar.setItems([cancelBtn, spaceBtn, doneBtn], animated: false)
        
        txtField.inputAccessoryView = toolbar
        txtField.inputView = datePicker
    }
    
    @objc func doneDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormate.rawValue
        let result = formatter.string(from: datePicker.date)
        delegate?.getDate(date: result)
    }
    
    @objc func cancelDatePicker(){
        delegate?.cancel()
    }
}
