
// funzione disegna menu delle province
//DISMENU_2__________________________________________________________________________________DISMENU_2
void disMenu_2(float posX_1, float posY_1, float lung_1, float larg_1, int maxElem) {

  // larg_1=(width/maxElem-2);
  //  lung_1=larg_1;

  //calcola inizio e fine menu
  fine=width-larg_1*maxElem;

  // disegna il menu con gli elementi
  for (float i=50; i<larg_1 * maxElem; i=i+larg_1) {
    elemento_2(i+posX_1, posY_1-60, larg_1, lung_1, province[int((i/larg_1)-1)]);
  }
}

int incrementoProx=0;
//DISMENU __________________________________________________________________________________DISMENU
// funzione disegna menu delle regioni
void disMenu(float posX_1, float posY_1, float lung_1, float larg_1, int maxElem) {

  larg_1=(width/maxElem-2);
  //  lung_1=larg_1;

  //calcola inizio e fine menu
  fine=width-larg_1*maxElem;

  // disegna il menu con gli elementi
  for (float i=50; i<larg_1 * maxElem; i=i+larg_1) {


int posizione_ele_=int(i/larg_1);



    elemento(i, posY_1, larg_1, lung_1, regioni[int((i/larg_1)-1)],posizione_ele_);



  }
  
  
  
  
  
  
  
}


