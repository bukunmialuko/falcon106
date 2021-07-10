import 'package:falcon106/core/models/product.dart';
import 'package:falcon106/core/services/api.dart';
import 'package:falcon106/helpers/dependency_assembly.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'test_helpers.mocks.dart';

const String UserIdTestKey = 'default_user';

// Note : No factory was mocked
@GenerateMocks([], customMocks: [
  MockSpec<API>(returnNullOnMissingStub: true),
])
List<Product> mockProducts = [
  Product(id: 1, name: "Product1", price: 111, imageUrl: "imageUrl"),
  Product(id: 2, name: "Product2", price: 222, imageUrl: "imageUrl"),
  Product(id: 3, name: "Product3", price: 333, imageUrl: "imageUrl"),
];

@GenerateMocks([http.Client])
MockAPI getAndRegisterAPI() {
  _removeRegistrationIfExists<API>();
  final service = MockAPI();
  when(service.getProducts()).thenAnswer((_) async => mockProducts);
  dependencyAssembler.registerSingleton<API>(service);
  return service;
}

void registerServices() {
  getAndRegisterAPI();
}

void unregisterServices() {
  dependencyAssembler.unregister<API>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (dependencyAssembler.isRegistered<T>()) {
    dependencyAssembler.unregister<T>();
  }
}
