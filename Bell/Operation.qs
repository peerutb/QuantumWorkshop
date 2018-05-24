namespace Quantum.Bell
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Set (desired: Result, q1: Qubit) : ()
    {
        body
        {
			// Task 1 - add your code here  
            let current = M(q1);
            if (current != desired)
            {
                X(q1);
            }
        }
    }

	operation BellTest (count : Int, initial : Result) : (Int, Int, Int)
	{
		body
		{
			// Task 2 - add code here
            mutable numOnes = 0;
            mutable same = 0;
            using (qubits = Qubit[2])
            {
                for (test in 1..count)
                {
                    Set (initial, qubits[0]);
                    Set (Zero, qubits[1]);

                    // create superposition
                    // H(qubits[0]);

                    // entangle
                    Entangle (qubits[0], qubits[1]);

                    let result = M(qubits[0]);
                    if (result == M(qubits[1]))
                    {
                        set same = same + 1;
                    }
                    if (result == One)
                    {
                        set numOnes = numOnes + 1;
                    }

                }
                Set(Zero, qubits[0]);
                Set(Zero, qubits[1]);
            }
            return (count-numOnes, numOnes, same);
		}
	}

    operation Entangle (q1 : Qubit, q2 : Qubit) : ()
    {
        body
        {
            H(q1);
            CNOT(q1, q2);
        }
    }
}