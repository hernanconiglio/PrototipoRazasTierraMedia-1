import Razas.*

object comunidadDelAnillo {
	const property miembros = []
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
		miembros.forEach({
			m => self.trasladarMiembroDifunto(m)
		})
	}
	
	method trasladarMiembroDifunto(unMiembro) {
		if(!unMiembro.estaVivo()) { 
			miembros.remove(unMiembro)
			miembrosDifuntos.add(unMiembro)
			}
	}
	
	method poderDeAtaque() = miembros.sum({m=>m.poderDeAtaque()})
	method poderDeDefensa() = miembros.sum({m=>m.poderDeDefensa()})
	method atacarA(unPersonaje) {
		if(self.estaLista() && unPersonaje.estaVivo()) 
			self.producirAtaque(unPersonaje)
	}
	
	method producirAtaque(victima) {
		if(self.mayorPoderQue(victima)) 
			victima.reducirEnergia(self.difenciaDePoderes(victima))
		else self.reducirEnergia(self.difenciaDePoderes(victima))
	}
	method mayorPoderQue(unPersonaje) = self.poderDeAtaque() > unPersonaje.poderDeDefensa()
	method difenciaDePoderes(unPersonaje) = (self.poderDeAtaque() - unPersonaje.poderDeDefensa()).abs()
	method reducirEnergia(unValor) {
		miembros.forEach({
			m => m.reducirEnergia(unValor/miembros.size())
		})
	}
	method cantidadDeMiembros() = miembros.size()
	method cantidadDeMiembrosDifuntos() = miembrosDifuntos.size()
	
	method miembrosPoderDefensaMayorPromedio() = miembros.filter({
		m => m.poderDeDefensa() > self.promedioDeDefensa()
	})
	method promedioDeDefensa() = self.poderDeDefensa() / self.cantidadDeMiembros()
	method todosConMasaMuscularMayorA(unValor) = miembros.all({
		m => m.masaMuscular() > unValor
	})
	method miembroActivoEnLaComunidad(unMiembro) = miembros.contains(unMiembro)
	
	method vaPerdiendo() = 
		self.cantidadDeMiembrosDifuntos() > self.cantidadDeMiembros() && sauron.estaVivo()
		
	method miembroConMayorPoderDeAtaque() = miembros.max({m => m.poderDeAtaque()})
	method maximoPoderDeDefensa() = miembros.max({m => m.poderDeDefensa()}).poderDeDefensa()
	method algunMiembroConChispaMenorA(unValor) = miembros.any({m=>m.chispaVital() < unValor})
	
	method razaConMasMiembros() = self.razas().max({r=>self.cantidadMiembrosDeUnaRaza(r)})
	
	method razas() = miembros.map({m=>m.raza()}).asSet()
	
	method cantidadMiembrosDeUnaRaza(unaRaza) = miembros.count({m => m.raza() == unaRaza})
	
	method poderDeAtaqueCreciente() = 
		if(!miembros.isEmpty()) 
			(0..miembros.size()-2).all({
				indice => miembros.get(indice).poderDeAtaque() <= miembros.get(indice+1).poderDeAtaque()
			})
		else false
		
	method miembrosMasPoderosos(cantidad) = 
		self.miembrosPorOrdenDePoderDeAtaque().take(cantidad)
	
	method miembrosPorOrdenDePoderDeAtaque() = miembros.sortedBy({
		x, y => x.poderDeAtaque() > y.poderDeAtaque()
	})
}



