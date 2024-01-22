import 'package:whatsappc/data/localDatasource/local_datasource.dart';
import 'package:whatsappc/domain/entities/contact_entity.dart';
import 'package:whatsappc/domain/repositories/get_device_number_repository.dart';

class GetDeviceNumberRepositoryImpl implements GetDeviceNumberRepository{
  final LocalDataSource localDataSource;

  GetDeviceNumberRepositoryImpl({required this.localDataSource});
  @override
  Future<List<ContactEntity>> getDeviceNumbers() {
    return localDataSource.getDeviceNumbers();
  }

}