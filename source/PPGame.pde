import ddf.minim.*;
AudioPlayer buff;
AudioPlayer run;
Minim Buff;
Minim Run;
AudioPlayer get;
Minim Get;
PImage po;
PImage win;
PFont f;
int Dur=0;
int qunima=0;
PImage []  background= new PImage[5];
PImage gameover;
import processing.video.*; 
Movie movie;
Movie mov;
Movie begining;
Movie chance;
PImage [] mainChar= new PImage[8];
PImage toten;
PImage word;
int mX=500,mY=368;
int bX=0,bY=0;
int jiaozhunX=-15,jiaozhunY=0;
String [] mapGround,mapTizi,map1,map2,map3,map4,map0,Final;
String [] mapUse, finalground;
float speM=0,speY=0;
float gACC=-0.3;
int  arrayX,arrayY;
int rX,rY;
int jumpTimes=10;
int mode=0;
int step=0,direction=0;
PImage guanghuan;
PImage Key, Gate;
int KeyMode=1, barMode=0;
PImage p;
PImage shuidi,Finalmap;
int[] shuidiMode={1,1,1,1};
int numberShui=0;
int[] lockShui=new int[4];
PImage shuitiao;
PImage GateClose;
int bishaMode=0,lockBisha=0;
String name;
int shut=0;
int game=1;
int Length=0;
/*static public void main(String args[]) {
  PApplet.main("ppgame");
}*/
void setup()
{
  size(1000,736);
  f=createFont ("AGaramondPro-BoldItalic-48",70);
  Buff= new Minim(this);
  buff=Buff.loadFile("source/buff.wav");
  Run= new Minim(this);
  run=Run.loadFile("source/run.mp3");
  run.loop();
  Get = new Minim(this);
  get= Get.loadFile("source/get.mp3");
  background[0]= loadImage("source/map0.jpg");
  background[1]= loadImage("source/map1.jpg");
  background[2]= loadImage("source/map2.jpg");
  background[3]= loadImage("source/map3.jpg");
  background[4]= loadImage("source/map4.jpg");
  for(int i=0;i<8;i++){
  mainChar[i]= loadImage("source/"+"m"+i+".png");
 
}
 p=loadImage("source/p0.png");
 word=loadImage("source/word.png");
 finalground=loadStrings("data/finalground.txt");
shuitiao=loadImage("source/shuitiao.png");
mapGround=loadStrings("data/mapG.txt");
gameover=loadImage("source/gameover.png");
map0=loadStrings("data/bisha0.txt");
map1=loadStrings("data/bisha1.txt");
map2=loadStrings("data/bisha2.txt");
map3=loadStrings("data/bisha3.txt");
map4=loadStrings("data/bisha4.txt");
Final=loadStrings("data/finalbisha.txt");
Finalmap=loadImage("source/final.png");
guanghuan=loadImage("source/666.png");
shuidi=loadImage("source/shuidi.png");
mapUse=map0;
win=loadImage("source/win.png");
Key=loadImage("source/kay.png");
Gate=loadImage("source/gate.png");
GateClose=loadImage("source/gateClose.png");
po=loadImage("source/po.png");
toten=loadImage("source/toten.png");
 movie = new Movie(this, "/Users/4321118/Desktop/untitled folder 3/ppgame/source/ask.mp4");
 movie.play();
 begining = new Movie(this,"/Users/4321118/Desktop/untitled folder 3/ppgame/source/begining.mp4");
 begining.play();
 mov = new Movie(this, "/Users/4321118/Desktop/untitled folder 3/ppgame/source/support.mp4");
 mov.play();
 chance = new Movie(this, "/Users/4321118/Desktop/untitled folder 3/ppgame/source/chance.mp4");
 chance.play();
}

void movieEvent(Movie movie){
  movie.read();
}


