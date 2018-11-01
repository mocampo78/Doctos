//
//  ViewController3.swift
//  AgendaGraficaPractica3
//
//  Created by mos on 10/31/18.
//  Copyright © 2018 Banco Azteca. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var txtNombre: UITextField!
    
    
    @IBOutlet weak var txtApePat: UITextField!
    
    
    @IBOutlet weak var txtApeMat: UITextField!
    
    @IBOutlet weak var txtEmpresa: UITextField!
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtDomicilio: UITextField!
    @IBOutlet weak var pkvParentesco: UIPickerView!
    
    @IBOutlet weak var dpkFechaNac: UIDatePicker!

    @IBOutlet weak var txtTelefono: UITextField!
    
    var fechaNac : String = ""
    var edad : Int = 0
    
    var parentesco : [String] = []
    var tipoParentesco : String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.parentesco.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.parentesco[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.tipoParentesco = self.parentesco[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        parentesco = [Parentesco._MADRE.rawValue,
                      Parentesco._PADRE.rawValue,        Parentesco._HERMANO.rawValue,        Parentesco._HIJO.rawValue,        Parentesco._ESPOSO.rawValue,        Parentesco._AMIGO.rawValue,        Parentesco._TRABAJO.rawValue,        Parentesco._PRIMO.rawValue,        Parentesco._TIO.rawValue,        Parentesco._ABUELO.rawValue,        Parentesco._CONOCIDO.rawValue,        Parentesco._OTRO.rawValue,        Parentesco._NOCONOCIDO.rawValue]
        dpkFechaNac.datePickerMode = UIDatePicker.Mode.date
        
        self.pkvParentesco.dataSource = self
        self.pkvParentesco.delegate = self
    }
    

   
    @IBAction func btnRegistrar(_ sender: UIButton) {
        if(txtNombre.text == ""){
            mensaje(mje: "Introduzca el Nombre")
            return
        }
        
        if (txtApePat.text == "") {
            mensaje(mje: "Introduzca el Apellido Paterno")
            return
        }
        
        if (txtApeMat.text == "") {
            mensaje(mje: "Introduzca el Apellido Materno")
            return
        }
        
        if (txtEmpresa.text == "") {
            mensaje(mje: "Introduzca la Empresa")
            return
        }
        
        if (txtEmail.text == "") {
            mensaje(mje: "Introduzca cuenta de correo")
            return
        }else{
            if (!validaEmail(string: txtEmail.text!)){
                mensaje(mje: "Introduzca un Email valido")
                return
            }
        }
        
        if (txtDomicilio.text == "") {
            mensaje(mje: "Introduzca el domicilio")
            return
        }
        
        if (txtTelefono.text == "") {
            mensaje(mje: "Introduzca un numero de Telefono")
            return
        }else {
            if(!validaTelefono(tel: txtTelefono.text!)){
                mensaje(mje: "Introduzca un telefono Valido")
                return
            }
        }
        
        if(fechaNac == ""){
            mensaje(mje: "Seleccione una fecha")
            return
        }
        
        if(tipoParentesco == ""){
            mensaje(mje: "Seleccione el tipo de Parentesco")
            return
        }
        
    }
    
    func mensaje(mje : String) -> Void {
        let alerta: UIAlertController = UIAlertController.init(title: "Registro de Contacto", message: mje, preferredStyle: UIAlertController.Style.alert);
        
        let okAlerta: UIAlertAction = UIAlertAction.init(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil);
        
    
        alerta.addAction(okAlerta)

        
        present(alerta, animated: true, completion: nil);
    }
    
    func validaEmail(string: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return emailTest.evaluate(with: string)
    }
    
    func validaTelefono(tel: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "\\d{10}").evaluate(with: tel)
    }
    
    
    @IBAction func dpkFechaNac(_ sender: UIDatePicker) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        fechaNac = dateFormatter.string(from: sender.date)
    }
    
}
