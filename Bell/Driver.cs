using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.Bell
{
    class Driver
    {
        static void Main(string[] args)
        {
            // Task 2 - add code here
            using (var sim = new QuantumSimulator())
            {
                Result[] initials = new Result[] { Result.Zero, Result.One };
                foreach (Result initial in initials)
                {
                    var count = 1000;
                    var (numZeros, numOnes, same) = BellTest.Run(sim, count, initial).Result;
                    System.Console.WriteLine($"Init:{initial,-4} 0s={numZeros, -4} 1s={numOnes, -4} same={same, -4}");
                    // System.Console.WriteLine("Press any key to continue...");
                    // System.Console.ReadKey();
                }
            }
        }
    }
}

