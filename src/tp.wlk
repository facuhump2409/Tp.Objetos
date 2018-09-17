object fuerzaOscura {
	var property valor = 5
	
	method eclipse() { self.valor(self.valor()*2) }
}

/////////////
object nada{
	method poder(guerrero){ return 0 }
	
	method valor(guerrero){ return 0 }
}
/////////////

object espectroMalefico {
	var nombre = ""
	
	method poder (guerrero) { return nombre.size() }
	
	method nombre(nuevoNombre){ nombre= nuevoNombre }
	
	method esPoderoso(guerrero){ return self.poder(guerrero) > 15 }
}

object hechizoBasico {
	method poder (guerrero) { return 10 }
	
	method esPoderoso(guerrero){ return false }
}

/////////////
object libroHechizos{
	var hechizos = []
	
	method filtrarLibros(nuevosHechizos){
		if (nuevosHechizos.contains(self)){ 
			nuevosHechizos.remove(self)
			return self.filtrarLibros(nuevosHechizos)
			}
		else return nuevosHechizos
	}
	
	method hechizos(nuevosHechizos){ hechizos.addAll(self.filtrarLibros(nuevosHechizos))} 
	
	method poder(guerrero){ return hechizos.filter({hechizo=>hechizo.esPoderoso(guerrero)}).sum({hechizo=>hechizo.poder(guerrero)}) }
}
/////////////

object espadaDelDestino{
	method valor(guerrero){ return 3 }
	
	method esEspejo(){ return false} //@ Un asquete
}

object collarDivino{
	var perlas = 0
	
	method perlas (cantidadDePerlas){ perlas = cantidadDePerlas }
	
	method valor(guerrero){ return perlas }
	
	method esEspejo(){ return false} //@ Un asquete
}

object mascaraOscura{
	method valor(guerrero){ return 4.max(fuerzaOscura.valor()/2) }
	
	method esEspejo(){ return false} //@ Un asquete
}

/////////////

object cotaDeMalla{
	method poder(guerrero){ return 1 }
}

object bendicion{
	method poder(guerrero){ return guerrero.nivelHechiceria() } 
}//@debe haber forma de que te diga quien usa la armadura sin poner rolando

object hechizo{
	method poder(guerrero){ return guerrero.poderHechizoPreferido() }
}//@lo mismo de bendicion

object armadura{
	var valorBase = 2
	
	var refuerzo = nada//cota ó bendicion ó hechizo
		
	method refuerzo(nuevoRef){ refuerzo = nuevoRef }
	
	method valor(guerrero){ return valorBase + refuerzo.poder(guerrero) }
	
	method esEspejo(){ return false } //@ Un asquete
}

object espejo{
	method valor(guerrero){ return guerrero.valorMejorArtefacto() }
	
	method esEspejo(){ return true } //@ Un asquete
}

///////////

object rolando {
	var property hechizoPreferido = espectroMalefico //@hace falta chequear si tiene hechizo??
	
	var valorBaseHechizo = 3
	
	var valorBaseLucha = 1
	
	var artefactos = []
	method artefactos(){return artefactos}
	
	method luchaMayorAHechizo(){ return self.valorLucha()>self.nivelHechiceria() }
	
	method valorBaseLucha(nuevoValor){ valorBaseLucha= nuevoValor }
	
	method removerTodosLosArtefactos(){ artefactos.clear() }
	
	method removerArtefacto(artefactoASacar){ artefactos.remove(artefactoASacar) }
	
	method agregarArtefactos(nuevosArtefactos){artefactos.addAll(nuevosArtefactos) }
	
	method nivelHechiceria() { return (valorBaseHechizo*hechizoPreferido.poder(self)) +fuerzaOscura.valor() }
	
	method valorLucha(){ return artefactos.sum({artefacto => artefacto.valor(self)})+valorBaseLucha }
	
	method esPoderoso(){ return hechizoPreferido.esPoderoso(self) }
	
	///////////
	method estaCargado(){ return artefactos.size()>=5 }
	
	method soloTieneEspejo(){
		return artefactos.size()==1 && artefactos.contains(espejo) //@contains no es de orden superior, esto es medio sucio
	}
	
	method valorMejorArtefacto(){ 
		if (self.soloTieneEspejo()) return 0
		else return artefactos.filter({artefacto=>!artefacto.esEspejo()}).map({artefacto=>artefacto.valor(self)}).max()
	}
	
	method poderHechizoPreferido(){
		return hechizoPreferido.poder()
	}
	//method mejorArtefacto(){
	//	if ( !self.mejorArt().esEspejo() ) return self.mejorArt()
	//	else return nada
	//}
//if (artefacto.equals(espejo)) return artefacto else return nada. se puede hacer esto?? y sacar los .esEspejo()	
	///////////
}




