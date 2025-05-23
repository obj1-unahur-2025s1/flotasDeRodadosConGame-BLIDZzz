import rodados.*

class Dependencia {
  const property flota = []
  var property cantEmpleados
  
  method agregarAFlota(rodado) {
    flota.add(rodado)
  }
  
  method quitarDeFlota(rodado) {
    flota.remove(rodado)
  }
  
  method pesoTotalFlota() = flota.sum({ x => x.peso() })
  
  method estaBienEquipada() = self.alMenosHay(3) and self.alMenosVaA(100)
  
  method alMenosHay(cantidad) = flota.size() >= cantidad
  
  method alMenosVaA(km) = flota.all({ x => x.velocidadMaxima() >= km })
  
  method capacidadTotalEnColor(color) = self.flotaEnColor(color).sum(
    { x => x.capacidad() }
  )
  
  method flotaEnColor(color) = flota.filter({ x => x.color() == color })
  
  method colorDelRodadoMasRapido() = flota.max(
    { x => x.velocidadMaxima() }
  ).color()
  
  method capacidadFaltante() = (cantEmpleados - self.capacidadFlota()).max(0)
  
  method capacidadFlota() = flota.sum({ x => x.capacidad() })
  
  method esGrande() = (flota.size() >= 5) and (cantEmpleados >= 40)
}