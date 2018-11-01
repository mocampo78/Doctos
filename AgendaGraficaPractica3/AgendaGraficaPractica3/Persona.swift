//
//  Persona.swift
//  AgendaGraficaPractica3
//
//  Created by Macbook on 31/10/18.
//  Copyright © 2018 Banco Azteca. All rights reserved.
//

import Foundation

class Persona{
    var nombre : String = ""
    var apePat : String = ""
    var apeMat : String = ""
    var fechaNac : String = ""
    var edad : Int = 0
    
    
    init(nombre : String, apePat : String, apeMat : String, fechaNac: String){
        self.nombre = nombre
        self.apePat = apePat
        self.apeMat = apeMat
        self.fechaNac = fechaNac    // debe llevar este formato dd/MM/yyyy
        self.edad = calculaEdad(fNac: fechaNac)
    }
    
    func calculaEdad(fNac : String) -> Int {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd/MM/yyyy"
        let dateFromString = dateStringFormatter.date(from: fNac)
        let edad = Calendar.current.dateComponents([.year], from: dateFromString!, to :Date())
        let edad1 = Int (edad.year!)
        return edad1
    }
    
    func toStringPersona () -> Void {
        print ("Datos\nNombre: \(self.nombre),      Ape. Paterno:\(self.apePat),        Ape. Materno: \(self.apeMat),        fecha Nac: \(self.fechaNac),      edad: \(self.edad)")
    }
    
    func obtieneNombre() -> String {
        return "\(self.nombre) \(self.apePat) \(self.apeMat)"
    }
}
