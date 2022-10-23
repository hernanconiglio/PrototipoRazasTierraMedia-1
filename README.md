# Batalla en la Tierra Media
###### Por Hernán Coniglio

<img src="img/comunidadDelAnillo.png" >

## Primera Parte
En esta fase, vamos a modelar las razas o especies humanoides que participan en la batalla. Para ello, vamos a definir una jerarquía de clases que represente a las razas y a los personajes de la batalla.
Todas ellas humanoides, saben decir a que raza pertenecen y tienen en común las siguientes características:
* `chispaVital`: un número que arranca en 20, y representa la cantidad de unidades de vida mínima que posee un personaje, independientemente de su raza.
* `estaVivo`: un booleano que indica si el personaje está vivo o muerto.
* `resistencia`: nos dirá un número que representa la cantidad de unidades de vida que puede soportar un personaje antes de morir, y que depende de la raza.
* `poderDeAtaque`: nos dirá un número que representa la cantidad de unidades de poder que posee un personaje para un ataque. Será determinado por la `suerte()` en cada ataque y será un número entero aleatorio entre -10 y 11. Luego, cada raza tendrá un modificador que se sumará a este número.
* `poderDeDefensa`: nos dirá un número que representa la cantidad de unidades de vida que posee un personaje para defenderse de un ataque. Es un 110% de su poder de ataque y cada raza tendrá un modificador que se sumará a este número.
* `nombre`: El nombre que tiene el personaje, y es un string.

Cuando un personaje decide `atacarA(unPersonaje)`: 
* si su poderDeAtaque es mayor que el poderDeDefensa de la víctima, se reducirá la energía vital de la víctima en un valor que es la diferencia entre ambos poderes. 
* si su poderDeAtaque es menor que el poderDeDefensa de la víctima, se reducirá la energía vital del atacante en un valor que es la diferencia entre ambos poderes.
* en caso que la energía vital de alguno de los contendientes llegue a 0, se lo considera muerto y al menos en esta fase, no puede volver a atacar ni recibir ataques.
* cada vez que un personaje ataca a otro, se reduce en 1 su chispaVital. La misma no puede ser menos de 0.

Nos centraremos por ahora en las siguientes razas, y cada uno con sus características particulares:
* ### `Humano`: conoceremos su edad que no cambia, y cada uno tendrá las siguientes características:
  * `energíaVital`: un número que representa la suma de su chispaVital más un valor aleatorio entre 80 y 100 que se calculará al momento que se instancie el nuevo humano.
  * `masaMuscular`: un valor aleatorio entre 30 y 71 que se calculará al momento que se instancie el nuevo humano.
  * `resistencia`: en el caso de los humanos, depende de la edad. Si tiene menos de 4 años, es un 20% de su energiaVital. Entre 4 y 11 años, es un 50%. Entre 12 y 15: 60%. Entre 16 y 17: 80%. Más de 70 años: 70%. En cualquier otro caso, es un 100% de su energiaVital.
  * `poderDeAtaque`: al poder que se calcula por ser humanoide, se le suma su masa muscular y su resistencia.
  * `poderDeDefensa`: es el mismo que le corresponde por ser humanoide.
  * `desarrollarMusculatura`: solo podrá desarrollar musculatura si su energia vital es mayor que 80, en cuyo caso cada vez que un humano la desarrolle, aumentará en 2 su masa muscular hasta un límite máximo de 60, y su energía vital se reduce en 1.

####
* ### `Elfo`: tendrá las siguientes características:
  * `energíaVital`: un número que representa la suma de su chispaVital más un valor aleatorio entre 90 y 110 que se calculará al momento que se instancie el nuevo elfo.
  * `masaMuscular`: un valor aleatorio entre 20 y 51 que se calculará al momento que se instancie el nuevo elfo.
  * `nivelDeMagia`: un valor aleatorio entre 1 y 8 que se calculará al momento que se instancie el nuevo elfo.
  * `resistencia`: en el caso de los elfos, su resistencia es igual a un 100% de su energiaVital.
  * `poderDeAtaque`: al poder que se calcula por ser humanoide, se le suma su masa muscular y su resistencia.
  * `poderDeDefensa`: al que le corresponde por ser humanoide, se le suma su nivelDeMagia.
  * `desarrollarPoderMagico`: solo podrá desarrollarse si su energia vital es mayor que 60, en cuyo caso cada vez que un elfo la desarrolle, aumentará en 3 su nivelDeMagia hasta un límite máximo de 40, y su energía vital se reduce en 1.

