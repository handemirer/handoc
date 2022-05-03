# View Binding

``` kotlin
class FlowModeFragment : Fragment() {
    private lateinit var binding: FragmentFlowModeBinding
   
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentFlowModeBinding.inflate(inflater, container, false)
        return binding.root
}
```