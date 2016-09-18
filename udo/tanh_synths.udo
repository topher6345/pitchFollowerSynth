opcode TanhApply, a, ka
  ain, kHarmonics   xin
  asig = tanh(kHarmonics* $M_2_PI. * ain)
  aout balance asig, ain
  xout aout
endop

opcode SquareWaveGenerator, a, kki
  kTrackedFrequency, kHarmonics, iSineTable xin
  aSine poscil3 1, kTrackedFrequency, iSineTable
  aSquare TanhApply kHarmonics, aSine
  xout aSquare
endop


opcode SawtoothWaveGenerator,a, kki
  kTrackedFrequency, kHarmonics, iSineTable xin
  aSine poscil3 1, kTrackedFrequency, iSineTable
  aSquare TanhApply kHarmonics, aSine
  aCosine poscil3 1, kTrackedFrequency, iSineTable, .25
  aSawTooth = aSquare * aCosine
  xout aSawTooth
endop


opcode TriangleWaveGenerator, a, kki
  kTrackedFrequency, kHarmonics, iSineTable xin
  aSine poscil3 1, kTrackedFrequency, iSineTable
  aSquare TanhApply kHarmonics, aSine
  aCosine poscil3 1, kTrackedFrequency, iSineTable, .25
  aSawTooth = aSquare * aCosine
  aTriangle TanhApply kHarmonics, aSawTooth * (aCosine - 1) * (aCosine + 1)
  xout aTriangle
endop
