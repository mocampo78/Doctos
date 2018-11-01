//
//  ViewController4.swift
//  AgendaGraficaPractica3
//
//  Created by mos on 11/1/18.
//  Copyright © 2018 Banco Azteca. All rights reserved.
//

import UIKit

class ViewController4: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblAsistentesEvento: UITableView!
    @IBOutlet weak var txtLugar: UITextField!
    
    @IBOutlet weak var txtAsunto: UITextField!
    
    var fecha : String = ""
    var hora: String = ""
    
    let manejadorAgenda = ManejadorAgenda()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.manejadorAgenda.listaContactos.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        let sec = indexPath.section
        celda.textLabel?.text = "\(self.manejadorAgenda.listaContactos[sec].obtieneNombre())"
        return celda
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tblAsistentesEvento.isHidden=true
    }
    
    @IBAction func btnRegistrar(_ sender: UIButton) {
        if(fecha=="" || hora == ""){
            mensaje(mje: "Seleccione la fecha y hora del evento")
            return
        }
        
        if(txtLugar.text == ""){
            mensaje(mje: "Indique el lugar del evento")
            return
        }
        
        if(txtAsunto.text == ""){
            mensaje(mje: "Indique el asunto del evento")
            return
        }
        self.manejadorAgenda.simulaAgenda()
        self.tblAsistentesEvento.dataSource = self
        self.tblAsistentesEvento.delegate = self
        self.tblAsistentesEvento.isHidden = false
        
        mensaje(mje: "Se creo el registro del evento. Se notificara a los contactos de su agenda")
        
    }
    
    @IBAction func dpkFecha(_ sender: UIDatePicker) {
        let dateFormatter: DateFormatter = DateFormatter()
        let timeFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        timeFormatter.dateFormat = "HH"
        fecha = dateFormatter.string(from: sender.date)
        hora = timeFormatter.string(from: sender.date)
    }
    
    func mensaje(mje : String) -> Void {
        let alerta: UIAlertController = UIAlertController.init(title: "Registro de Evento", message: mje, preferredStyle: UIAlertController.Style.alert);
        
        let okAlerta: UIAlertAction = UIAlertAction.init(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil);
        
        
        alerta.addAction(okAlerta)
        
        
        present(alerta, animated: true, completion: nil);
    }
}
