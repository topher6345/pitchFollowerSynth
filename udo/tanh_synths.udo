; Distortion Synthesis
; --------------------
;
; https://en.wikipedia.org/wiki/Distortion_synthesis

; TanhApply
; =========
; Waveshape a signal with Tanh and k-rate variable harmonics
; usage:
;    aSquare TanhApply kHarmonics, aSine
opcode TanhApply, a, ka
  ain, kHarmonics xin
  asig = tanh(kHarmonics* $M_2_PI. * ain)
  aout balance asig, ain
  xout aout
endop

; SquareWaveGenerator
; ===================
; Band limited square wave generator
; usage:
;    aOut SquareWaveGenerator kPitch, kHarmonics, giSine
opcode SquareWaveGenerator, a, kki
  kTrackedFrequency, kHarmonics, iSineTable xin
  aSine poscil3 1, kTrackedFrequency, iSineTable
  aSquare TanhApply kHarmonics, aSine
  xout aSquare
endop


; SawtoothWaveGenerator
; =====================
; Band limited sawtooth wave generator
; usage:
;    aOut SawtoothWaveGenerator kPitch, kHarmonics, giSine
opcode SawtoothWaveGenerator,a, kki
  kTrackedFrequency, kHarmonics, iSineTable xin
  aSine poscil3 1, kTrackedFrequency, iSineTable
  aSquare TanhApply kHarmonics, aSine
  aCosine poscil3 1, kTrackedFrequency, iSineTable, 0.25
  aSawTooth = aSquare * aCosine
  xout aSawTooth
endop

; TriangleWaveGenerator
; =====================
; Band limited triangle wave generator
; usage:
;    aOut TriangleWaveGenerator kPitch, kHarmonics, giSine
opcode TriangleWaveGenerator, a, kki
  kTrackedFrequency, kHarmonics, iSineTable xin
  aSine poscil3 1, kTrackedFrequency, iSineTable
  aSquare TanhApply kHarmonics, aSine
  aCosine poscil3 1, kTrackedFrequency, iSineTable, 0.25
  aSawTooth = aSquare * aCosine
  aTriangle TanhApply kHarmonics, aSawTooth * (aCosine - 1) * (aCosine + 1)
  xout aTriangle
endop