####
* ### `Enano`: conoceremos su edad que no cambia, y sus características son:
  * `energíaVital`: un número que representa la suma de su chispaVital más un valor aleatorio entre 75 y 100 que se calculará al momento que se instancie el nuevo enano.
  * `masaMuscular`: un valor aleatorio entre 35 y 45 que se calculará al momento que se instancie el nuevo enano.
  * `nivelDeIra`: un valor aleatorio entre 1 y 1.3 con precisión decimal de 2, que se calculará al momento que se instancie el nuevo enano.
  * `resistencia`: en el caso de los enanos, será igual a su energía vital multiplicado por la suma de su nivel de ira más la edad sobre 50. Para el cálculo de este coeficiente, considerar que la edad mínima del enano es 18 años y la máxima es 350.
  * `poderDeAtaque`: al poder que se calcula por ser humanoide, se le suma la mitad de su masa muscular y su resistencia.
  * `poderDeDefensa`: es el mismo que le corresponde por ser humanoide multiplicado por el coeficiente de nivel de Ira.
  * `practicarRitoSiginTarag`: Este rito es un desafío enano entre dos competidores para ver quién puede romper la mayor cantidad de rocas. Cada vez que lo practica un enano aumenta su nivel de ira en 0.1, no pudiendo ser el mismo mayor que 2.

####
* ### `Hobbit`: sabremos su edad que no cambia, y sus características serán:
  * `energíaVital`: un número que representa la suma de su chispaVital más un valor aleatorio entre 50 y 90 que se calculará al momento que se instancie el nuevo hobbit.
  * `masaMuscular`: un valor aleatorio entre 20 y 30 que se calculará al momento que se instancie el nuevo hobbit.
  * `nivelDeAgilidad`: un valor aleatorio entre 1.1 y 1.8 con precisión decimal de 2, que se calculará al momento que se instancie el nuevo hobbit.
  * `resistencia`: será igual a su energía vital multiplicado por la suma de su nivel de agilidad más la edad sobre 50. Para el cálculo de este coeficiente, considerar la edad mínima de 20 y la máxima de 200.
  * `poderDeAtaque`: al poder que se calcula por ser humanoide, se le suma la mitad de su masa muscular y su resistencia.
  * `poderDeDefensa`: es el mismo que le corresponde por ser humanoide multiplicado por el coeficiente de nivel de agilidad.
  * `entrenarAgilidad`: Cada vez que lo practica un hobbit aumenta su nivel de agilidad en 0.1, no pudiendo ser el mismo mayor que 2.

####
* ### `Orco`: las historias que se escuchan en canciones y leyendas cuentan que los orcos son seres creados por Melkor (Sauron) a partir de los elfos, para combatirlos, pero a diferencia de estos, envejecen aunque su edad no hace ninguna diferencia. Sus características serán:
  * `energíaVital` , `masaMuscular` , `nivelDeMagia` , `resistencia` y `poderDeAtaque` : se definen igual a la de un elfo.
  * `poderDeDefensa`: es igual a su poder de ataque.
  * `desarrollarPoderMagico`: cuando un Orco intenta desarrollar su poder mágico, el mismo no aumenta ni disminuye, pero su energía vital se reduce en 1 siempre que la misma sea mayor que 60.

####
* ### `Istar`: enviados a la Tierra Media por los Valar en la Tercera Edad del Sol para ayudar a las razas libres en su lucha contra Sauron. No envejece y comunmente se los llama Magos. Cada uno tendrá las siguientes características:
  * `masaMuscular`: un valor aleatorio entre 30 y 71 que se calculará al momento que se instancie el nuevo Istar.
  * `color`: existen de 4 colores conocidos: blanco, gris, azul, pardo. El color se asigna al momento de crear un nuevo Istar, y dependiendo del mismo, será el valor de su `poderMagico`:
    * blanco: 60
    * gris: 40
    * azul: 30
    * pardo: 20
  * Los Istar podrán, eventualmente, `evolucionar` a un color superior, pero no podrán retroceder a uno inferior.	De pardos a azules, de azules a grises, de grises a blancos.
  * `energíaVital`: un número que representa la suma de su chispaVital más un valor aleatorio entre 80 y 120 que se calculará al momento que se instancie el nuevo istar.
  * `destrezaConLaEspada`: será un valor aleatorio entre 10 y 20 que se calculará al momento que se instancie el nuevo Istar.
  * `resistencia`: será igual a su energiaVital.
  * `poderDeAtaque`: al poder que se calcula por ser humanoide, se le suma su destreza con la espada, su resistencia y su poder mágico.
  * `poderDeDefensa`: es el mismo que le corresponde por ser humanoide.

