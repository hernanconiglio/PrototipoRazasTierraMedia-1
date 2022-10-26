import Razas.*

object comunidadDelAnillo {
	const property miembros = #{}
	const property razas = #{hobbit,humano,enano,elfo,istar}
	const miembrosDifuntos = #{}
	
	method agregarMiembros(unConjunto) {
		if((miembros.size() + unConjunto.size()) > 10 ) 
			self.error("No se puede superar 10 miembros")
		miembros.addAll(unConjunto)
	}
	
	method estaLista() = miembros.size() >= 8 && self.existenTodasLasRazas()
	
	method existenTodasLasRazas() = razas.all({r=> self.miembrosSiTiene(r)})
	method miembrosSiTiene(unaRaza) = miembros.any({m=>m.raza()==unaRaza})
	method existenTodas2() = razas.difference(miembros.map({m=>m.raza()})).isEmpty()
	
	method retirarMiembrosDifuntos() {
		
	}
}
