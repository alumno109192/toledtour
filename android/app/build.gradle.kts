plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.toledotour"
    compileSdk = 35  // Actualizado a SDK 35
    ndkVersion = "27.0.12077973"  // Puedes eliminar esto si no usas NDK

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17  // Actualizado a Java 17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"  // Actualizado a Java 17
    }

    defaultConfig {
        applicationId = "com.example.toledotour"
        minSdk = 21  // Definido explícitamente para V2 embedding
        targetSdk = 35  // Actualizado a SDK 35
        versionCode = flutter.versionCode.toInt()
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

dependencies {
    implementation("androidx.appcompat:appcompat:1.6.1")
    // Puedes agregar aquí otras dependencias si las necesitas
}

flutter {
    source = "../.."
}