void ground()
{
  //300*32 40*32 
 for(int i=0;i<300;i++)
  {
    if(i*32<=(-bX+500) && (i+1)*32>=(-bX+500))
    {
    rX=i;
    break;
    }
  }
  for(int k=0;k<40;k++)
  {
    if(k*32<=(-bY+368) && (k+1)*32>=(-bY+368))
    {
    rY=k;
    break;
    }
  }
   /*if(mapGround[int((-bY+368)/32)+1].charAt(int((500-bX)/32))!=0)
   {
   speY=0;
   }*/
   if(mapGround[rY+2].charAt(rX+1)!='0')
   {
   speY=0.3;
   bY=368-rY*32;
   jumpTimes=10;
   //print(rX,rY,"||");
   //println(mapGround[rY+1].charAt(rX));
   }
   if(mapGround[rY].charAt(rX+1)!='0')
   {
   speY=0;
   bY=368-(rY+1)*32-4;
   
   //print(rX,rY,"||");
   //println(mapGround[rY+1].charAt(rX));
   }
   else 
   if((mapGround[rY].charAt(rX+1)!='0' || mapGround[rY+1].charAt(rX+1)!='0'))
   {
   speM=0;
   bX=500-rX*32+5;
   //print(rX,rY,"||");
   //println(mapGround[rY+1].charAt(rX));
   }
    else if((mapGround[rY].charAt(rX)!='0' || mapGround[rY+1].charAt(rX)!='0'))
   {
   speM=0;
   bX=500-rX*32-15;
   //print(rX,rY,"||");
   //println(mapGround[rY+1].charAt(rX));
   }
     
}
void pinPoint()
{
  
if(bX>500)
{
bX=0;
}
if(bY>500 || (bY+1604)<736)
{
speY=0;}

  if(keyPressed && key=='d' )
  {speM=6;
 
}
  else if(keyPressed && key=='a')
  {speM=-6;
}
  else if(keyPressed && key=='w' && jumpTimes>0)
  { speY=7;
    bY += 2;
    jumpTimes--;
    lockBisha=0;
}
 /* else if(keyPressed && key=='s'){speM=0;}
}*/
else{speM=0;}
if(speY<-7)
{
speY=-7;
}

}
/*
float gravity(float a)
{
    a += gACC;
    return a; 
}
*/

void bisha()
{
if (mode==0)
{
  if(map0[rY+1].charAt(rX+1)=='9' || map0[rY].charAt(rX+1)=='9')
  {
  //exit(); 
  game=0;
  }
if ((map0[rY+2].charAt(rX)=='9' || map0[rY+2].charAt(rX+2)=='9' ) && key=='y' && lockBisha==0 && numberShui>0)
{
      numberShui--;
  lockBisha=1;
  
  buff.play();
  buff.rewind();
mode=1;
}
}

if (mode==1)
{
  if(map1[rY+1].charAt(rX+1)=='9' || map1[rY].charAt(rX+1)=='9')
  {
  //exit(); 
  game=0;
  }
if ((map1[rY+2].charAt(rX)=='9' || map1[rY+2].charAt(rX+2)=='9' ) && key=='y' && lockBisha==0 && numberShui>0)
{
    numberShui--;
  lockBisha=1;
  buff.play();
  buff.rewind();
mode=2;
}
}

if (mode==2)
{
  if(map2[rY+1].charAt(rX+1)=='9' || map2[rY].charAt(rX+1)=='9' )
  {
  //exit(); 
  game=0;
  }
if ((map2[rY+2].charAt(rX)=='9' || map2[rY+2].charAt(rX+2)=='9' ) && key=='y' && lockBisha==0 && numberShui>0)
{
    numberShui--;
  lockBisha=1;
  buff.play();
  buff.rewind();
mode=3;
}
}

if (mode==3)
{
  if(map3[rY+1].charAt(rX+1)=='9' || map3[rY].charAt(rX+1)=='9')
  {
 // exit();
game=0;
  }
if ((map3[rY+2].charAt(rX)=='9' || map3[rY+2].charAt(rX+2)=='9' ) && key=='y'&& lockBisha==0 && numberShui>0)
{
mode=4;
buff.play();
  buff.rewind();
  numberShui--;
  lockBisha=1;
}
}
if (mode==3)
{
  if(map3[rY+1].charAt(rX+1)=='9' || map3[rY].charAt(rX+1)=='9')
  {
  game=0;
  }
if ((map3[rY+2].charAt(rX)=='9' || map3[rY+2].charAt(rX+2)=='9' ) && key=='y'&& lockBisha==0 && numberShui>0)
{
mode=4;
  numberShui--;
  lockBisha=1;
  buff.play();
  buff.rewind();
}
}
if (mode==4)
{
  if(map4[rY+1].charAt(rX+1)=='9' || map4[rY].charAt(rX+1)=='9')
  {
  game=0;
  }
}
}


