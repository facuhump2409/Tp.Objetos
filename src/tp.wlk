object fuerzaOscura {
	var property valor = 5
	
	method eclipse() { self.valor(self.valor()*2) }
}

/////////////
object nada{
	method poder(){ return 0 }
	
	method valor(){ return 0 }
}
/////////////

object espectroMalefico {
	var nombre = ""
	
	method poder () { return nombre.size() }
	
	method nombre(nuevoNombre){ nombre= nuevoNombre }
	
	method esPoderoso(){ return self.poder() > 15 }
}

object hechizoBasico {
	method poder () { return 10 }
	
	method esPoderoso(){ return self.poder() > 15 }
}

/////////////
object libroHechizos{
	var hechizos = []
	
	method hechizos(nuevosHechizos){ hechizos = nuevosHechizos } //@trate de evitar q se pueda poner el libro de hechizos pero solo logre romper todo
	
	method poder(){ return hechizos.sum({hechizo=>if (hechizo.esPoderoso()) hechizo.poder() else 0}) }
}
/////////////

object espadaDelDestino{
	method valor(){ return 3 }
	
	method esEspejo(){ return false} //@ Un asquete
}

object collarDivino{
	var perlas = 0
	
	method perlas (cantidadDePerlas){ perlas = cantidadDePerlas }
	
	method valor(){ return perlas }
	
	method esEspejo(){ return false} //@ Un asquete
}

object mascaraOscura{
	method valor(){ return 4.max(fuerzaOscura.valor()/2) }
	
	method esEspejo(){ return false} //@ Un asquete
}

/////////////

object cotaDeMalla{
	method poder(){ return 1 }
}

object bendicion{
	method poder(){ return rolando.nivelHechiceria() } 
}//@debe haber forma de que te diga quien usa la armadura sin poner rolando

object hechizo{
	method poder(){ return rolando.hechizoPreferido().poder() }
}//@lo mismo de bendicion

object armadura{
	var valorBase = 2
	
	var refuerzo = nada//cota ó bendicion ó hechizo
		
	method refuerzo(nuevoRef){ refuerzo = nuevoRef }
	
	method valor(){ return valorBase + refuerzo.poder() }
	
	method esEspejo(){ return false} //@ Un asquete
}

object espejo{
	method valor(){ return rolando.mejorArtefacto().valor() }
	
	method esEspejo(){ return true } //@ Un asquete
}

///////////

object rolando {
	var property hechizoPreferido = espectroMalefico //@hace falta chequear si tiene hechizo??
	
	var valorBaseHechizo = 3
	
	var valorBaseLucha = 1
	
	var artefactos = []

	method luchaMayorAHechizo(){ return self.valorLucha()>self.nivelHechiceria() }
	
	method valorBaseLucha(nuevoValor){ valorBaseLucha= nuevoValor }
	
	method removerTodosLosArtefactos(){ artefactos.clear() }
	
	method removerArtefacto(artefactoASacar){ artefactos.remove(artefactoASacar) }
	
	method agregarArtefactos(nuevosArtefactos){artefactos.addAll(nuevosArtefactos) }
	
	method nivelHechiceria() { return (valorBaseHechizo*hechizoPreferido.poder()) +fuerzaOscura.valor() }
	
	method valorLucha(){ return artefactos.sum({artefacto => artefacto.valor()})+valorBaseLucha }
	
	method esPoderoso(){ return hechizoPreferido.esPoderoso() }
	
	///////////
	method estaCargado(){ return artefactos.size()>=5 }
	
	method mejorArt(){ 
		return artefactos.max({artefacto=>if (!artefacto.esEspejo()) artefacto.valor() else 0})
	}
	method mejorArtefacto(){
		if ( !self.mejorArt().esEspejo() ) return self.mejorArt()
		else return nada
	}
//if (artefacto.equals(espejo)) return artefacto else return nada. se puede hacer esto?? y sacar los .esEspejo()	
	///////////
}




