import '/model/entity/customer.dart';
import '/model/repository/customer.dart';
import 'request/customer_request.dart';

class CustomerController {
  late final CustomerRepository _customerRepository;
  CustomerController() {
    _customerRepository = CustomerRepository();
  }

  Future<void> registerNewCustomer(CustomerRequest request) async {
    //Agregar información a BD

    _customerRepository.newCustomer(CustomerEntity(
        typeId: request.typeId,
        id: request.id,
        email: request.email,
        name: request.name,
        lastName: request.lastName,
        phoneNumber: request.phoneNumber));
  }

  //TODO: veriticar existencia de usuario

  // Future<void> logout() async {
  //   await _authRepository.signOut();
  // }
}
