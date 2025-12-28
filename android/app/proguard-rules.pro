## Flutter wrapper
 -keep class androidx.lifecycle.DefaultLifecycleObserver
 -keep class io.flutter.app.** { *; }
 -keep class io.flutter.plugin.** { *; }
 -keep class io.flutter.util.** { *; }
 -keep class io.flutter.view.** { *; }
 -keep class io.flutter.** { *; }
 -keep class io.flutter.plugins.** { *; }
# -keep class com.google.firebase.** { *; } // uncomment this if you are using firebase in the project
 -dontwarn io.flutter.embedding.**
 -dontwarn com.netcore.android.**
 -keep class com.netcore.android.**{*;}
 -keep class * implements com.netcore.android.**.* {*;}
 -keep class * extends com.netcore.android.**.* {*;}
 -dontwarn co.hyperverge.**
 -keepclassmembers class * implements javax.net.ssl.SSLSocketFactory {
 	private javax.net.ssl.SSLSocketFactory delegate;
 }
 -ignorewarnings