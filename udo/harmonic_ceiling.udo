opcode HarmonicCeiling, k, k
  kTrackedFrequency xin

  ; CALCULATE HARMONICS
  kHarmonics = (sr * 0.5) / kTrackedFrequency
  kHarmonicsScalar = 1
  kHarmonics = kHarmonics* kHarmonicsScalar

  xout kHarmonics
endop
