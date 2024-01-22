import 'package:whatsappc/domain/entities/text_message_entity.dart';
import 'package:whatsappc/domain/repositories/firebase_repository.dart';

class GetTextMessagesUseCase{
  final FirebaseRepository repository;

  GetTextMessagesUseCase({required this.repository});

  Stream<List<TextMessageEntity>> call(String channelId){
    return repository.getMessages(channelId);
  }
}