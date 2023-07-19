import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
 
const String USER_COLLECTION ="Users";
const String CHAT_COLLECTION = "Chats";
const String MESSAGES_COLLECTION = "Messages";

class DatabaseService {

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  DatabaseService(){}


  Future<void> createUser(String _uid, String _email, String _name, String _imageURL) async{
    try {
      await _db.collection(USER_COLLECTION).doc(_uid).set({
        "email":_email,
        "image": _imageURL,
        "last_active": DateTime.now().toUtc(),
        "name": _name,
      }
    );
    } catch (e) {
      print(e);
    }
  }

  Future<DocumentSnapshot> getUser(String _uid) {
    return _db.collection(USER_COLLECTION).doc(_uid).get();
  }

  // ignore: no_leading_underscores_for_local_identifiers
  Future<void> updateUserLastSeenTime(String _uid) async{
    try {
      await _db.collection(USER_COLLECTION).doc(_uid).update({
        "last_active": DateTime.now().toUtc(),
      },
    );
    } catch (e) {
      print(e);
      
      
    }
    return null;
  }
}