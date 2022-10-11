# C# repeat x times

``` c#
// Normally in a namespace, of course.
public class LoopUtilities
{
    public static void Repeat(int count, Action action)
    {
        for (int i = 0; i < count; i++)
        {
            action();
        }
    }
}

using static LoopUtilities;

// Class declaration etc, then:
Repeat(5, () => Console.WriteLine("Hello."));
```