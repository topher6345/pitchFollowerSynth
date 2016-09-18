opcode TrackPitch, k, a
  aInput xin

  ; TRACK PITCH
  iHopSize = 1024
  iPeaks = 80
  kTrackedFrequency, kamp ptrack aInput, iHopSize, iPeaks

  ; SMOOTH TRACKED PITCH
  iSlideTime = 0.1 ; seconds
  kTrackedFrequency portk kTrackedFrequency, iSlideTime

  xout kTrackedFrequency
endop
