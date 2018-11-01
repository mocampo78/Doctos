//
//  ManejadorAgenda.swift
//  AgendaGraficaPractica3
//
//  Created by Macbook on 31/10/18.
//  Copyright © 2018 Banco Azteca. All rights reserved.
//

import Foundation


class ManejadorAgenda{
    var listaEventos : [Evento] = []
    var listaContactos : [Contacto] = []
    
    
    func agregarContacto(contacto : Contacto) ->Void{
        listaContactos.insert(contacto, at: listaContactos.endIndex)
    }
    
    func mostrarContactos() -> Void{
        for contacto in listaContactos {
            print("Contactos \n")
            print("\(contacto.toStringContacto())")
            print("--------------------------------------------------------")
        }
    }
    
    func agregarEvento(ev : Evento) ->Void{
        // primero valida si hay conflictos
        let nombresEv : [String] = obtieneStatusAsistencia(nombresEv: ev.listaContactosAsistentes, fechaDeEvento: ev.fecha, horaEvento: ev.hora)
        ev.listaContactosAsistentes = nombresEv
        self.listaEventos.append(ev)
    }
    
    func obtieneStatusAsistencia(nombresEv : [String], fechaDeEvento : String, horaEvento : Int ) -> [String] {
        var nombresEsteEvento : [String] = nombresEv
        
        for evento in self.listaEventos {
            var i : Int = 0
            while (i < evento.listaContactosAsistentes.count){
                var j : Int = 0
                while(j < nombresEsteEvento.count){
                    if(nombresEsteEvento[j] == evento.listaContactosAsistentes[i]){
                        if(fechaDeEvento == evento.fecha){
                            if(horaEvento == evento.hora){
                                if(!nombresEsteEvento[j].contains("Conflicto:")){
                                    nombresEsteEvento[j] = "(Conflicto:) \(nombresEsteEvento[j])\n"
                                }else{
                                    nombresEsteEvento[j] = "\(nombresEsteEvento[j])\n"
                                }
                            }
                        }
                        break
                    }
                    j = j + 1
                }
                i = i + 1
            }
        }
        return nombresEsteEvento
    }
    
    func obtieneNombrePorId(id : Int) -> String {
        var nombre : String = ""
        for c in listaContactos {
            if c.idContacto == id {
                nombre = c.obtieneNombre();
                break
            }
        }
        return nombre
    }
    
    func mostraEventos() -> Void {
        print(listaEventos)
    }
    
    func simulaAgenda() -> Void{
        var contactNum: Int = 0;
        
        //agregando Contacto
        contactNum = contactNum + 1
        var contacto = Contacto(id: contactNum, nombre: "Juan", apePat: "Perez", apeMat: "Gomez", fNac: "13/04/1980", domic: "Col la Viga", tel: "7345623450", parentesco: Parentesco._PROPIETARIO, empresa: "El programador Feliz", email: "jperezg@hotmail.com")
        agregarContacto(contacto: contacto)
        
        
        //agregando Contacto
        contactNum = contactNum + 1
        contacto = Contacto(id: contactNum, nombre: "Carlos", apePat: "Lopez", apeMat: "Martinez", fNac: "01/08/1986", domic: "Col. Milpa Alta", tel: "555362838", parentesco: Parentesco._TRABAJO, empresa: "El programador Feliz", email: "carloslm@gmail.com")
        agregarContacto(contacto: contacto)
        
        
        
        //agregando Contacto
        contactNum = contactNum + 1
        contacto = Contacto(id: contactNum, nombre: "Luis", apePat: "Jaimes", apeMat: "Toledo", fNac: "01/12/1990", domic: "Coyoacan", tel: "5545767877", parentesco: Parentesco._AMIGO, empresa: "TATTA Consultores", email: "ljt90@gmail.com")
        
        agregarContacto(contacto: contacto)
        
        
        //agregando Contacto
        contactNum = contactNum + 1
        contacto = Contacto(id: contactNum, nombre: "Alfonso", apePat: "Camacho", apeMat: "Orriz", fNac: "13/09/1993", domic: "Calzada de Tlalpan", tel: "5545767877", parentesco: Parentesco._AMIGO, empresa: "Consultores SA", email: "alcogmail.com")
        agregarContacto(contacto: contacto)
        
        
        mostrarContactos()
        
        
        
        
        
         var listaAsistentes = [listaContactos[0].obtieneNombre(), listaContactos[1].obtieneNombre()]
         var evento = Evento(id: 1001, f: "01/11/2018", h: 9, l: "Explanada Elektra", a: "Reunion de Daily Meeting", invitados: listaAsistentes)
         agregarEvento(ev : evento)
        
        
        listaAsistentes = [listaContactos[2].obtieneNombre(), listaContactos[1].obtieneNombre()]
        evento = Evento (id: 1002, f: "30/10/2018", h: 8, l: "World Trade Center", a: "Curso swift Netec", invitados: listaAsistentes)
        agregarEvento(ev : evento)
        
         
         listaAsistentes = [listaContactos[2].obtieneNombre(), listaContactos[1].obtieneNombre()]
         evento = Evento (id: 1003, f: "30/10/2018", h: 8, l: "World Trade Center", a: "Curso swift Netec", invitados: listaAsistentes)
         agregarEvento(ev : evento)
        
        
        listaAsistentes = [listaContactos[0].obtieneNombre(), listaContactos[3].obtieneNombre()]
        evento = Evento (id: 1003, f: "01/11/2018", h: 9, l: "Cafeteria Netec", a: "Entrega de Reconocimientos", invitados: listaAsistentes)
        agregarEvento(ev : evento)
         print("EVENTOS: --------------------------")
         
         
         mostraEventos();
 
    }
}
