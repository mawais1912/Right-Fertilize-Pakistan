# Flutter Core
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }

# Your app classes
-keep class com.example.right_fertilize_pakistan.** { *; }

# Prevent warnings
-dontwarn java.lang.invoke.*

# Firebase
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# Google Play Core (split install, in-app updates, etc.)
-keep class com.google.android.play.** { *; }
-dontwarn com.google.android.play.**

# AndroidX (optional safety net)
-keep class androidx.lifecycle.** { *; }
-dontwarn androidx.lifecycle.**
