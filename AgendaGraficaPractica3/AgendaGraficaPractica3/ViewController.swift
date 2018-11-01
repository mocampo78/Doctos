//
//  ViewController.swift
//  AgendaGraficaPractica3
//
//  Created by Macbook on 31/10/18.
//  Copyright © 2018 Banco Azteca. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let manejadorAgenda = ManejadorAgenda()
    
    @IBOutlet weak var tblContactos: UITableView!
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.manejadorAgenda.listaContactos.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.manejadorAgenda.listaContactos[section].obtieneNombre()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        //En la celda se coloca la direccion
        let row = indexPath.row
        let sec = indexPath.section
        switch row {
        case 0:
            celda.textLabel?.text = "Domicilio: \(self.manejadorAgenda.listaContactos[sec].domicilio)"
            break
        case 1:
            celda.textLabel?.text = "Email: \(self.manejadorAgenda.listaContactos[sec].email!)"
            break
        case 2:
            celda.textLabel?.text = "Empresa: \(self.manejadorAgenda.listaContactos[sec].empresa)"
            break
        case 3:
            celda.textLabel?.text = "Edad: \(self.manejadorAgenda.listaContactos[sec].edad)"
            break
        case 4:
            celda.textLabel?.text = "Parentesco: \(self.manejadorAgenda.listaContactos[sec].parentescoAgenda.rawValue)"
            break
        default:
            celda.textLabel?.text = "Telefono: \(self.manejadorAgenda.listaContactos[sec].telefono!)"
        }
        return celda
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manejadorAgenda.simulaAgenda()
        self.tblContactos.dataSource = self
        self.tblContactos.delegate = self
    }


    
}

