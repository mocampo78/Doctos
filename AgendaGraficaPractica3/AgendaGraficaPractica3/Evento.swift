//
//  Evento.swift
//  AgendaGraficaPractica3
//
//  Created by Macbook on 31/10/18.
//  Copyright © 2018 Banco Azteca. All rights reserved.
//

import Foundation

class Evento{
    var idEvento : Int = 0
    var fecha : String = ""
    var hora : Int = 0
    var lugar : String = ""
    var asunto : String = ""
    var listaContactosAsistentes : [String] = []
    
    
    init(id: Int, f : String, h : Int, l : String, a: String, invitados : [String]) {
        self.idEvento = id
        self.fecha = f
        self.hora = h
        self.lugar = l
        self.asunto = a
        self.listaContactosAsistentes = invitados
    }
    
    
    func toStringEvento() -> Void {
        print("Fecha Evento: \(self.fecha),  Hora:\(self.hora), Lugar:\(self.lugar),  Asunto:\(self.asunto), Lista Asistentes:\(listaContactosAsistentes)")
    }
    
    
    
}
