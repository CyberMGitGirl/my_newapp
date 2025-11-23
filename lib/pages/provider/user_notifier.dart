import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_newapp/pages/model/user_detail.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserNotifier extends ChangeNotifier {
  UserDetail? loggedInUser;

  /// Logs in the user... Returns null on success, or error message on failure
  Future<String?> login(String email, String password) async {
    try {
      // Sign in with Firebase Auth
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Fetch user record from Firestore
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(email)
          .get();

      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      loggedInUser = UserDetail.fromJson(data);

      notifyListeners();
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An error occurred";
    } catch (e) {
      return e.toString();
    }
  }

  /// Signs up the user... Returns null on success, or error message on failure.
  Future<String?> signUp({
    required String userName,
    required String password,
    required String email,
  }) async {
    try {
      // Create user on Firebase Auth
      UserCredential user = await FirebaseAuth.instance                                             //can make "final" UserCredential user... instead to quieten yellow warning line
          .createUserWithEmailAndPassword(email: email, password: password);

      // Create UserDetail object
      var userDetail = UserDetail(email: email, name: userName);

      // Store user to Firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(email)
          .set(userDetail.toJson());

      loggedInUser = userDetail;
      notifyListeners();
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An error occurred";
    } catch (e) {
      return e.toString();
    }
  }

                                                                   // Google Sign-In... Returns null upon success, or error message.
                                                                   //call )async {}   
                                                                     // try {
                                                                    //SEP try2 similar to superbase...and this step is only if imported pubdev gooogle signin package into pubspec

                                                                    //WRITE: var signIn = GoogleSignIn.instance; ....then ensure topport package
                                                                    //WRITE: var gSigninAccount ? = await signIn.attemptLightweightAuthentication();
                                                                     // ---->  FirebaseAuth.instance.signInWithCredentials(GoogleAuthProvider()); 
                                                                      //try: await FirebaseAuth.instance.signInWithToken(GoogleAuthProvider());
                                                                 
  Future<String?> signInWithGoogle() async {
    try {
      var instance = GoogleSignIn.instance;
      final GoogleSignInAccount googleUser = await instance.authenticate();             //though needed, removed ? after GoogleSignInAccount ie the nullable sign, to remove blue warning
                                                                                        //or instead of .authenticate, use .attemptLightweightAuthentication();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;         //after = googleUser ...remove !

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      UserCredential user = await FirebaseAuth.instance.signInWithCredential(           // USE THIS INSTEAD OF THE RETURN SUGG BY THE DOCUMENTATION 
        credential,
      );

      var userDetail = UserDetail(
        email: user.user!.email!,
        name: user.user!.displayName ?? "No name",
        profilePicture: user.user!.photoURL ?? "",
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userDetail.email)
          .set(userDetail.toJson());

      loggedInUser = userDetail;
      notifyListeners();
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An error occurred";
    } catch (e) {
      return e.toString();
    }
  }

                                                                              // Logs out the user
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    loggedInUser = null;
    notifyListeners();
  }

                                                                              // Sends password reset email
  Future<String?> forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return null;                                                            // success
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An error occurred";
    } catch (e) {
      return e.toString();
    }
  }
}




/*     ***** COPY WITH CONTEXTS ALL OVER *****

class UserNotifier extends ChangeNotifier {
  UserDetail? loggedInUser;

  void login(BuildContext context, String email, String password) async {
    try {
      // create user on firebase
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      //fetch user record from firestore
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(email)
          .get();

      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

      UserDetail userDetail = UserDetail.fromJson(data);

      loggedInUser = userDetail;

      // take user to home page
      Navigator.of(context).pushReplacementNamed("/home");
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "error occured")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    notifyListeners();
  }

  Future<void> signUp({
    required BuildContext context,
    required String userName,
    required String password,
    required String email,
  }) async {
    try {
      // create user on firebase auth
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // create userdetail object
      var userDetail = UserDetail(email: email, name: userName);

      // store user to firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(email)
          .set(userDetail.toJson());

      loggedInUser = userDetail;

      //Alert user on success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User $userName has been created successfully")),
      );

      // take user to home page
      Navigator.of(context).pushReplacementNamed("/home");
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "error occured")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void signInWithGoogle(BuildContext context) async {
    try {
      var instance = GoogleSignIn.instance;
      final GoogleSignInAccount googleUser = await instance.authenticate();           // removed the ? null

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential user = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      // create userdetail object
      var userDetail = UserDetail(
        email: user.user!.email!,
        name: user.user!.displayName ?? "No name",
        profilePicture: user.user!.photoURL ?? "",
      );

      // store user to firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userDetail.email)
          .set(userDetail.toJson());

      loggedInUser = userDetail;

      // take user to home page
      Navigator.of(context).pushReplacementNamed("/home");
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "error occured")));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    loggedInUser = null;
  }

  void forgotPassword(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}  

*/