//ELEMENTO_2 ___________________________________________________________________________ELEMENTO_2
//funzione per disegnare gli elementi del menu piccolo delle province
void elemento_2(float posX, float posY, float larg, float lung, String province) {

  /* settaggio valori elementi
   
   (Ax,Ay) 
   ._______
   |      |
   |      |
   |______|. (Bx,By)
   
   */

  float Ax = posX;
  float Ay = posY;
  float Bx = larg;
  float By = lung;

  fill(#6994b7);   /////// colore quadrati
  if (mouseX> posX && mouseX<posX+larg && mouseY>posY && mouseY<posY+lung) {

    fill(25, 200, 280);      // colore illuminati

    Ax=posX-larg/2;
    Ay=posY;
    Bx=larg*2;
    By=lung*2;

    //    rect(Ax, Ay, Bx, By);
    textFont(font, 18);
  }
  // se il puntatore del mouse è a sinistra dell'elemento sposta l'elemento a destra
  if (mouseX> posX && mouseX> posX+larg && mouseY> posY && mouseY< posY+lung) {
    textFont(font, 12);

    Ax=posX-larg/2;
    Ay=posY;
    Bx=larg;
    By=lung;
    textFont(font, 12);
  }
  // se il puntatore del mouse è a destra dell'elemento sposta l'elemento a sinistra
  if (mouseX< posX && mouseX<posX+larg && mouseY>posY && mouseY<posY+lung) {
    textFont(font, 12);  
    Ax=posX+larg/2;
    Ay=posY;
    Bx=larg;
    By=lung;
    textFont(font, 12);
  }
  // disegna gli elementi
  rect(Ax, Ay, Bx, By, smusso_rect);
  fill(0);
  //scrive la provincia
  text(province, Ax+10, posY+lung-30);
}



boolean click = false;
///// funzione del clik del mouse
void mouseClicked() {
  click=true;
}


int g=0;
int regioni_vecchie=0;
int sel=0;
boolean ook=false;
boolean disegnagraf=false;

//////////// FUNZIONE DISEGNA QUADRATO GRANDE SOTTO :
/////////////////////////////////////////////////////


void funSelet_reg (float larg, float posY, float lung) {

  //////// sistema che controlla il passaggio del mouse

  // definisce la posizione delle regioni in base alla X cioè alla posizione del mouse
  int[] regioni_num = new int[22];
  int regioneSelet=0;
  for (int i =1;i<22;i++) {
    regioni_num[i]=  i*int(larg);
  }

  for (int i =1;i<22;i++) {
    if (mouseX>regioni_num[i]-larg && mouseX<regioni_num[i] && mouseY> posY && mouseY<posY+lung) {

      regioneSelet=i-1;
    }
  }    

  sel= regioni_vecchie;

  if (click==true && mouseY>posY && mouseY<posY+lung && mouseX>larg && mouseX<width-larg) {   // inizio click
    g=3;
    regioni_vecchie=regioneSelet;
    click=false;
  }

  // lunghezza massima quadrato disegnato
  int maxLung_quad=50;        
  // colore quadrato

  // if(regioni_vecchie==regioneSelet || mouseY>posY+lung){
  /// algoritmo per animazione

  if (g>2 && regioni_vecchie>0) {
    strokeWeight(0);
    stroke(255, 0);
    fill(#34495e);
    disegnagraf=true;
    rect (20, posY+lung+45, width-40, 600-80, 10);


    ////////////////////
    /////CONTENUTI//////
    fill(255);
    textAlign(RIGHT);
    textFont(font3, 35);
    text(regioni[regioni_vecchie-1], width-50, posY+lung+100);

    textAlign(LEFT);

    textFont(font, 10);
    if (mouseY>posY+lung) {
      fill(255, 0);
      strokeWeight(2);
      stroke(#f1c40f);   ////// COLORE RETTANGOLINO DI SELEZIONE


      rect(((regioni_vecchie)*larg)+4, posY, larg, lung);
      stroke(#2c3e50);
      strokeWeight(2);
    }
  }

  //  }
}

//ELEMENTO___________________________________________________________________________ELEMENTO
// valore che definisce il tipo di regione e di conseguenza le sue relative province
int value=0;
//variabile che definisce la posizione del menu piccolo delle regioni
float position=0;

// funzione disegna elementi delle province e disegna il menu delle regioni
void elemento (float posX, float posY, float larg, float lung, String regioni, int posizione_ele) {

  /* settaggio valori elementi
   
   (Ax,Ay) 
   ._______
   |      |
   |      |
   |______|. (Bx,By)
   
   */

  float Ax=posX;
  float Ay=posY;
  float Bx=larg;
  float By=lung;
  boolean disegnaFreccia=false;
  int spost_test=0;

  // valore di spostamento dei quadrati grandi 
  int spostamento=40;


  //imposta lo stroke del background
  stroke(#2c3e50);

  ////////// FUNZIONE SELEZIONA CON CLICK //////
  //////////////////////////////////////////////
  funSelet_reg (larg, posY, lung);

  if (value==0) {
  }

  // gestione menu piccolo apertura
  //apre il menu delle province quando si sposta il mouse verso il basso
  if (value!=0 && mouseY>posY+lung) {
    if (value==5) {
      // colore e disegno quadratino piccolo che si sovrappone alla regione quado sono selezionate le relative province
      fill(100, 50);
      rect(position, Ay, Bx, By, smusso_rect);
      disMenu_2(position-150, posY+(lung*2)-(spostamento/2)+5, 50, 50, numeroQuadrati+1);
    }
  }

  // chiude il menu picocolo delle regioni
  if (value!=0 && mouseY>posY+lung+100 || mouseY<posY) {
    value=0;
  }

  // rect(posX,posY,larg,lung);
  fill(#4d6d87);         ////////////// COLORE  ELEMENTO   PICCOLO
  textFont(font, 12);  
  // condizione per avviare lo scorrimento solo al centro del menu
  if (mouseX>larg+10 && mouseX<width-larg-10) {

    ////////// INTERNO /////////

    // se il puntatore del mouse è all'INTERNO dell'elemento lo ingrandisce
    if (mouseX> posX-1 && mouseX<posX+larg && mouseY>posY && mouseY<posY+lung) {

      disegnaFreccia=true;
      // shape(s, posX-100, posY-60, 500, 500);

      /// imposta il valore per spostare il testo in alto
      spost_test = spostamento*3-15;

      //     shape(s, posX-100, posY-60, 500, 500);

      value=0;
      //gestione menu piccolo setta value con il numero relativo alla regione
      if (regioni=="Campania") {

        // assegna all'array vuoto province il valore all'arrey della regione esempio province[n]=campania[n]

        for (int i=0;i<campania.length;i++) {
          province[i]=campania[i];

          numeroQuadrati=campania.length;
        }
        // value è il valore relativo ad ogni regione
        value=5;
        position=posX;
      }

      fill(#2980b9);         ////////////// COLORE  ELEMENTO  GRANDE

      Ax=posX-larg;
      Ay=(posY-lung*2)+spostamento;
      Bx=larg*3;
      By=lung*3;

      textFont(font5, 18);
    }

    else {
      disegnaFreccia=false;
    }


    //se il puntatore è a destra dell'elemento lo sposta a destra
    if (mouseX>= posX && mouseX>=posX+larg && mouseY>posY && mouseY<posY+lung) {

      textFont(font, 12);  

      // disegna elemento laterale più vicino il doppio e spostalo 
      if (mouseX<posX+larg*2) {

        /// imposta il valore per spostare il testo in alto

        Ax=posX-larg*2;
        Ay=posY-lung+spostamento/2;
        Bx=larg*2;
        By=lung*2;
        textFont(font, 16);
        spost_test = spostamento*2-30;

        fill(#3498db);       ////////////// COLORE  ELEMENTO  MEDIO
      }

      // sposta elementi piu lontani a destra
      else {
        Ax=posX-larg*2;
        Ay=posY;
        Bx=larg;
        By=lung;
      }
    }

    //se il puntatore è a sinistra dell'elemento lo sposta a sinistra
    if (mouseX<= posX && mouseX<=posX+larg && mouseY>posY && mouseY<posY+lung) {

      textFont(font, 12);

      // disegna elemento laterale più vinino il doppio e spostalo 
      if (mouseX>posX-larg) {

        /// imposta il valore per spostare il testo in alto

        Ax=posX+larg;
        Ay=posY-lung+spostamento/2;
        Bx=larg*2;
        By=lung*2;

        textFont(font, 16);
        spost_test = spostamento*2-30;
        fill(#3498db);      ////////////// COLORE  ELEMENTO  MEDIO
      } 

      // sposta elementi piu lontani a sinistra
      else {
        Ax=posX+larg*2;
        Ay=posY;
        Bx=larg;
        By=lung;
      }
    }
  }

  //disegna RETTANGOLO DI BASE
  rect(Ax, Ay, Bx, By, smusso_rect);



/////////////////////////
  ///////DISEGNA GRAFICI PICCOLI SULLA BASE
  int XXX=int(Ax)+25;
  int YYY=int(Ay)+68;
  float INGRAN=(Bx/larg);
  // se l'elemento è piccolo
  float INGRAN2=0;


float  numProg_MENU =             0;  //200
float progInd_MENU =             0;  //50
 float finzPag_MENU =             0;  //150
float sinfEro_MENU =             0;  //80
float finz_europei_MENU=          0;


if(posizione_ele<21){
  numProg_MENU =             (TUTTI[posizione_ele][13]/13)/GRAN;  //200
 progInd_MENU =             ((TUTTI[posizione_ele][13]-TUTTI[posizione_ele][18])/13)/GRAN;  //50
  finzPag_MENU =             (TUTTI[posizione_ele][14]/13)/GRAN;  //150
 sinfEro_MENU =             (TUTTI[posizione_ele][15]/13)/GRAN;  //80
 finz_europei_MENU=          TUTTI[posizione_ele][16]/13/GRAN;
  
}
  
  if(posizione_ele<15 || posizione_ele==17 || posizione_ele>19){

  if (INGRAN==1){
    INGRAN2=2;
    grafico_piccolo(XXX, YYY, finzPag_MENU/11*INGRAN*INGRAN2, sinfEro_MENU/11*INGRAN*INGRAN2, numProg_MENU/11*INGRAN*INGRAN2, progInd_MENU/11*INGRAN*INGRAN2, 20);}
  // se l'elemento è medio
  if (INGRAN==2){
      INGRAN2=2;
    grafico_piccolo(XXX+22, YYY+60, finzPag_MENU/10*INGRAN*INGRAN2, sinfEro_MENU/10*INGRAN*INGRAN2, numProg_MENU/10*INGRAN*INGRAN2, progInd_MENU/10*INGRAN*INGRAN2, 20);}
  // se l'elemento è grande
  if (INGRAN==3){
      INGRAN2=1.9;
    grafico_piccolo(XXX+48, YYY+105, finzPag_MENU/10*INGRAN*INGRAN2, sinfEro_MENU/10*INGRAN*INGRAN2, numProg_MENU/10*INGRAN*INGRAN2, progInd_MENU/10*INGRAN*INGRAN2, 20);}
  }
  
  
  /////////
    if(posizione_ele==15|| posizione_ele==18 || posizione_ele==19){

  if (INGRAN==1){
    INGRAN2=1;
    grafico_piccolo(XXX, YYY, finzPag_MENU/11*INGRAN*INGRAN2, sinfEro_MENU/11*INGRAN*INGRAN2, numProg_MENU/11*INGRAN*INGRAN2, progInd_MENU/11*INGRAN*INGRAN2, 20);}
  // se l'elemento è medio
  if (INGRAN==2){
      INGRAN2=1;
    grafico_piccolo(XXX+22, YYY+60, finzPag_MENU/10*INGRAN*INGRAN2, sinfEro_MENU/10*INGRAN*INGRAN2, numProg_MENU/10*INGRAN*INGRAN2, progInd_MENU/10*INGRAN*INGRAN2, 20);}
  // se l'elemento è grande
  if (INGRAN==3){
      INGRAN2=1;
    grafico_piccolo(XXX+48, YYY+105, finzPag_MENU/10*INGRAN*INGRAN2, sinfEro_MENU/10*INGRAN*INGRAN2, numProg_MENU/10*INGRAN*INGRAN2, progInd_MENU/10*INGRAN*INGRAN2, 20);}
  }
  
  
  if(posizione_ele==16){

  if (INGRAN==1){
    INGRAN2=0.9;
    grafico_piccolo(XXX, YYY, finzPag_MENU/11*INGRAN*INGRAN2, sinfEro_MENU/11*INGRAN*INGRAN2, numProg_MENU/11*INGRAN*INGRAN2, progInd_MENU/11*INGRAN*INGRAN2, 20);}
  // se l'elemento è medio
  if (INGRAN==2){
      INGRAN2=0.9;
    grafico_piccolo(XXX+22, YYY+60, finzPag_MENU/10*INGRAN*INGRAN2, sinfEro_MENU/10*INGRAN*INGRAN2, numProg_MENU/10*INGRAN*INGRAN2, progInd_MENU/10*INGRAN*INGRAN2, 20);}
  // se l'elemento è grande
  if (INGRAN==3){
      INGRAN2=0.9;
    grafico_piccolo(XXX+48, YYY+105, finzPag_MENU/10*INGRAN*INGRAN2, sinfEro_MENU/10*INGRAN*INGRAN2, numProg_MENU/10*INGRAN*INGRAN2, progInd_MENU/10*INGRAN*INGRAN2, 20);}
  }


  //rimpicciolisce le parole più lunghe
  if (regioni=="Trentino-Alto Adige" || regioni=="Friuli-Venezia Giulia") {
    textFont(font, 12);
  }

  if (regioni=="Emilia-Romagna") {
    textFont(font, 15);
  }


  //scrivi il testo
  
  if(posizione_ele<20){
  fill(#2c3e50);
  text(regioni, Ax+11, posY+21-spost_test);
  fill(255);
  text(regioni, Ax+10, posY+20-spost_test);
 }
   if(posizione_ele==20 && INGRAN==1){
    fill(#2c3e50);
  text("Sarde", Ax+11, posY+21-spost_test);
  fill(255);
  text("Sarde", Ax+10, posY+20-spost_test);
   
   
   
   }
   
      if(posizione_ele==20 && INGRAN>1){
    fill(#2c3e50);
  text("Sardegna", Ax+11, posY+21-spost_test);
  fill(255);
  text("Sardegna", Ax+10, posY+20-spost_test);
   
   
   
   }
   
   
 
 
  stroke(#2c3e50);
//  }
  // disegna un rettangolino in alto per cancellare le scritte
  fill(#2c3e50); // sfondo del BACKGROUND !!!!!!!
  rect (posX+larg*3, posY-70, 50, 50);
  


  
  if (disegnaFreccia)
    shape(s, posX-100, posY-50, 500, 500);
    

}

