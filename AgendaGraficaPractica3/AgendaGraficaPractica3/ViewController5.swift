//
//  ViewController5.swift
//  AgendaGraficaPractica3
//
//  Created by mos on 11/1/18.
//  Copyright © 2018 Banco Azteca. All rights reserved.
//

import UIKit

class ViewController5: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let manejadorAgenda = ManejadorAgenda()
    var perfil : Contacto?
    
    @IBOutlet weak var tblPerfil: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.perfil?.obtieneNombre()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        //En la celda se coloca la direccion
        let row = indexPath.row
        switch row {
        case 0:
            celda.textLabel?.text = "Domicilio: \(self.perfil!.domicilio)"
            break
        case 1:
            celda.textLabel?.text = "Email: \(self.perfil!.email!)"
            break
        case 2:
            celda.textLabel?.text = "Empresa: \(self.perfil!.empresa)"
            break
        case 3:
            celda.textLabel?.text = "Edad: \(self.perfil!.edad)"
            break
        case 4:
            celda.textLabel?.text = "Parentesco: \(self.perfil!.parentescoAgenda.rawValue)"
            break
        default:
            celda.textLabel?.text = "Telefono: \(self.perfil!.telefono!)"
        }
        return celda
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.manejadorAgenda.simulaAgenda()
        for c in manejadorAgenda.listaContactos{
            if (c.parentescoAgenda == Parentesco._PROPIETARIO){
                perfil = c
                break
            }
            
        }
        self.tblPerfil.delegate = self
        self.tblPerfil.dataSource = self
    }
    


}
