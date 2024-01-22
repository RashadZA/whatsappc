import 'package:whatsappc/domain/entities/user_entity.dart';
import 'package:whatsappc/domain/repositories/firebase_repository.dart';

class GetAllUserUseCase{
  final FirebaseRepository repository;

  GetAllUserUseCase({required this.repository});

  Stream<List<UserEntity>> call(){
    return repository.getAllUsers();
  }

}