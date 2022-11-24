import '/model/entity/customer.dart';
import '/model/repository/customer.dart';
import 'request/customer_request.dart';
import 'request/id_request.dart';

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
        name: request.name,
        lastName: request.lastName,
        email: request.email,
        phoneNumber: request.phoneNumber));
  }

  //veriticar existencia de usuario
  Future<IdRequest> getCustomer(IdRequest request) async {
    var customer = await _customerRepository.findById(request.id!);

    // var nameUser = "${user.name} ${user.lastName}";
    return IdRequest(
      id: customer.id,
    );
  }
  // Future<void> logout() async {
  //   await _authRepository.signOut();
  // }
}
