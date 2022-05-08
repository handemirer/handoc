# Custom View Group

``` kotlin
package com.handemirer.customviewgroup

import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import android.widget.LinearLayout
import android.widget.TextView


class CustomViewGroup @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyle: Int = 0,
    defStyleRes: Int = 0
) : LinearLayout(context, attrs, defStyle, defStyleRes) {
    val titleTextView: TextView
    val trailTextView: TextView

    private var _title: String = ""
    private var _trail: String = ""

    var title: String
        get() = _title
        set(value) {
            _title = value
            titleTextView.text = value
        }
    var trail: String
        get() = _trail
        set(value) {
            _trail = value
            subtitleTextView.text = value
        }

    init {
        LayoutInflater.from(context).inflate(R.layout.custom_linear_layout, this, true)

        val a = context.obtainStyledAttributes(
            attrs,
            R.styleable.CustomViewGroup, 0, 0
        )
        
        trailTextView = findViewById<TextView>(R.id.trail)
        titleTextView = findViewById<TextView>(R.id.title)
        titleTextView.text = a.getString(R.styleable.CustomViewGroup_title)
        trailTextView.text = a.getString(R.styleable.CustomViewGroup_trail)
        
        a.recycle()
    }
}
```


``` xml title="custom_linear_layout.xml"
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="horizontal"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <TextView
        android:id="@+id/title"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="TextView  " />

    <TextView
        android:id="@+id/trail"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="TextView" />
</LinearLayout>
```

``` xml title="attrs.xml"
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <declare-styleable name="CustomViewGroup">
        <attr name="title" format="string" />
        <attr name="trail" format="string" />
    </declare-styleable>
</resources>
```
