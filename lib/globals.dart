import 'dart:math';

bool loading = true;

class Departamento {
  static final int maxEmpleadosAdicionales = 10;

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
  static final String correoEmpresa = '@company.org';

  String fullname, username, photoUrl, email;
  int idDepartamento;
  String largePhotoUrl, location, dateOfBirth, registered, phone;

  Empleado(this.fullname, this.username, this.photoUrl);
  Empleado.fromJson(Map<String, dynamic> json) {
    fullname = json['name']['first'] + ' ' + json['name']['last'];
    username = json['name']['first'].toString().toLowerCase().substring(0, 1) +
        json['name']['last'].toString().toLowerCase();
    photoUrl = json['picture']['medium'];
    email = json['name']['first'].toString().toLowerCase().substring(0, 1) +
        json['name']['last'].toString().toLowerCase() +
        correoEmpresa;
    phone = json['phone'];
    largePhotoUrl = json['picture']['large'];
    location = json['location']['city'];
    dateOfBirth = json['dob']['date'];
    registered = json['registered']['date'];
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
  Departamento(0, "Dirección",
      1 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(1, "Ventas",
      2 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(
      2, "I+D", 2 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(3, "Financiero",
      3 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(4, "Producción",
      8 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(5, "Informática",
      4 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(6, "Legal",
      2 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
  Departamento(7, "RR.HH.",
      2 + new Random().nextInt(Departamento.maxEmpleadosAdicionales)),
];

List<Empleado> empleados;
