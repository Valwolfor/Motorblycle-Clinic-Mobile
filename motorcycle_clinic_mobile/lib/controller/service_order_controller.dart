import '/model/repository/customer.dart';
import '../model/repository/motorcycle.dart';
import '/model/entity/customer.dart';
import '/model/entity/motorcycle.dart';

//*Este controlador ejecuta las acciones de todas las pestañas del registro de la HV *//

class ServiceOrderController {
  //Repositorios pa guardar
  late CustomerRepository _repositoryCustomer;
  late MotorcycleRepository _repositoryMotorcycle;

  ServiceOrderController() {
    _repositoryMotorcycle = MotorcycleRepository();
  }

  Future<void> saveCustomer(CustomerEntity customer) async {
    await _repositoryCustomer.newCustomer(customer);
  }

  Future<void> saveMotorcycle(MotorcycleEntity motorcycle) async {
    await _repositoryMotorcycle.newMotorcycle(motorcycle);
  }
}
