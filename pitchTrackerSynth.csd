


<CsoundSynthesizer>
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

gkWaveformSelector init $SQUARE.

giSine ftgen 8, 0, 8192, 10, 1

turnon 1
instr 1
  aInput inch 1

	aInputLP butlp aInput, 200

  kTrackedFrequency TrackPitch aInputLP

	kTrackedFrequency = kTrackedFrequency * 0.5
  kHarmonics HarmonicCeiling kTrackedFrequency 

	gkWaveformSelector invalue "slider1"
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
 <x>776</x>
 <y>201</y>
 <width>405</width>
 <height>302</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>247</r>
  <g>249</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>42</x>
  <y>135</y>
  <width>350</width>
  <height>150</height>
  <uuid>{15cec5b3-74c7-47b0-8636-2659401e8fbc}</uuid>
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
 <bsbObject version="2" type="BSBDropdown">
  <objectName>slider1</objectName>
  <x>227</x>
  <y>91</y>
  <width>80</width>
  <height>30</height>
  <uuid>{64f90d33-c857-4610-9c1c-d60c9df61711}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>0</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>2</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>2</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>306</x>
  <y>90</y>
  <width>85</width>
  <height>46</height>
  <uuid>{36856884-a728-48d7-ad2b-cedaba675fb3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0 = SQUARE
1 = SAW
2 = TRIANGLE</label>
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
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>123</x>
  <y>3</y>
  <width>174</width>
  <height>28</height>
  <uuid>{56d3397f-cbd0-4fe8-ae15-5ccf62acf269}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Pitch Follower Synth</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
<EventPanel name="" tempo="60.00000000" loop="8.00000000" x="193" y="433" width="655" height="346" visible="false" loopStart="0" loopEnd="0">f 1 0 128 10 1 1/2 1/3 1/4 1/5 1/6 </EventPanel>
