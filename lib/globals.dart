import 'dart:math';

bool loading = true;

class Departamento {
  static final int maxEmpleadosAdicionales = 12;

  int id;
  String nombre;
  int headCountDeseado;
  Departamento(this.id, this.nombre, this.headCountDeseado);

  static int totalHeadCountDeseado(List _departamentos) {
    int sum = 0;
    for (Departamento d in _departamentos) {
      sum += d.headCountDeseado;
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
  static final String correoEmpresa = '@fpcompany.org';

  String fullname, username, photoUrl, email;
  int idDepartamento;
  Empleado(this.fullname, this.username, this.photoUrl);
  Empleado.fromJson(Map<String, dynamic> json) {
    fullname = json['name']['first'] + ' ' + json['name']['last'];
    username = json['name']['first'].toString().toLowerCase().substring(0, 1) +
        json['name']['last'].toString().toLowerCase();
    photoUrl = json['picture']['medium'];
    email = json['name']['first'].toString().toLowerCase().substring(0, 1) +
        json['name']['last'].toString().toLowerCase() +
        correoEmpresa;
  }

  void asignarDepartamentoAzar(_departamentos, _empleados) {
    try {
      int _indiceDepartamento;
      do {
        _indiceDepartamento = new Random().nextInt(_departamentos.length);
      } while (
      _departamentos[_indiceDepartamento].empleadosAsignados(_empleados) >=
          _departamentos[_indiceDepartamento].headCountDeseado);
      this.idDepartamento = _departamentos[_indiceDepartamento].id;
    } catch (e) {
      print('Excepción capturada: ' + e.toString());
    }
  }
}

List departamentos = [
  Departamento(1, "Dirección",
      1 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(2, "Ventas",
      2 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(
      3, "I+D", 2 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(4, "Financiero",
      2 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(5, "Producción",
      10 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(6, "Informática",
      2 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(7, "Legal",
      1 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(8, "RR.HH.",
      1 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(9, "Formación",
      1 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(10, "Soporte",
      1 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
];

/*
List departamentos = [
Departamento(1,"Dirección", 1),
Departamento(2,"Ventas", 2),
Departamento(3,"I+D", 2),
Departamento(4,"Financiero", 2),
Departamento(5,"Producción",10),
Departamento(6,"Informática",2),
Departamento(7,"Legal", 1),
Departamento(8,"RR.HH.", 1),
Departamento(9,"Formación", 1),
Departamento(10,"Soporte", 1),
];
*/

List<Empleado> empleados;
