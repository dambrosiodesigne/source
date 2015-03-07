
//// DATI PER I GRAFICI
String [] T = {
  "Istruzione", 
  "Rafforzamento capacità della PA", 
  "Ambiente e prevenzione dei rischi", 
  "Ricerca e innovazione", 
  "Attrazione culturale, naturale e turistica", 
  "Inclusione sociale", 
  "Competitività per le imprese", 
  "Rinnovamento urbano  e rurale", 
  "Agenda digitale", 
  "Trasporti e infrastrutture a rete", 
  "Rinnovamento urbano  e rurale", 
  "Servizi di cura infanzia e anziani", 
  "Energia e efficienza energetica", 
  "Progetti totali", //13
  "Finanziamenti Totali", //14
  "Fianaziamenti Pagati", //15
  "Finanziamenti Europei", //16
  "Progetti iniziati", //17
  "Progetti con data di fine nulla", //18
};


float [] D = {
  4680, 
  59, 
  151, 
  407, 
  438, 
  103, 
  35, 
  148, 
  116, 
  35, 
  148, 
  407, 
  28, 
  6210, //13
  6419, //14
  1743, //15
  3516, //16
  6097, //17
  5589, //18
};


float GRAN= 1.6;


float numProg = 0;  //200

float progInd = 0;  //50

float finzPag = 0;  //150
float sinfEro = 0;  //80
//int numCer = int(D[14]/D[16]); //20

float finz_europei=0;
float numCer = 28; //20



float tot = D[13];
float ini= D[17];
float scad= D[18];

float somma=0;


float [] prova =new float[15];

PFont font;
PFont font2;
PFont font3;
PFont font5;

color[] palette=new color[13];


PImage img;







String [] regioni = {
  "Piemonte", "Valle d'Aosta", "Lombardia", "Trentino-Alto Adige", "Veneto", "Friuli-Venezia Giulia", "Liguria", "Emilia-Romagna", "Toscana", "Umbria", "Marche", "Lazio", "Abruzzo", "Molise", 
  "Campania", "Puglia", "Basilicata", "Calabria", "Sicilia", "Sardegna"
};


String []  province = new String [15];

String []  campania = {
  "Salerno", "Napoli", "Benevento", "Avellino", "Caserta"
};

int numeroQuadrati=5;

int valore_pos=0;

float fine=0;

// PShape per disegnare la frecetta
PShape s;
PShape sfuma1;

//  paramentri grafici:
int smusso_rect=5;


//// variabili grafici ////

void setup() {
  
  
    img = loadImage("info.jpg");




  

  background(#2c3e50);
  size(1024, 768);

 
  
  s = loadShape("fraccia.svg");
  sfuma1 = loadShape("sfumaa.svg");

  
  
    stroke(255, 0, 0);

  // setta i font utilizzati
  font = loadFont("Comfortaa15.vlw");
  font2 = loadFont("ComfortaaB.vlw");
    font3 = loadFont("Comfortaa-35.vlw");
    font5 = loadFont("Comfortaa-18.vlw");
  //setta la paletta di colori da utilizzare per il grafico dei temi

  for (int i=0;i<13;i++) {
    palette[i]=color(random(100)+125, random(100)+125, random(100)+125);
  }

}

int r=0;
//DRAW__________________________________________________________________________________DRAW
void draw() {
  
  

tot = TUTTI[sel][13];
ini=TUTTI[sel][17];
scad=TUTTI[sel][18];


  
numProg =             (TUTTI[sel][13]/13)/GRAN;  //200
progInd =             ((TUTTI[sel][13]-TUTTI[sel][18])/13)/GRAN;  //50
finzPag =             (TUTTI[sel][14]/13)/GRAN;  //150
sinfEro =             (TUTTI[sel][15]/13)/GRAN;  //80
finz_europei=          TUTTI[sel][16]/13/GRAN;
  




  background(#2c3e50);
  image(img, 240, 260,611,515);
  stroke(255);
  strokeWeight(2);
  // imposta la larghezza degli elementi in modo che entra nello schermo

  // disegna menu
  disMenu(0, 110, 75, 20, 21);
  if(disegnagraf==true)
disegnaTUTTO(height-530);


  
}

