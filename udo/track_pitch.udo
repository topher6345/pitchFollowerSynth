opcode TrackPitch, k, a
  aInput xin

  ; TRACK PITCH
  ; iHopSize = 2048
  ; iPeaks = 20
  ; kTrackedFrequency, kamp ptrack aInput, iHopSize, iPeaks
  iMinimumPitch = 40
  iMaximumPitch = 2000
  kTrackedFrequency, krms pitchamdf aInput, iMinimumPitch, iMaximumPitch

  ; SMOOTH TRACKED PITCH
  iSlideTime = 0.001 ; seconds
  kTrackedFrequency portk kTrackedFrequency, iSlideTime

  xout kTrackedFrequency
endop
