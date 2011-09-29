//:ofSpectrograph
//:==============
//:Send Synths to server
MySynths.sendToServer;
//:Load Buffers
MyBuffers.seals;
//:SendSpectrogramData
SendSpectrogramData.new;
//SendSpectrogramData('fft').free;
//SendSpectrogramData('ofSpectrograph');
//SendSpectrogramData('ofSpectrograph').free;


//:PV_BinSfift one buffer
{ | i | format("mySynths%", i).asSymbol.playDef(\pv_binShift, 
	[\bufnum, \elephant_seal2.buffer, \rate, i * 0.001 + 1]) 
} ! 10;

//:Rate play
{ | i | format("mySynths%", i).asSymbol.set(\rate, i * 0.001 + 1) } ! 10;
//:Many Buffers
{ | i | format("mySynths%", i).asSymbol.set(\bufnum, 5) } ! 10;
//:Change variables
OF.int("mirrorMode", 4);
OF.float("spectroRed", 1);
OF.float("spectroGreen", 0);
OF.float("spectroBlue", 0);
OF.float("spectroRedUp", 1);
OF.float("spectroGreenUp", 1);
OF.float("spectroBlueUp", 1);

//:Big Triangels
{
	500.do{|g|
	{ | i | format("mySynths%", i).asSymbol.set(\stretch, g) } ! 10;
	0.01.wait;	
	};
	500.do{|k|
	{ | i | format("mySynths%", i).asSymbol.set(\stretch, 500-k) } ! 10;
	0.01.wait	;
	};
}.fork
//:Small Ones
{
	5.do{
	150.do{|g|
	{ | i | format("mySynths%", i).asSymbol.set(\stretch, g) } ! 10;
	0.001.wait;	
	};	
	150.do{|k|
	{ | i | format("mySynths%", i).asSymbol.set(\stretch, 5*(150-k)) } ! 10;
	0.006.wait	
	};
	};
}.fork
//:Fade Out
{
	100.do{ |g|
	{ | i | format("mySynths%", i).asSymbol.set(\level, 1 - (g/99)) } ! 10;
	g.postln;
	0.1.wait;	
	};
	0.1.wait;	
	{ | i | format("mySynths%", i).asSymbol.free;} ! 10;
}.fork

//:Curves
{
{SinOsc.ar(2000*SinOsc.kr(XLine.kr(0.001,0.5,20, doneAction:2)), mul:0.5)}.play;
1.wait;
{SinOsc.ar(4000*SinOsc.kr(XLine.kr(0.001,0.5,20, doneAction:2)), mul:0.5)}.play;
1.wait;
{SinOsc.ar(8000*SinOsc.kr(XLine.kr(0.001,0.5,20, doneAction:2)), mul:0.5)}.play;
10.wait;
{SinOsc.ar(8000*SinOsc.kr(XLine.kr(0.5,0.001,20, doneAction:2)), mul:0.5)}.play;
1.wait;
{SinOsc.ar(4000*SinOsc.kr(XLine.kr(0.5,0.001,20, doneAction:2)), mul:0.5)}.play;
1.wait;
{SinOsc.ar(2000*SinOsc.kr(XLine.kr(0.5,0.001,20, doneAction:2)), mul:0.5)}.play;
}.fork
//:Play batuhan
x = Synth(\batuhan).play;
x.set(\amp,4)


