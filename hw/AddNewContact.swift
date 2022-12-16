//
//  AddNewContact.swift
//  hw
//
//  Created by Shamil Ashurilov on 15.12.2022.
//

import UIKit

class AddNewContact: UIViewController {

    let buttonCancel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отмена", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let buttonAdd: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let defaultImageLogo = UIImage(named: "defaultProfileLogo")
    
    let logoDefault: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.backgroundColor = .systemTeal
        imageview.layer.cornerRadius = 60
        imageview.layer.borderWidth = 1
        imageview.layer.masksToBounds = true
        return imageview
    }()
    
    let changeLogoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Изменить фото", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата:"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите дату"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Возраст:"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите возраст"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let sexLabel: UILabel = {
        let label = UILabel()
        label.text = "Пол:"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let sexTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пол"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let instagramLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram:"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .systemBlue
        return label
    }()
    
    let instagramTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите ваш Instagram"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let agePicker = UIPickerView()
    
    let sexPickerView = UIPickerView()
    
    let datePickerView = UIDatePicker()
    
    
    let instagramAlert: UIAlertController = UIAlertController(title: "Внимание", message: "Введите ваш instagram username:", preferredStyle: .alert)
    
    var ageArray = [String]()
    let sexarray = ["Парень", "Девушка"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createUI()
        createContraints()
        addPickerOnTextFields()

        // pickerViewAGe
        agePicker.tag = 0
        agePicker.delegate = self
        agePicker.dataSource = self
        
        // sexPickerView
        sexPickerView.tag = 1
        sexPickerView.delegate = self
        sexPickerView.dataSource = self
        
        // datePicker
        datePickerView.datePickerMode = .date
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.addTarget(self, action: #selector(datepickerValueChanged(picker:)), for: .valueChanged)
        
        // устанавливаем лого
        logoDefault.image = defaultImageLogo
        
        // добавляем таргеты на кнопки
        buttonCancel.addTarget(self, action: #selector(goback), for: .touchUpInside)
        buttonAdd.addTarget(self, action: #selector(goback), for: .touchUpInside)
        
        // заполняем массив возрастов
        for i in 14...100 {
            ageArray.append(String(i))
        }
        
        // Настройка alert Instagram
        instagramAlert.addTextField()
        let actionOneForAlertInstagram = UIAlertAction(title: "OK", style: .default) { _ in
            self.instagramTextField.text = self.instagramAlert.textFields?.first?.text
        }
        let actionTwoForAlertInstagram = UIAlertAction(title: "Cancel", style: .cancel)
        instagramAlert.addAction(actionOneForAlertInstagram)
        instagramAlert.addAction(actionTwoForAlertInstagram)
        
        instagramTextField.addTarget(self, action: #selector(showInstagramAlert), for: .touchDown)
    }
    
    
    // таргет для date picker
    @objc func datepickerValueChanged(picker: UIDatePicker) {
        // настраиваем формат даты
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.dateTextField.text = dateFormatter.string(from: datePickerView.date)
    }
    
    // таргет для инстаграм текст филда
    @objc func showInstagramAlert() {
        instagramTextField.resignFirstResponder()
        present(instagramAlert, animated:  true)
    }
    
    // добавление пикеров в текстфилд
    func addPickerOnTextFields() {
        ageTextField.inputView = agePicker
        sexTextField.inputView = sexPickerView
        dateTextField.inputView = datePickerView
    }
    
    func createUI() {
        view.addSubview(buttonCancel)
        view.addSubview(buttonAdd)
        view.addSubview(logoDefault)
        view.addSubview(changeLogoButton)
        view.addSubview(labelName)
        view.addSubview(nameTextField)
        view.addSubview(dateLabel)
        view.addSubview(dateTextField)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(sexLabel)
        view.addSubview(sexTextField)
        view.addSubview(instagramLabel)
        view.addSubview(instagramTextField)
    }
    
    func createContraints() {
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        logoDefault.translatesAutoresizingMaskIntoConstraints = false
        changeLogoButton.translatesAutoresizingMaskIntoConstraints = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        sexTextField.translatesAutoresizingMaskIntoConstraints = false
        instagramLabel.translatesAutoresizingMaskIntoConstraints = false
        instagramTextField.translatesAutoresizingMaskIntoConstraints = false
        
        buttonCancel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        buttonCancel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        buttonCancel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonCancel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        buttonAdd.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        buttonAdd.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        buttonAdd.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonAdd.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        logoDefault.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        logoDefault.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoDefault.heightAnchor.constraint(equalToConstant: 120).isActive = true
        logoDefault.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        changeLogoButton.topAnchor.constraint(equalTo: logoDefault.bottomAnchor, constant: 5).isActive = true
        changeLogoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        labelName.topAnchor.constraint(equalTo: changeLogoButton.bottomAnchor, constant: 20).isActive = true
        labelName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 5).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: labelName.leftAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
        
        dateTextField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5).isActive = true
        dateTextField.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
        dateTextField.rightAnchor.constraint(equalTo: nameTextField.rightAnchor).isActive = true
        
        ageLabel.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 20).isActive = true
        ageLabel.leftAnchor.constraint(equalTo: dateTextField.leftAnchor).isActive = true
        
        ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 5).isActive = true
        ageTextField.leftAnchor.constraint(equalTo: dateTextField.leftAnchor).isActive = true
        ageTextField.rightAnchor.constraint(equalTo: dateTextField.rightAnchor).isActive = true
        
        sexLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20).isActive = true
        sexLabel.leftAnchor.constraint(equalTo: ageTextField.leftAnchor).isActive = true
        
        sexTextField.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: 5).isActive = true
        sexTextField.leftAnchor.constraint(equalTo: ageTextField.leftAnchor).isActive = true
        sexTextField.rightAnchor.constraint(equalTo: ageTextField.rightAnchor).isActive = true
        
        instagramLabel.topAnchor.constraint(equalTo: sexTextField.bottomAnchor, constant: 20).isActive = true
        instagramLabel.leftAnchor.constraint(equalTo: sexTextField.leftAnchor).isActive = true
        
        instagramTextField.topAnchor.constraint(equalTo: instagramLabel.bottomAnchor, constant: 5).isActive = true
        instagramTextField.leftAnchor.constraint(equalTo: sexTextField.leftAnchor).isActive = true
        instagramTextField.rightAnchor.constraint(equalTo: sexTextField.rightAnchor).isActive = true
    }
            
    // таргет возвращения на прошлый контроллер
    @objc func goback() {
        dismiss(animated: true)
    }
    
    // скрыть клавиатуру при нажатии на какую то область
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        sexTextField.resignFirstResponder()
        dateTextField.resignFirstResponder()
    }
}



extension AddNewContact: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return ageArray[row]
        case 1:
            return sexarray[row]
        default: ""
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            ageTextField.text = ageArray[row]
            //ageTextField.resignFirstResponder()
        case 1:
            sexTextField.text = sexarray[row]
            //sexTextField.resignFirstResponder()
        default: break
        }
    }
}

extension AddNewContact: UIPickerViewDataSource {
    // кол-во компонентов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView.tag {
        case 0 , 1 :
            return 1
        default : return 1
        }
    }
    
    // сколько строк в компоненте
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag  {
        case 0 :
            return ageArray.count
        case 1:
            return sexarray.count
        default : return 0
        }
    }
}
