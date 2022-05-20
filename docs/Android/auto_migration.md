# Kotlin room db auto migration 

Add this options

``` title="build.gradle:app"
android {
    defaultConfig {
        javaCompileOptions {
            annotationProcessorOptions {
                arguments += ["room.schemaLocation": "$projectDir/schemas".toString()]
            }
        }
    }
}
```
Database annotation
``` kotlin
@Database(entities = [...], 
    version = 4,
    autoMigrations = [AutoMigration (from = 3, to = 4)]
)
```

