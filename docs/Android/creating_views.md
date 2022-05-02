# Create View

``` kotlin
class SampleView @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : View(context, attrs, defStyleAttr)
```

Custom attributes

``` xml
<resources>
    <declare-styleable name="SamlpeView">
        <attr name="sample" format="enum">
            <enum name="foo" value="0">
            <enum name="bar" value="1">
        </attr>
    </declare-styleable>
</resources>
```

Template

``` kotlin
class CustomCardView @JvmOverloads constructor(
    context: Context, 
    attrs: AttributeSet? = null, 
    defStyleAttr: Int = 0
) : FrameLayout(context, attrs, defStyleAttr) {

init {
    inflate(context, R.layout.view_custom_card, this)

    attrs?.let {
        val typedArray = context.obtainStyledAttributes(it, R.styleable.custom_card_view)
        val myString = typedArray.getString(R.styleable.custom_card_view_command)
    }
}
```
Life Cycle View
![lifecycleView](../img/lifecycleView.png)