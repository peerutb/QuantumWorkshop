// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.


namespace Quantum.Teleportation {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Teleport(msg : Qubit, there : Qubit) : () {
        body {

            // Task 1 code here
            using (register = Qubit[1])
            {
                let here = register[0];
                H(here);
                CNOT(here, there);

                // Task 2 code here
                CNOT(msg, here);
                H(msg);

                // Task 3 code here
                let msgObs = M(msg);
                let hereObs = M(here);
                if (msgObs == One)
                {
                    Z(there);
                }
                if (hereObs == One)
                {
                    X(there);
                }

                Reset (here);
            }
        }
    }

    operation TeleportArbitraryState (u : (Qubit => () : Adjoint)) : () {
		body {
			// Task 5 code here
            using (register = Qubit[2])
            {
                let msg = register[0];
                let there = register[1];
                u(msg);
                Teleport(msg, there);
                (Adjoint u)(there);

                ApplyToEach(Reset, register);
			}
		}
	}

}