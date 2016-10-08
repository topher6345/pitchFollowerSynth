<CsoundSynthesizer>
<CsOptions>
; -M 0 -odac ; Default command line options
</CsOptions>
<CsInstruments>

; Sample Rate
sr = 44100

; Samples per control rate
ksmps = 2^4

; Number of channels
nchnls = 2

; Amplitude values of 1 are full scale (loudest)
0dbfs = 1

; Import synthesis user-defined opcodes
#include "udo/tanh_synths.udo"

; Import user-defined-opcode for calculating harmonics
#include "udo/harmonic_ceiling.udo"

; Define aliases for waveforms
#define SQUARE   #0#
#define SAW      #1#
#define TRIANGLE #2#

; Start with this wave
gkWaveformSelector init $SAW.

; Generate Sine wave table to be used by oscillators
giSine ftgen 8, 0, 8192, 10, 1

instr 1
  ; Receive pitch from midi keyboard
  kPitch cpsmidib 2

  ; Receive midi velocity and scale to full scale
  iamp ampmidi 1

  ; Amplitude envelope
  aAmplitudeEnvelope mxadsr 0.010, 0.75, 0.1, 0.10

  ; Harmonics envelope with slightly faster decay
  aHarmonicsEnvelope mxadsr 0.004, 0.25, 0.1, 0.040

  ; Calculate how many harmonics we get before aliasing
  kHarmonics HarmonicCeiling kPitch

  ; convert i-rate MIDI amplitude to k-rate
  kharmsScalar = iamp

  ; Add sine modulation to haromnics
  kSineK oscili 0.2, 2, giSine

  ; Bipolar to Unipolar conversion
  kSineK = ((kSineK + 1) * 0.5)

  ; Scale harmonics to get final value that controls brightness of timbre
  kHarmonics = kHarmonics * kharmsScalar * (aHarmonicsEnvelope - 2) * kSineK

  ; Route control signals to signal generators
  if(gkWaveformSelector == $SQUARE) then
    aOut SquareWaveGenerator kPitch, kHarmonics, giSine
  elseif(gkWaveformSelector == $SAW) then
   aOut SawtoothWaveGenerator kPitch, kHarmonics, giSine
  elseif(gkWaveformSelector == $TRIANGLE) then
   aOut TriangleWaveGenerator kPitch, kHarmonics, giSine
  endif

  ; Magic number to lower volume
  iAmplitudeScalar = 0.001

  ; Apply final scaling to signal
  aOut = aOut * aAmplitudeEnvelope * iAmplitudeScalar

  ; Send signal to digital to audio converter
  outs aOut , aOut
endin

</CsInstruments>
<CsScore>
f0 10000
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>523</width>
 <height>189</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>gkWaveformSelector</objectName>
  <x>405</x>
  <y>77</y>
  <width>118</width>
  <height>44</height>
  <uuid>{343a102d-1624-4cfe-9849-3bdbff6b7f0c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>2.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>271</x>
  <y>49</y>
  <width>80</width>
  <height>25</height>
  <uuid>{2092b5c5-742b-452e-8210-0ff8ecc24442}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>PITCH FOLLOWER SYNTH</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBGraph" version="2">
  <objectName/>
  <x>42</x>
  <y>257</y>
  <width>484</width>
  <height>411</height>
  <uuid>{48af04de-3a67-4cd6-bc22-c7a391b42ac3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>1</midicc>
  <value>1</value>
  <objectName2/>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <all>true</all>
 </bsbObject>
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>121</x>
  <y>99</y>
  <width>350</width>
  <height>150</height>
  <uuid>{b805cb28-6e37-4676-ae73-92d006b788ac}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>1.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
