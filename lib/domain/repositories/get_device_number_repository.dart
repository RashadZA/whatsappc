import 'package:whatsappc/domain/entities/contact_entity.dart';

abstract class GetDeviceNumberRepository{
  Future<List<ContactEntity>> getDeviceNumbers();
}