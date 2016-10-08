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

gkWaveformSelector init $SAW.

giSine ftgen 8, 0, 8192, 10, 1

instr 1
	kPitch cpsmidib 2
 	iamp ampmidi 1

	ares mxadsr 0.010, 0.75, 0.1, 0.10
	aresb mxadsr 0.004, 0.25, 0.1, 0.040

	kharms = (sr*.5)/kPitch

  kharmsScalar = iamp
  kSineK oscili 0.2, 2, giSine
  kharms = kharms * kharmsScalar * (aresb - 2)

;  gkWaveformSelector invalue "gkWaveformSelector"
  if(gkWaveformSelector == $SQUARE) then
    aOut SquareWaveGenerator kPitch, kharms, giSine
  elseif(gkWaveformSelector == $SAW) then
   aOut SawtoothWaveGenerator kPitch, kharms, giSine
  elseif(gkWaveformSelector == $TRIANGLE) then
   aOut TriangleWaveGenerator kPitch, kharms, giSine
  endif

		aOut = aOut * ares
		aOut = aOut * 0.001 ; wow hot
		
	 kthresh = 0
  kloknee = 40
  khiknee = 60
  kratio  = 4
  katt    = 0.010
  krel    = .005
  ilook   = 1
;aOut  compress aOut, aOut, kthresh, kloknee, khiknee, kratio, katt, krel, ilook	; voice-activated compress

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
