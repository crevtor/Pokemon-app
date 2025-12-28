import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties: Properties = Properties().apply {
    val keyPropsFile = rootProject.file("key.properties")
    if (keyPropsFile.exists()) {
        // Use inputStream() so Kotlin resolves load(...) on Properties unambiguously
        keyPropsFile.inputStream().use { stream ->
            this.load(stream)
        }
    }
}
android {
    namespace = "com.pokemon.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.pokemon.app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    signingConfigs {
        create("release") {
            keyAlias = System.getenv("KEY_ALIAS") ?: keystoreProperties["keyAlias"] as String?
            keyPassword = System.getenv("KEY_PASSWORD") ?: keystoreProperties["keyPassword"] as String?
            val ksPath = System.getenv("KEYSTORE_PATH") ?: keystoreProperties["storeFile"] as String?
            if (!ksPath.isNullOrBlank()) {
                storeFile = file(ksPath)
            }
            storePassword = System.getenv("STORE_PASSWORD") ?: keystoreProperties["storePassword"] as String?
        }
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android.txt"),
                "proguard-rules.pro"
            )
            signingConfig = signingConfigs.getByName("release")
            isDebuggable = false
        }
    }
}

flutter {
    source = "../.."
}
