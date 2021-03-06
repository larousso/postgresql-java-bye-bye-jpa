/*
 * This file was generated by the Gradle 'init' task.
 *
 * This generated file contains a sample Java project to get you started.
 * For more details take a look at the Java Quickstart chapter in the Gradle
 * User Manual available at https://docs.gradle.org/5.5.1/userguide/tutorial_java_projects.html
 */
plugins {
    maven
    // Apply the java plugin to add support for Java
    java
    // Apply the application plugin to add support for building a CLI application
    application
}

java {
    sourceCompatibility = JavaVersion.toVersion("15")
    targetCompatibility = JavaVersion.toVersion("15")
}

repositories {
    jcenter()
}

dependencies {
    // This dependency is used by the application.
    implementation("io.vertx:vertx-pg-client:3.8.0")
    implementation("io.vertx:vertx-rx-java2:3.8.0")
    implementation("io.vavr:vavr:0.10.2")
    implementation("io.vavr:vavr-jackson:0.10.0")
    implementation("com.fasterxml.jackson.module:jackson-module-parameter-names:2.9.9")
    implementation("com.fasterxml.jackson.datatype:jackson-datatype-jdk8:2.9.9")
    implementation("com.fasterxml.jackson.datatype:jackson-datatype-jsr310:2.9.9")
    compileOnly("org.projectlombok:lombok:1.18.8")
    annotationProcessor("org.projectlombok:lombok:1.18.8")
    // Use JUnit test framework
    testImplementation("junit:junit:4.12")
}

application {
    // Define the main class for the application
    mainClassName = "demo.App"
}
