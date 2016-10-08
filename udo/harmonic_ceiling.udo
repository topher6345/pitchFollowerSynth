; HarmonicCeiling
; ---------------
; Given a fundamental frequency, calculate the number of harmonics
; of that tone before the Nyquist Frequency.
;
; This will give you the number of harmonics that be safely produced
; before digial artifacts start to occur.
;
; usage:
;     kHarmonics HarmonicCeiling kFrequency
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
