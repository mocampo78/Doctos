//
//  ViewController.swift
//  Practica2
//
//  Created by mos on 10/31/18.
//  Copyright © 2018 Moises Ocampo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnRegistrar: UIButton!
    
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtTelefono: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBOutlet weak var txtConfirmaPassword: UITextField!
    
    @IBOutlet weak var txtSexo: UITextField!
    
    @IBOutlet weak var txtFechaNac: UITextField!
    
    @IBOutlet weak var lblNotificacion: UILabel!
    
    
    
    @IBOutlet weak var tvCondiciones: UITextView!
    
    
    @IBOutlet weak var swAceptar: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblNotificacion.isHidden=true
        lblNotificacion.text="* Campos Obligatorios"
        txtPassword.isSecureTextEntry=true
        txtConfirmaPassword.isSecureTextEntry = true
        
        tvCondiciones.isHidden = true
        swAceptar.isOn = false
        swAceptar.isHidden = true
        
        btnRegistrar.isEnabled = false
        
    }


    @IBAction func swAceptarPolitica(_ sender: UISwitch) {
        btnRegistrar.isEnabled = !btnRegistrar.isEnabled
    }
    
    @IBAction func btnRegistro(_ sender: UIButton) {
        if txtNombre.text == "" {
            lblNotificacion.text="* Campos Obligatorios. Ingresa el Nombre"
            lblNotificacion.isHidden = false
            return
        }
        
        if txtTelefono.text != ""{
            if validaTelefono(tel: txtTelefono.text!)==false{
                lblNotificacion.text="Telefono de 10 digitos"
                lblNotificacion.isHidden = false
                return
            }
        }
        
        if txtEmail.text == "" {
            lblNotificacion.text="* Campos Obligatorios. Ingresa el Email"
            lblNotificacion.isHidden = false
            return
        }else{
            if isValidEmail(string : txtEmail.text!) == false{
                lblNotificacion.text="Email no valido"
                lblNotificacion.isHidden = false
                return
            }
        }
        
        if txtPassword.text == "" {
            lblNotificacion.text="* Campos Obligatorios. Ingresa el Password"
            lblNotificacion.isHidden = false
            return
        }
        
        if txtConfirmaPassword.text == ""{
            lblNotificacion.text="* Campos Obligatorios. Confirma el Password"
            lblNotificacion.isHidden = false
            return
        }
        
        
        if txtPassword.text != txtConfirmaPassword.text {
            lblNotificacion.text="Los Passwords no coinciden"
            lblNotificacion.isHidden = false
            return
        }
        
        if txtSexo.text == "" || (txtSexo.text != "H" && txtSexo.text != "M"){
            lblNotificacion.text="Ingrese el Sexo valido"
            lblNotificacion.isHidden = false
            return
        }
        
        if txtFechaNac.text == "" {
            lblNotificacion.text="Ingrese la fecha de Nacimiento"
            lblNotificacion.isHidden = false
            return
        }
        
        lblNotificacion.text="REGISTRO EXITOSO!!!"
            
    }
    
    
    @IBAction func btnpoliticas(_ sender: UIButton) {
        tvCondiciones.isHidden = false
        swAceptar.isHidden = false
    }
    
    func isValidEmail(string: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return emailTest.evaluate(with: string)
    }
    
    func validaTelefono(tel: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "\\d{10}").evaluate(with: tel)
    }
}

