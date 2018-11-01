//
//  ViewController2.swift
//  AgendaGraficaPractica3
//
//  Created by Macbook on 31/10/18.
//  Copyright © 2018 Banco Azteca. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let manejadorAgenda = ManejadorAgenda()
    
    @IBOutlet weak var tblEventos: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.manejadorAgenda.listaEventos.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.manejadorAgenda.listaEventos[section].asunto
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        let row = indexPath.row
        let sec = indexPath.section
        switch row {
        case 0:
            celda.textLabel?.text = "Fecha del Evento: \(self.manejadorAgenda.listaEventos[sec].fecha)"
            break
        case 1:
            celda.textLabel?.text = "Hora del Evento: \(self.manejadorAgenda.listaEventos[sec].hora)"
            break
        case 2:
            celda.textLabel?.text = "Lugar del Evento: \(self.manejadorAgenda.listaEventos[sec].lugar)"
            break
        default:
            celda.textLabel?.text = "Asistentes: \(self.manejadorAgenda.listaEventos[sec].listaContactosAsistentes)"
        }
        return celda
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        manejadorAgenda.simulaAgenda()
        self.tblEventos.dataSource = self
        self.tblEventos.delegate = self
    }
    

    

}
