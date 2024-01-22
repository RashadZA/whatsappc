import 'package:contacts_service/contacts_service.dart';
import 'package:whatsappc/domain/entities/contact_entity.dart';

abstract class LocalDataSource{
  Future<List<ContactEntity>> getDeviceNumbers();
}

class LocalDataSourceImpl implements LocalDataSource{
  @override
  Future<List<ContactEntity>> getDeviceNumbers()async {
    List<ContactEntity> contacts=[];
    final getContactsData= await ContactsService.getContacts();

    for (var myContact in getContactsData) {
      myContact.phones?.forEach((phoneData) {
        contacts.add(ContactEntity(
          phoneNumber: phoneData.value ?? "",
          label: myContact.displayName ?? "", uid: myContact.identifier  ?? "", status: myContact.familyName  ?? "",
        ));
      });
    }
    return contacts;
  }

}