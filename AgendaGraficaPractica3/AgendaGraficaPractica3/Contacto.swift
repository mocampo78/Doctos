//
//  Contacto.swift
//  AgendaGraficaPractica3
//
//  Created by Macbook on 31/10/18.
//  Copyright © 2018 Banco Azteca. All rights reserved.
//

import Foundation


class Contacto : Persona {
    var idContacto : Int = 0
    var telefono : String?
    var parentescoAgenda: Parentesco = Parentesco._NOCONOCIDO
    var domicilio : String = ""
    var empresa : String = ""
    var email : String?
    var listaEventosContacto : [Int] = []
    init(id: Int, nombre : String, apePat : String, apeMat : String, fNac: String, domic: String, tel : String?, parentesco: Parentesco, empresa : String, email : String?){
        super.init(nombre: nombre, apePat: apePat, apeMat: apeMat, fechaNac: fNac)
        self.idContacto = id
        self.empresa = empresa
        self.email = email
        if let t = tel {
            self.telefono = t
        }else{
            self.telefono="Sin Numero"
        }
        self.parentescoAgenda = parentesco
        self.domicilio = domic
    }
    
    func obtieneListaEventos () -> Array<Int> {
        return self.listaEventosContacto;
    }
    
    func toStringContacto() -> Void {
        print("Datos de Contacto \(self.idContacto):\n\(self.toStringPersona()),      domicilio:\(self.domicilio),        Telefono:\(self.telefono!),     Parentesco:\(self.parentescoAgenda.rawValue)")
    }
    
}
