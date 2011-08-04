#include <WProgram.h>

const int speakerPin=2;
const int potPin=A0;
void setup()
{
   Serial.begin(9600);
   pinMode(speakerPin,OUTPUT);
   pinMode(potPin,INPUT);
}

float floatMap(float inp, float inpMin, float inpMax, float outMin, float outMax)
{
    float inpFrac=(inp-inpMin)/(inpMax-inpMin);
    float outFrac=inpFrac*(outMax-outMin)+outMin;
    return outFrac;
}

int deadband(int val, int prevVal, unsigned int deadbandVal)
{
    unsigned int diff=abs(val-prevVal);
    if(diff>deadbandVal)
	return val;
    else
	return prevVal;
}

const unsigned long minFreq=2000; //hz
const unsigned long maxFreq=8000; //hz
const unsigned int deadbandVal=3;
int prevVal=0;
void loop()
{
    unsigned int potVal=deadband(analogRead(potPin),prevVal,deadbandVal);
    prevVal=potVal;
    unsigned int freq=map(potVal,0,1024,minFreq,maxFreq);
    if(potVal==0)
	noTone(speakerPin);
    else
	tone(speakerPin,freq);
    Serial.print("inp: ");
    Serial.println(analogRead(potPin));
    Serial.print("out: ");
    Serial.println(freq);
}