void draw()
{

  if(key=='l')
  {
  bY=bY+5;
  }
if(game==1){
   //run.play();
 pinPoint();
  bY +=speY;
  if(speY!=0 || mapGround[rY+2].charAt(rX)=='0')
  {
  speY += gACC;
  }
  ground();
  bX -= speM;
  /*if(speY<-5)
  {
  speY=-5;
  }*/

   
   /////////////////////////////
   bisha();
 if(bY<=-840)
 {
   speY=0;
   game=0;
 }
  image(background[mode],bX+jiaozhunX,bY+jiaozhunY);
      if(bY<-544)
    {
    fill(#7792FA);
    rect(0,736+bY+544,1000,-bY-544);
    }
    if(bY>0)
    {
    fill(#7792FA);
    rect(0,0,1000,bY);
    }
    if((500)<=bX+320 && (500)>=bX+280 && (368)<=bY+270 && (368)>=bY+230 && lockShui[0]==0 )
    {
    shuidiMode[0]=0;
    numberShui++;
    lockShui[0]=1;
    get.play();
    get.rewind();
    }
        if((500)<=bX+910 && (500)>=bX+866 && (368)<=bY+180 && (368)>=bY+140 && lockShui[1]==0)
    {
    shuidiMode[1]=0;
        numberShui++;
    lockShui[1]=1;
      get.play();
    get.rewind();
    }
        if((500)<=bX+1652 && (500)>=bX+1612 && (368)<=bY+200 && (368)>=bY+160 && lockShui[2]==0)
    {
    shuidiMode[2]=0;
        numberShui++;
    lockShui[2]=1;
      get.play();
    get.rewind();
    }
        if((500)<=bX+1970 && (500)>=bX+1930 && (368)<=bY+300 && (368)>=bY+268 && lockShui[3]==0)
    {
    shuidiMode[3]=0;
        numberShui++;
    lockShui[3]=1;
      get.play();
    get.rewind();
    }
    ////////////////
        if((500)<=bX+1548 && (500)>=bX+1508 && (368)<=bY+600 && (368)>=bY+500)
    {
    KeyMode=0;
    barMode=1;
    }
    
    
   if((-bX+500)>2336 && (-bY+368)>864)
   {
   game=9;
   }
  if (shuidiMode[0]==1){
  image(shuidi,bX+300,bY+256);}
   if (shuidiMode[1]==1){
  image(shuidi,bX+896,bY+160);}
   if (shuidiMode[2]==1){
  image(shuidi,bX+1632,bY+180);}
   if (shuidiMode[3]==1){
  image(shuidi,bX+1950,bY+288);}
  if(bX>0)
    {
   fill(#7792FA);
   rect(0,0,bX,736); 
    }
  fill(#0C19F2);
  rect(960,0,40,numberShui*30);
  image(shuitiao,960,0);
  step++;
  if(speM==0 && direction==0)
  {image(mainChar[0],mX,mY);}
  else if(speM==0 && direction==1)
  {image(mainChar[4],mX,mY);}
  else if(speM>0)
  {
  image(mainChar[step%4],mX,mY);
  direction=0;
  }
    else if(speM<0)
  {
  image(mainChar[step%4+4],mX,mY);
  direction=1;
  }
  if (lockBisha==1)
  {image(guanghuan,mX-35,mY-10,100,100);}
  image(p, bX+50,bY+1118);
  image(GateClose,bX+133,bY+1118);
  if(368-bY>1000 && 500-bX<215)
  {
  bX=280;
  }
  
  if(KeyMode==0 && key=='u' && (500-bX)<200 && (368-bY)>1000)
  {
     image(Gate,bX+111,bY+1118);
     if(shut==0 && key=='o'){
       movie.play();
       image(movie, 0, 0,1000,736);
    }
    if(keyPressed && key=='i')
    {
    shut=1;
    }
  }
  else{movie.pause();}
 
      if(KeyMode==1)
    {
    image(Key,bX+1528,bY+560);
    }
    fill(0,0,0);
    text("Click p to leave this world", bX+3000,bY+350);
    if(key=='p')
    {
      game=0;
    }
    image(toten,bX+3000,bY+416);
    image(word,bX+3050,bY+350);
     mov.pause();
     chance.pause();
}
else if (game==3)
    {
      run.close();
       Run.stop();
    mov.play();
    image(mov, 100, 150,800,400);
    }
else if(game==0)
    {
      image(gameover,85,350);
      game=2;
    }
    else if (game==2)
    {
    delay(1500);
    game=3;
    }
   else if(game==9)
   {
     if(qunima==0)
     {
   bX=0;bY=0;
   qunima=1;
     }
     if((-bX+500)>2336 && (-bY+368)>864)
   {
   game=0;
   }
     pinPoint();
     bY +=speY;
  for(int i=0;i<300;i++)
  {
    if(i*32<=(-bX+500) && (i+1)*32>=(-bX+500))
    {
    rX=i;
    break;
    }
  }
  for(int k=0;k<40;k++)
  {
    if(k*32<=(-bY+368) && (k+1)*32>=(-bY+368))
    {
    rY=k;
    break;
    }
  }
   /*if(mapGround[int((-bY+368)/32)+1].charAt(int((500-bX)/32))!=0)
   {
   speY=0;
   }*/
   if(finalground[rY+2].charAt(rX+1)!='0')
   {
   speY=0;
   bY=368-rY*32;
   jumpTimes=10;
   //print(rX,rY,"||");
   //println(mapGround[rY+1].charAt(rX));
   }
   if(finalground[rY].charAt(rX+1)!='0')
   {
   speY=0;
   bY=368-(rY+1)*32;
   //print(rX,rY,"||");
   //println(mapGround[rY+1].charAt(rX));
   }
   else if((finalground[rY].charAt(rX+1)!='0' || finalground[rY+1].charAt(rX+1)!='0'))
   {
   speM=0;
   bX=500-rX*32+5;
   //print(rX,rY,"||");
   //println(mapGround[rY+1].charAt(rX));
   }
    else if((finalground[rY].charAt(rX)!='0' || finalground[rY+1].charAt(rX)!='0'))
   {
   speM=0;
   bX=500-rX*32-15;
   //print(rX,rY,"||");
   //println(mapGround[rY+1].charAt(rX));
   }
  image(Finalmap,bX-15,bY);
  if(bX>0)
    {
   fill(#7792FA);
   rect(0,0,bX,736); 
    }
  if(bY<-544)
    {
    fill(#7792FA);
    rect(0,736+bY+544,1000,-bY-544);
    }
    if(bY>0)
    {
    fill(#7792FA);
    rect(0,0,1000,bY);
    }
  //println(rX,rY);
   if(Final[rY+1].charAt(rX+1)=='9' || Final[rY].charAt(rX+1)=='9')
  {
    game=0;
  }
  if(speY!=0 || finalground[rY+2].charAt(rX)=='0')
  {
  speY += gACC;
  }
  bX -= speM;
  /*if(speY<-5)
  {
  speY=-5;
  }*/
   step++;
  if(speM==0 && direction==0)
  {image(mainChar[0],mX,mY);}
  else if(speM==0 && direction==1)
  {image(mainChar[4],mX,mY);}
  else if(speM>0)
  {
  image(mainChar[step%4],mX,mY);
  direction=0;
  }
    else if(speM<0)
  {
  image(mainChar[step%4+4],mX,mY);
  direction=1;
  }
  fill(0,0,0);
  text("Don't trust any water!!",500,40);
  if(Dur<14){
  chance.play();
  image(chance,0,0,1000,736); }
 else{
 }
  Dur=int(chance.time());
  if(bX<-8300)
  {
  image(win,250,100);
  }
  
   }
  ////////////////  
 if(Length<19){
  begining.play();
  image(begining,0,0,1000,736); 
Length=int(begining.time());}
 else{
 }
 if(keyPressed && key=='0')
 {
 Length=30;
 }
  if(bY>368)
  {
  speY=-1;
  }
  else if(bX>470)
  {
  bX=465;
  }
  if(key=='=')
  {
   mov.stop();
  mov.dispose();
  mov=null;
  movie.stop();
  movie.dispose();
  movie=null;
  begining.stop();
  begining.dispose();
  begining=null;
  Run.stop();
  chance.stop();
  chance.dispose();
  chance=null;
  Buff.stop();
  Get.stop();
  run.close();
  get.close();
  buff.close();
  super.stop();
  exit();
  }
  println(keyPressed);
  frameRate(40);
}  


/*
public void stop() {
 mov.stop();
  mov.dispose();
  mov=null;
  movie.stop();
  movie.dispose();
  movie=null;
  begining.stop();
  begining.dispose();
  begining=null;
  Run.stop();
  chance.stop();
  chance.dispose();
  chance=null;
  Buff.stop();
  Get.stop();
  run.close();
  get.close();
  buff.close();
  super.stop();
  println("nima");
  //paused = true;
} */
