//This sketch reads data from xively at a regular interval specified by updateinterval

import processing.net.*;

String apiKey="2KuPlMi4CgjuOLB4qJOECasRTQGmqDE9XAA2XKV7RYo1Ia6G";
String feedId="1450731950";
int xPos;
int hojd = 190;
float hojdValue = 0.6;
int previousMillis=0;
int updateinterval=0; //this is how often in milliseconds that data is read from xively
boolean stop = false;
PFont f;



void setup() {
  size(1500, 1000); //Open a window 1500x 1000 pixels;
  background(23);
  f = createFont("CourierNewPS-BoldMT-48", 24);
  textFont(f);
  noLoop();
}

void draw() {
  
     int pos1=1;
     int pos2=1;
     int pos3=1;
     int pos4=1;
     int pos5=1;
     
  noFill();
 
  int currentMillis = millis();

  if (currentMillis - previousMillis >= updateinterval) {
    //Read from xively at a certain interval
    JSONObject json=readXively(apiKey, feedId);

    //The result is returned as a jSon-object. The complete jSon text is also saved in a textfile called data.txt
    //in the same folder as the processing sketch


    //Then parse the value, which is in a json-array, making it a little bit more complicated
    JSONArray stream=json.getJSONArray("datastreams");
    ///////////////////////////////////////////////////////////////////////////////////////
    JSONObject sensor1=stream.getJSONObject(0);



    JSONArray datapoint1=sensor1.getJSONArray("datapoints");
    for (int y = 0; y < datapoint1.size (); y++) {
      JSONObject item1 = datapoint1.getJSONObject(y);
      float value1  = item1.getFloat("value");
      String test  = item1.getString("at");
      String [] nums = split(test, 'T');
      String [] nums2 = split(nums[1], '.');

      println("detta är test: " + test + " nums: " + nums2[0]);
      /*    
       for(int q : nums){
       println("detta är nums: " + q);
       
       }
       */


      fill(26, value1, 50, 10);
      //  noStroke();
      strokeWeight(2);
for (int i = 0;i < pos1; i++) {
       if(pos1!=1){
       
       value1=value1+random(-5,10);
     }
      ellipse(150+50, 250, value1*2, value1*2);
}
      println("value1: " + value1);

      strokeWeight(12);
      stroke(26, value1, 50);
      line((xPos*20)+850, hojd, (xPos*20)+850, hojd - value1*hojdValue);
      if (xPos >= 20) {
        xPos = 0;
      } else {
        // increment the horizontal position:
        xPos++;
      }
    }


    ///////////////////////////////////////////////////////////////////////////////////////

    JSONObject sensor2=stream.getJSONObject(1);



    JSONArray datapoint2=sensor2.getJSONArray("datapoints");
    for (int y = 0; y < datapoint2.size (); y++) {
      JSONObject item2 = datapoint2.getJSONObject(y);

      float value2  = item2.getFloat("value");

      fill(52, value2, 219, 10);
      strokeWeight(2);

for (int i = 0;i < pos2; i++) {
       if(pos2!=1){
       
       value2=value2+random(-5,10);
     }
      ellipse(350+200, 250, value2*2, value2*2);
}
      println("value2: " + value2);
      stroke(52, value2, 219);
      strokeWeight(12);

      line((xPos*20)+850, hojd*2, (xPos*20)+850, hojd*2 - value2*hojdValue);


      if (xPos >= 20) {
        xPos = 0;
      } else {
        // increment the horizontal position:
        xPos++;
      }
    }



    ///////////////////////////////////////////////////////////////////////////////////////

    JSONObject sensor3=stream.getJSONObject(2);




    JSONArray datapoint3=sensor3.getJSONArray("datapoints");
    for (int y = 0; y < datapoint3.size (); y++) {
      JSONObject item3 = datapoint3.getJSONObject(y);

      float value3  = item3.getFloat("value");

      fill(value3, value3, value3, 10);
      strokeWeight(2);
for (int i = 0;i < pos3; i++) {
       if(pos3!=1){
       
       value3=value3+random(-5,10);
     }
      ellipse(150+50, 500, value3*2, value3*2);
}
      stroke(value3, value3, value3);
      strokeWeight(12);

      line((xPos*20)+850, hojd*3, (xPos*20)+850, hojd*3 - value3*hojdValue);
      if (xPos >= 20) {
        xPos = 0;
      } else {
        // increment the horizontal position:
        xPos++;
      }
    }




    ///////////////////////////////////////////////////////////////////////////////////////

    JSONObject sensor4=stream.getJSONObject(3);


    JSONArray datapoint4=sensor4.getJSONArray("datapoints");
    for (int y = 0; y < datapoint4.size (); y++) {
      JSONObject item4 = datapoint4.getJSONObject(y);

      float value4  = item4.getFloat("value");
      //gul
      strokeWeight(2);
       
for (int i = 0;i < pos4; i++) {
  
   fill(241, value4, 15, 10);
     if(pos4!=1){
       
       value4=value4+random(-5,10);
     }
      ellipse(350+200, 500, value4*2, value4*2);
}
      stroke(241, value4, 15);
      strokeWeight(12);

      line((xPos*20)+850, hojd*4, (xPos*20)+850, hojd*4 - value4*hojdValue);
      if (xPos >= 20) {
        xPos = 0;
      } else {
        // increment the horizontal position:
        xPos++;
      }
    }



    ///////////////////////////////////////////////////////////////////////////////////////

    JSONObject sensor5=stream.getJSONObject(4);



    JSONArray datapoint5=sensor5.getJSONArray("datapoints");
    for (int y = 0; y < datapoint5.size (); y++) {
      JSONObject item5 = datapoint5.getJSONObject(y);

      float value5  = item5.getFloat("value");

      strokeWeight(2);
 fill(192, value5, 43, 10);
for (int i = 0;i < pos5; i++) {
          if(pos5!=1){
       
       value5=value5+random(-5,10);
     }
      ellipse(250+125, 800, value5*2, value5*2);
}
      stroke(192, value5, 43);
      strokeWeight(12);

      line((xPos*20)+850, hojd*5, (xPos*20)+850, hojd*5 - value5*hojdValue);

      if (xPos >= 20) {
        xPos = 0;
        //background(0);
      } else {
        // increment the horizontal position:
        xPos++;
      }
      // line(xPos*2, height, xPos*2, height - value);
    }




    //underline
    //  strokeWeight(2);
    stroke(255);
    line(830, hojd*1+10, 1270, hojd*1+10);
    line(830, hojd*2+10, 1270, hojd*2+10);
    line(830, hojd*3+10, 1270, hojd*3+10);
    line(830, hojd*4+10, 1270, hojd*4+10);
    line(830, hojd*5+10, 1270, hojd*5+10);

    fill(255, 255, 255);
    textSize(50);
    text("Sleeping Agent", 10, 50);

    textSize(25);
    text("Time", 830, hojd*3+40);
    textSize(25);
    text("Posture", 10, 900);




    previousMillis=currentMillis;
  }
}



