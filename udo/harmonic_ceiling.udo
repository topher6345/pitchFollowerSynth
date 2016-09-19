opcode HarmonicCeiling, k, k
  kTrackedFrequency xin

  ; CALCULATE HARMONICS
  if kTrackedFrequency == 0 then
    kTrackedFrequency = 1
  endif

  kHarmonics = (sr * 0.5) / kTrackedFrequency
  kHarmonicsScalar = 1
  kHarmonics = kHarmonics* kHarmonicsScalar

  xout kHarmonics
endop
