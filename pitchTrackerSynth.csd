<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 2^4
nchnls = 2
0dbfs = 1

#include "udo/tanh_synths.udo"
#include "udo/harmonic_ceiling.udo"
#include "udo/track_pitch.udo"

#define SQUARE   #0#
#define SAW      #1#
#define TRIANGLE #2#

gkWaveformSelector init $TRIANGLE.

giSine ftgen 8, 0, 8192, 10, 1

turnon 1
instr 1
  aInput inch 1

  kTrackedFrequency TrackPitch aInput

  kHarmonics HarmonicCeiling kTrackedFrequency * 0.5

  if(gkWaveformSelector == $SQUARE) then
		aOut SquareWaveGenerator kTrackedFrequency, kHarmonics, giSine
  elseif(gkWaveformSelector == $SAW) then
    aOut SawtoothWaveGenerator kTrackedFrequency, kHarmonics, giSine
  elseif(gkWaveformSelector == $TRIANGLE) then
    aOut TriangleWaveGenerator kTrackedFrequency, kHarmonics, giSine
  endif

  aOut balance aOut, aInput
  outs aOut , aOut
endin

</CsInstruments>
<CsScore>
i 1 0 340000
</CsScore>
</CsoundSynthesizer>


<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>558</x>
 <y>230</y>
 <width>505</width>
 <height>464</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>247</r>
  <g>249</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>slider1</objectName>
  <x>5</x>
  <y>5</y>
  <width>20</width>
  <height>100</height>
  <uuid>{e7d023d8-d628-4b4f-84a1-4e7c7850e980}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.87000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>gkWaveformSelector</objectName>
  <x>113</x>
  <y>58</y>
  <width>118</width>
  <height>44</height>
  <uuid>{343a102d-1624-4cfe-9849-3bdbff6b7f0c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>2.00000000</maximum>
  <value>1.05084746</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<EventPanel name="" tempo="60.00000000" loop="8.00000000" x="193" y="433" width="655" height="346" visible="true" loopStart="0" loopEnd="0">f 1 0 128 10 1 1/2 1/3 1/4 1/5 1/6 </EventPanel>