; TrackPitch
; ----------
; Track the pitch of an audio signal
; usage:
;     kTrackedFrequency TrackPitch aInput
opcode TrackPitch, k, a
  aInput xin
  iMinimumPitch = 40 ; hz
  iMaximumPitch = 2000 ; hz
  kTrackedFrequency, krms pitchamdf aInput, iMinimumPitch, iMaximumPitch

  ; apply portamento to pitch
  iSlideTime = 0.001 ; seconds
  kTrackedFrequency portk kTrackedFrequency, iSlideTime

  xout kTrackedFrequency
endop
