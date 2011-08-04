/*
  Controls an RGB LED
 */

#include <WProgram.h>
#include "RGB.h"

const int R=9;
const int G=10;
const int B=11;

const int pot=A0;

void disp_RGB(RGB* rgb) {
  analogWrite(R,rgb->m_r);
  analogWrite(G,rgb->m_g);
  analogWrite(B,rgb->m_b);
}

void setup() {
  Serial.begin(9600);
  pinMode(R,OUTPUT);
  pinMode(G,OUTPUT);
  pinMode(B,OUTPUT);
}

float pi=3.14;
float frequency=.01;
float goffset=2*pi/3;
float boffset=4*pi/3;
float r=0;
float g=0;
float b=0;
float minfreq=.001;
float maxfreq=1;
RGB rgb(0);
void loop() {
  for(int i=0;i<2*pi/frequency;i++) {
    int r=sin(i*frequency)*127+128;
    int g=sin(i*frequency+goffset)*127+128;
    int b=sin(i*frequency+boffset)*127+128;
    rgb=RGB(r,g,b);
    disp_RGB(&rgb);
    int potVal=analogRead(pot);
    float perc=potVal/1024.0;
    frequency=perc*(maxfreq-minfreq)+minfreq;
    Serial.println(frequency);
  }
}

