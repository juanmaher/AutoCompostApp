import 'package:autocompost/app/domain/inputs/sign_up.dart';
import 'package:autocompost/app/domain/repositories/sign_up_repository.dart';
import 'package:autocompost/app/utils/composter_id_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUpRepositoryImpl implements SignUpRepository {

  final FirebaseAuth _auth;

  SignUpRepositoryImpl(this._auth);

  @override
  Future<SignUpResponse> register(SignUpData data) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      await userCredential.user!.updateDisplayName(
        "${data.name} ${data.lastname}",
      );

      //get reference
      DatabaseReference ref = FirebaseDatabase.instance.ref().child('/users');
      //build child
      ref.child(userCredential.user!.uid).update({
        'name': data.name,
        'lastname': data.lastname,
        'composter_id': data.composterId
      },);

      if (data.composterId == null) {
        return SignUpResponse(null, userCredential.user!);
      }

      if (await isValidComposterId(data.composterId.toString())) {
        return SignUpResponse(null, userCredential.user!);
      } else {
        return SignUpResponse(null, null);
      }

    } on FirebaseAuthException catch(e) {
      return SignUpResponse(e.code, null);
    }
  }

}