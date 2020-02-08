import 'dart:math';

bool loading = true;


class Departamento {
  static final int maxEmpleadosPorDpto = 12;

  int id;
  String nombre;
  int headCount;
  Departamento(this.id, this.nombre, this.headCount);

  static int totalEmpleados(List _departamentos) {
    int sum = 0;
    for (Departamento d in _departamentos) {
      sum += d.headCount;
    }

    return sum;
  }

  int empleadosAsignados(_empleados) {
    int sum = 0;
    for (Empleado e in _empleados) {
      if (e.idDepartamento == this.id) {
        sum += 1;
      }
    }

    return sum;
  }
}

class Empleado {
  static final String companyUrl = '@fpcompany.org';
  static int ultimoDptoAsignado = 1;

  String fullname, username, photoUrl, email;
  int idDepartamento;
  Empleado(this.fullname, this.username, this.photoUrl);
  Empleado.fromJson(Map<String, dynamic> json) {
    fullname = json['name']['first'] + ' ' + json['name']['last'];
    username = json['name']['first'].toString().toLowerCase().substring(0, 1) + json['name']['last'].toString().toLowerCase();
    photoUrl = json['picture']['medium'];
    email = json['name']['first'].toString().toLowerCase().substring(0, 1) + json['name']['last'].toString().toLowerCase() + companyUrl;
  }

  void asignarDepartamentoAzar() {
    this.idDepartamento = 1 + new Random().nextInt(departamentos.length);
  }
}

List departamentos = [
  Departamento(1,
      "Dirección", 1 + new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento(2,
      "Ventas", 2 + new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento(3,
      "I+D", 2 + new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento(4,
      "Financiero", 2 + new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento(5,"Producción",
      10 + new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento(6,"Informática",
      2 + new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento(7,
      "Legal", 1 + new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento(8,
      "RR.HH.", 1 + new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento(9,
      "Formación", 1 + new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
  Departamento(10,
      "Soporte", 1 + new Random().nextInt(Departamento.maxEmpleadosPorDpto)),
];

List<Empleado> empleados;