JSONObject readXively(String apiKey, String feedId) {
  //This method reads data from xively and returns a JSONObject. It also stores the json data as text in data.txt
  //PLEASE NOTE: if xively data includes special multibyte data like åäö, this method might crash.
  //possible solution: use data = data + c.readChar(); instead of data = data + c.readString();

  //see https://xively.com/dev/docs/api/quick_reference/historical_data/ for format ov start, end and interval
  String start="2015-03-23T01:00:00Z";
  String end="2015-03-23T07:00:00Z";
  String interval="900";  //this is the interval in seconds between historical datapoints read from xively.



  String data="";
  Client c = new Client(this, "api.xively.com", 80); // Connect to server on port 80
  c.write("GET /v2/feeds/");
  c.write(feedId);
  c.write("?start=");
  c.write(start);
  c.write("&end=");
  c.write(end);
  c.write("&interval=");
  c.write(interval);  
  c.write(" HTTP/1.1\r\n");
  c.write("Host: api.xively.com\r\n");
  c.write("X-PachubeApiKey: ");
  c.write(apiKey);
  c.write("\r\n");  
  c.write("\r\n");

  //the request is finished, now wait for the reply from xively
  boolean finished=false;
  boolean headerReceived=false;
  boolean contentLengthReceived=false;
  int contentLength=0;
  int endOfHeader=0;

  while (!finished) {
    while (c.available () > 0) { // If there's incoming data from the client...
      data = data + c.readChar(); //add it to the data string
    }

    //here are several lines necessary to detect when the reply is finished
    if (!contentLengthReceived) {
      String cont="Content-Length:";
      //look for the text Content-Length in the returned data
      int contentLengthPosition=data.indexOf(cont);
      if (contentLengthPosition>0) {
        int endOfLine=data.indexOf("\r\n", contentLengthPosition);
        if (endOfLine>0) {
          String contentLengthString=data.substring(contentLengthPosition+cont.length(), endOfLine);
          contentLength=Integer.parseInt(contentLengthString.trim());
          contentLengthReceived=true;
        }
      }
    }

    //the data is sent directly after the header. The end of header is marked by \r\n\r\n
    if (contentLengthReceived) {
      endOfHeader=data.indexOf("\r\n\r\n");
      if (endOfHeader>0) {
        headerReceived=true;
      }
    }
    if (headerReceived) {
      //check if the number of received data matches the content length. If it does, the reply is complete
      if (data.length()-endOfHeader-3>contentLength) {        
        finished=true;
      }
    }
  }
  //c.stop();


  //remove the header, keep the json data
  data=data.substring(data.indexOf("{"), data.length());

  println(data);  


  //save the json data in data.txt
  String[] list=new String[1];
  list[0]=data;
  saveStrings("data.txt", list);

  //save the json data in a JSONObject
  JSONObject json = new JSONObject();
  json = loadJSONObject("data.txt");
  return json;
}