####
* ### `Sauron`: El único. No es una raza, sino el mismísimo señor oscuro o se lo conoce también como "el Nigromante". :
* `energíaVital`: comienza con 1300.
* `resistencia`: es igual a su energiaVital.
* `poderDeAtaque`: al poder que se calcula por ser humanoide, se le suma su resistencia.
* `poderDeDefensa`: es el mismo que le corresponde por ser humanoide.

###
### Modelar las clases y objetos correspondientes a las razas y a los personajes, y realizar las pruebas y test necesarios para verificar el correcto funcionamiento de los mismos. Simular batallas entre personajes de la misma raza y de distintas razas, y mostrar por consola el resultado de las mismas.

####
## Segunda Parte

### La comunidad del Anillo
Es una compañía de héroes que se reúnen para combatir a Sauron. De manera individual ningún ser de ninguna raza puede derrotarlo en un ataque directo o en una defensa, por esa razón se reunen varios personajes de diferentes razas en una comunidad.
La original, contaba con los siguientes 9 miembros:
* Frodo Bolsón (Hobbit)
* Sam Gamgee (Hobbit)
* Meriadoc Brandybuck (Hobbit) (lo conocemos como Merry)
* Peregrin Tuk (Hobbit) (lo conocemos como Pippin)
* Aragorn (Humano)
* Legolas (Elfo)
* Gimli (Enano)
* Boromir (Humano)
* Gandalf (Istar)

####
En este modelo, vamos a poder agregar o quitar los `miembros` que queramos a la comunidad, tanto individualmente como por lista de miembros, siempre y cuando se cumplan las siguientes condiciones:
* La comunidad puede tener un máximo de 10 miembros.
* Decimos que `estaLista` para atacar a Sauron cuando tiene al menos 8 miembros y por lo menos 1 miembro de cada raza de las siguientes: `Hobbit`, `Humano`, `Enano`, `Elfo`, `Istar`.
* Si un miembro de la comunidad muere, el mismo deberá ser retirado de la comunidad, y agregado a una lista de `miembrosDifuntos`; la comunidad debe seguir cumpliendo con las condiciones anteriores para poder estar lista para atacar nuevamente y los miembros pueden ser reemplazados en cualquier momento.
* Cuando la comunidad ataca a Sauron, el poder de ataque de la comunidad es la suma de los poderes de ataque de sus miembros.
- Cuando la comunidad es atacada por Sauron, el poder de defensa de la comunidad es la suma de los poderes de defensa de sus miembros.
- Al producirse un ataque, si la comunidad no posee mayor poder que el de Sauron, sus miembros reciben un daño igual a la diferencia entre el poder de ataque o defensa de Sauron y el poder de ataque o defensa de la comunidad, según sea quién ataca; ese valor total a restar, se reparte proporcionalmente entre todos los miembros de la comunidad. Por ejemplo:
  - comunidad ataca a Sauron: poder de ataque de la comunidad = 1000, poder de defensa de Sauron = 1300. Si la comunidad tiene 8 miembros, cada uno recibe 300/8 = 37.5 de daño.

####
También, debemos poder conocer de la comunidad lo siguiente:
* `cantidadDeMiembros`: la cantidad miembros de la comunidad.
* `cantidadDeMiembrosDifuntos`: la cantidad de miembros que murieron en combate.
* `estaLista`: indica si la comunidad está lista o no para atacar a Sauron.
* `poderDeAtaque`: la suma de los poderes de ataque de sus miembros.
* `poderDeDefensa`: la suma de los poderes de defensa de sus miembros.
* `miembrosConPoderDeDefensaMayorAPromedio`: la lista de los miembros que tienen un poder de defensa mayor al promedio de poder de defensa de la comunidad.	
* `todosConMasaMuscularMayorA(unValor)`: indica si todos los miembros tienen una masa muscular mayor al valor indicado.
* `miembroActivoEnLaComunidad(nombreDeMiembro)`: informa si el miembro indicado está activo en la comunidad.
* `vaPerdiendo`: Si la cantidad de miembros de la comunidad que perecieron es mayor que la cantidad de miembros que la comunidad tiene vivos, y además Sauron esta vivo.
* `miembroConMayorPoderDeAtaque`: el miembro de la comunidad con mayor poder de ataque.
* `maximoPoderDeDefensa`: el máximo poder de defensa en la comunidad.
* `algunMiembroConChispaMenorA(unValor)`: si alguno de los miembros de la comunidad tiene una chispaVital menor a unValor.
* `razaConMasMiembros`: la raza con mayor cantidad de miembros en la comunidad.
* `poderDeAtaqueCreciente`: el poder de ataque de los miembros es el mismo o mayor, según el orden en que fueron agregados los miembros. 
