# Custom Dialog


``` kotlin
class CustomDialog(private val onDismiss: (Int) -> Unit) : DialogFragment() {
    private lateinit var binding: FragmentNumberPickerDialogBinding
    
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = FragmentNumberPickerDialogBinding.inflate(inflater, container, false)
        //onDismiss.invoke(target)
        return binding.root
    }


    companion object {
        const val TAG = "CustomDialog"
    }
}
```