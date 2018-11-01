//
//  Domicilio.swift
//  AgendaGraficaPractica3
//
//  Created by Macbook on 31/10/18.
//  Copyright © 2018 Banco Azteca. All rights reserved.
//

import Foundation

class Domicilio{
    var calle : String = ""
    var numero : Int = 0
    var colonia : String = ""
    var poblacion : String = ""
    var municipio : String = ""
    var estado: String = ""
    var cp: Int = 0
    init(calle: String, numero : Int, colonia : String, poblacion : String, municipio : String, estado : String, cp : Int) {
        self.calle = calle
        self.numero = numero
        self.poblacion = poblacion
        self.municipio = municipio
        self.estado = estado
        self.cp = cp
    }
    
    func toStringDomicilio() -> Void{
        print("Domicilio\n  Calle: \(self.calle),       Num.: \(self.numero),       Col: \(self.colonia),      Poblacion:\(self.poblacion),     Municipio:\(self.municipio),        Estado:\(self.estado),      CP:\(self.cp)")
    }
    
}
