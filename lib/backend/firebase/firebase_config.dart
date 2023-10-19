import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAZdy1xTO2QwSawacgXdsKvzB2cfmjei9o",
            authDomain: "samriddhimart-f065c.firebaseapp.com",
            projectId: "samriddhimart-f065c",
            storageBucket: "samriddhimart-f065c.appspot.com",
            messagingSenderId: "80082002672",
            appId: "1:80082002672:web:dc260237c385c2976e5835",
            measurementId: "G-THLG7W411Q"));
  } else {
    await Firebase.initializeApp();
  }
}
