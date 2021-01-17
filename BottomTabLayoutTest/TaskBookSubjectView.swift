//
//  TaskBookSubjectView.swift
//  BottomTabLayoutTest
//
//  Created by JaesungMoon on 2021/01/18.
//

import UIKit

class TaskBookSubjectView: UIView, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldTitle: UITextField!
    
    override func layoutSubviews() {
        print("TaskBookSubjectView:layoutSubviews")
        textFieldTitle.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TaskBookSubjectView:textFieldDidBeginEditing")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TaskBookSubjectView:textFieldShouldReturn")
        textFieldTitle.resignFirstResponder()
        return true
    }
    override class func awakeFromNib() {
        print("TaskBookSubjectView:awakeFromNib")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("TaskBookSubjectView:init")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("TaskBookSubjectView:init")
//        fatalError("init(coder:) has not been implemented")
    }
}

//extension TaskBookSubjectView: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("TaskBookSubjectView:textFieldDidBeginEditing")
//    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("TaskBookSubjectView:textFieldShouldReturn")
//        textFieldTitle.resignFirstResponder()
//        return true
//    }
//}
