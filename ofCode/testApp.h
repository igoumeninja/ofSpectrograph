#ifndef _TEST_APP
#define _TEST_APP

#include "ofMain.h"

#include "ofx3DModelLoader.h"
#include "ofxNetwork.h"
#include "ofxOpenCv.h"
#include "ofxOsc.h"
#include "ofxVectorGraphics.h"
#include "ofxXmlSettings.h"


// listen on port 12345
#define PORT 12345
#define NUM_MSG_STRINGS 20

class testApp : public ofBaseApp{

	public:

		testApp();
		void setup();
		void update();
		void draw();

		void keyPressed  (int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void resized(int w, int h);
		
		ofxCvGrayscaleImage cvGray;
		ofx3DModelLoader modelLoader;
		ofxTCPClient client;
		ofxTCPServer server;
		ofxOscSender osc_sender;
		ofxXmlSettings settings;
		
		ofTexture		texScreen;
		
		ofTrueTypeFont		font;
		
		map<string, int> iv;
		map<string, float> fv;		

		float	data[1024];
		float		countX;
		
		bool full;

		
	private:
		ofxOscReceiver	receiver;

		int				current_msg_string;
		string			msg_strings[NUM_MSG_STRINGS];
		float			timers[NUM_MSG_STRINGS];
		string			mouseButtonState;
	

};

#endif
