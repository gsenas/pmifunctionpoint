import 'dart:math';

class Departamento {
  static final int maxEmpleadosPorDpto = 12;

  String nombre;
  int headCount;
  Departamento(this.nombre, this.headCount);

  static int totalEmpleados(List _departamentos) {
    int sum = 0;
    for (Departamento d in _departamentos) {
      sum += d.headCount;
    }

    return sum;
  }
}

class Empleado {
  static final String companyUrl = '@fpcompany.org';

  String fullname, username, photoUrl, email;
  Empleado(this.fullname, this.username, this.photoUrl);
  Empleado.fromJson(Map<String, dynamic> json)
      : fullname = json['name']['first'] + ' ' + json['name']['last'],
       //username = json['login']['username'],
        username = json['name']['first'].toString().toLowerCase().substring(0,1)+json['name']['last'].toString().toLowerCase(),
        photoUrl = json['picture']['medium'];
}

List departamentos = [
  Departamento("Dirección",1+new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento("Ventas",2+new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento("I+D",2+new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento("Financiero",2+new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento("Producción",10+new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento("Informática",2+new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento("Legal",1+new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento("RR.HH.",1+new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento("Formación",1+new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento("Soporte",1+new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
];

