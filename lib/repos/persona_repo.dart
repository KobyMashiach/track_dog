// import 'dart:developer';

// import 'package:track_dog/core/global_vars.dart';
// import 'package:track_dog/core/hive/persona_data_source.dart';
// import 'package:track_dog/models/persona_model/persona_model.dart';
// import 'package:track_dog/services/firestore_data.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class PersonaRepo {
//   PersonaRepo(this.localDB);
//   final collection = FirebaseFirestore.instance.collection('users');
//   final PersonaDataSource localDB;

//   PersonaModel getPersona() {
//     return localDB.getPersona();
//   }

//   Future<dynamic> firstRegister(
//       {required String phoneNumber, required String password}) async {
//     // await localDB.updatePersona(persona: persona);
//     final personaExist =
//         await firestoreCheckIfDocExists(collection, phoneNumber);
//     if (personaExist) {
//       return "exist";
//     }
//     globalUser =
//         globalUser.copyWith(phoneNumber: phoneNumber, password: password);
//     firestoreNewDoc(collection,
//         docName: phoneNumber, values: globalUser.toJson());
//   }

//   Future<void> updatePersona(PersonaModel persona) async {
//     await localDB.updatePersona(persona: persona);
//     final phoneExist =
//         firestoreCheckIfDocExists(collection, persona.phoneNumber);
//     firestoreUpdateDoc(collection, docName: persona.phoneNumber);
//   }
// }
