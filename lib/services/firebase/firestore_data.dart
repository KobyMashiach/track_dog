import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<dynamic> firestoreGetCollection(
    CollectionReference<Map<String, dynamic>> collection) async {
  final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collection.get();
  if (querySnapshot.docs.isNotEmpty) {
    Map<String, Map<String, dynamic>> dataMap = {};
    querySnapshot.docs.forEach((doc) {
      dataMap[doc.id] = doc.data();
    });
    return dataMap;
  }
}

void firestoreNewDoc(CollectionReference<Map<String, dynamic>> collection,
    {required String docName, Map<String, dynamic>? values}) async {
  collection.doc(docName).set(values ?? {});
}

void firestoreUpdateDoc(CollectionReference<Map<String, dynamic>> collection,
    {required String docName, Map<String, dynamic>? values}) async {
  collection.doc(docName).update(values ?? {});
}

void firestoreClearDoc(CollectionReference<Map<String, dynamic>> collection,
    {required String docName}) async {
  collection.doc(docName).set({});
}

firestoreDeleteField(CollectionReference<Map<String, dynamic>> collection,
    {required String docName, required String fieldName}) {
  collection.doc(docName).update({fieldName: FieldValue.delete()});
}

Future<Map<String, dynamic>> firestoreGetDocValues(
    CollectionReference<Map<String, dynamic>> collection, String doc) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await collection.doc(doc).get();
    if (querySnapshot.exists) {
      Map<String, dynamic> data = querySnapshot.data()!;
      return data;
    }
  } catch (e) {
    log(e.toString());
  }
  return {};
}

Future<dynamic> firestoreGetDataFromDoc(
    CollectionReference<Map<String, dynamic>> collection,
    String doc,
    String value) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await collection.doc(doc).get();
    if (querySnapshot.exists) {
      Map<String, dynamic> data = querySnapshot.data()!;
      return data[value];
    }
  } catch (e) {
    log(e.toString());
  }
}

Future<bool> firestoreCheckIfDocExists(
    CollectionReference<Map<String, dynamic>> collection,
    String docName) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> docSnapshot =
        await collection.doc(docName).get();
    return docSnapshot.exists;
  } catch (e) {
    log(e.toString());
    return false;
  }
}

// Future<String> uploadImageToStorage(
//     {required String path,
//     required XFile imageFile,
//     required String imageName}) async {
//   String downloadUrl = "";

//   Reference storageReference =
//       FirebaseStorage.instance.ref().child('$path/$imageName');
//   UploadTask uploadTask = storageReference.putFile(File(imageFile.path));
//   await uploadTask.whenComplete(
//       () async => downloadUrl = await storageReference.getDownloadURL());
//   return downloadUrl;
// }

Future<void> deleteFilesFromFolderOnStorage(String folderPath) async {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final ListResult result = await storage.ref(folderPath).listAll();
  for (final Reference ref in result.items) {
    await ref.delete();
  }
}
