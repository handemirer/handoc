# SharedPrefHelpers.kt

``` kotlin
import android.content.Context
import androidx.annotation.NonNull

object SharedPrefHelpers {
    fun readFromSharedPreferences(context: Context, key: String, @NonNull defaultValue: String): String? {
        return context.getSharedPreferences("pref", Context.MODE_PRIVATE).getString(key, defaultValue)
    }

    fun writeToSharedPreferences(context: Context, key: String, @NonNull value: String) {
        val sharedPreferences = context.getSharedPreferences("pref", Context.MODE_PRIVATE)
        val editor = sharedPreferences.edit()
        editor.putString(key, value)
        editor.apply()
    }
}
```
