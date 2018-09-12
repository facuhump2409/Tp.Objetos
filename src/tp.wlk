object fuerzaOscura {
	var property valor = 5
	method eclipse() {
		self.valor(self.valor()*2)
	}
}
object espectroMalefico {
	var nombre
	method poder () {
		return nombre.size()
	}
	method nombre(nuevoNombre){
		nombre= nuevoNombre
	}
	method esPoderoso(){
		return self.poder() > 15
	}
}

object hechizoBasico {
	method poder () {
		return 10
	}
	method esPoderoso(){
		return self.poder() > 15
	}
}

object espadaDelDestino{
	method valor(){
		return 3
	}
}

object collarDivino{
	var perlas
	method perlas (cantidadDePerlas){
		perlas = cantidadDePerlas
	}
	method valor(){
		return perlas
	}
}

object mascaraOscura{
	method valor(){
		return 4.max(fuerzaOscura.valor()/2)
	}
}

object rolando {
	var hechizoPreferido = espectroMalefico
	var valorBaseHechizo = 3
	var valorBaseLucha = 1
	var artefactos = []
	method valorLucha(){
		return artefactos.sum({artefacto => artefacto.valor()})+valorBaseLucha
	}
	method luchaMayorAHechizo(){
		return self.valorLucha()>self.nivelHechiceria()
	}
	method valorBaseLucha(nuevoValor){
		valorBaseLucha= nuevoValor
	}
	method removerTodosLosArtefactos(){
		artefactos.clear()
	}
	method removerArtefacto(artefactoASacar){
		artefactos.remove(artefactoASacar)
	}
	method agregarArtefactos (nuevosArtefactos){
		artefactos.addAll(nuevosArtefactos)
	}
	method hechizoPreferido(nuevoHechizo){
		hechizoPreferido = nuevoHechizo
	}
	method nivelHechiceria () {
		return (valorBaseHechizo*hechizoPreferido.poder()) +fuerzaOscura.valor()
	}
	method esPoderoso(){
		return hechizoPreferido.esPoderoso()
	}
}