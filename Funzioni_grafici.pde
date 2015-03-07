

void disegnaTUTTO(int YY) {

if(sel!=16)
  grafico (200, (518-60)+YY, finzPag, sinfEro, numProg, progInd, numCer);
  if(sel==16)
    grafico (200, (518-60)+YY, finzPag/1.2, sinfEro/1.2, numProg/1.2, progInd/1.2, numCer/1.2);
  
  grafico4(540, 90+YY, 380, 25, finzPag, finz_europei);
  grafico3(540, 200+YY, 380, 25, finzPag, sinfEro);
  grafico2(540, 330+YY, 380, 25, tot, ini, scad);
  triangolo(600, 458+YY);

  if (vediTemi==true)
    graficoTemi(730, YY, TUTTI[sel], T);

  if (mouseX<984/2 || mouseY<YY)
    vediTemi=false;
}




////// triangololino sotto per aprire i temi

boolean vediTemi=false;

void triangolo(int x, int y) {


  if (mouseX>x+30 && mouseX<x+280 && mouseY>y+20)
    vediTemi=true;


  noStroke();
  fill(#2c3e50);
  triangle(x+30, y+75, x+58, y+20, x+58, y+75);
  rect(x+58, y+20, 200, 55);
  triangle(x+58+200, y+75, x+58+200, y+20, x+86+200, y+75);
  fill(255);
  textFont(font5, 15);
  text("TEMI", x+125, y+45);
}


int f=0;
void graficoTemi(int posX, int posY, float [] dati, String [] nomi) {

  float tuttit=0;
  fill(#34495e);

  rect(984/2, posY, 500, 512);

  textAlign(RIGHT);


//tuttit=tuttit+TUTTI[sel][0]+TUTTI[sel][1]+TUTTI[sel][2]+TUTTI[sel][3]+TUTTI[sel][4]+TUTTI[sel][5]+TUTTI[sel][6]+TUTTI[sel][7]+TUTTI[sel][8]+TUTTI[sel][9]+TUTTI[sel][10]+TUTTI[sel][11]+TUTTI[sel][12]+TUTTI[sel][13];


  somma=TUTTI[sel][13]/( 518 - 70);
println(somma);

  for (int i=0;i<(nomi.length)-6;i++) {

    // setta bianco e font 14

    strokeWeight(1);
    fill(palette[i]);
    textFont(font, 15);

    // scrive i nomi
    text(nomi[i], posX, posY+25+i*38);

    // setta paletta colori e font2 17, diegna linee e dati colorati

    stroke(palette[i]);


    //fa l'effetto sfumato alle linee sotto le scritte
    line(posX+5, posY+27+i*38, posX+150, (posY+15+prova[i]/somma) +(TUTTI[sel][i]/somma)/2 ) ;
    for (int j=0;j<255;j++) {
      stroke(palette[i], 1);
      line(posX-j, posY+27+i*38, posX+5, posY+27+i*38);
    }

    textFont(font2, 13);
    fill(225);

    // fa vedere solo due numeri decimali del float
    String sc = nf((dati[i]*100)/TUTTI[sel][13], 1, 1);

    text(int(dati[i])+" progetti      "+ sc  +"  %", posX, posY+41+i*38);

    prova[i+1]=prova[i]+TUTTI[sel][i];

    // setta dinuovo stroke bianco e disegna quadrati
    fill(palette[i]);
    stroke(#2c3e50);
    rect(posX+150, posY+15+(prova[i])/somma, 35, TUTTI[sel][i]/somma);
  }

  textAlign(LEFT);
}


void grafico4(int posX, int posY, float lung, int largGraf, float tot, float ini) {



  float x= tot*13*GRAN/lung;

  int prog_non_pag=int(tot*13*GRAN);
  int prog_non_ero=int(ini*13*GRAN);

  fill(255);
  textFont(font, 15);


  text("Finanziamenti  Europei: ", posX, posY+largGraf);

  fill(#A3E496);
  textFont(font2, 18);
  text("                                           " + (prog_non_pag-prog_non_ero)+"  mil.", posX, posY+largGraf*2);



  fill(255);


  textFont(font, 15);
  text("Finanziamenti Nazionali: ", posX, posY+largGraf*2);
  fill(#95CAE4);
  textFont(font2, 18);

  text("                                           " +prog_non_ero+"  mil.", posX, posY+largGraf);



  fill(255);



  fill(#A3E496);
  stroke(0, 0);
  rect(posX, posY+largGraf*2.5, prog_non_pag /x, largGraf);
  fill(#95CAE4);


  rect(posX, posY+largGraf*2.5, prog_non_ero /x, largGraf);
}




void grafico3(int posX, int posY, float lung, int largGraf, float tot, float ini) {



  float x= tot*13*GRAN/lung;

  int prog_non_pag=int(tot*13*GRAN);
  int prog_non_ero=int(ini*13*GRAN);

  fill(255);
  textFont(font, 15);


  text("Finanziamenti  erogati: ", posX, posY+largGraf);

  fill(#A3E496);

  textFont(font2, 18);
  text("                                           " +prog_non_ero+"  mil.", posX, posY+largGraf);

  fill(255);


  textFont(font, 15);
  text("Finanziamenti da erogare: ", posX, posY+largGraf*2);
  fill(#FF8000-125);
  textFont(font2, 18);
  text("                                           " + (prog_non_pag-prog_non_ero)+"  mil.", posX, posY+largGraf*2);

  fill(255);



  fill(#FF8000-125);
  stroke(0, 0);
  rect(posX, posY+largGraf*2.5, prog_non_pag /x, largGraf);
  fill(#A3E496);


  rect(posX, posY+largGraf*2.5, prog_non_ero /x, largGraf);
}



void grafico2(int posX, int posY, float lung, int largGraf, float tot, float ini, float scad) {



  float x= tot/lung;

  int prog_non_ini=int(tot-ini);
  int prog_non_fin=int(tot-scad);

  fill(255);
  textFont(font, 15);
  text("Progetti con date indefinite: "+int(prog_non_fin+prog_non_ini)+" su "+int (tot), posX, posY);

  text("Data inizio indefinita: ", posX, posY+largGraf);
  fill(#D8FF00-125);
  textFont(font2, 18);
  text("                                        " + prog_non_ini, posX, posY+largGraf);
  fill(255);


  textFont(font, 15);
  text("Data fine indefinita: ", posX, posY+largGraf*2);
  fill(#FF8000-125);
  textFont(font2, 18);
  text("                                        " +prog_non_fin, posX, posY+largGraf*2);
  fill(255);



  fill(255, 100);
  stroke(0, 0);
  rect(posX, posY+largGraf*2.5, lung, largGraf);
  fill(#D8FF00-125);

  rect(posX, posY+largGraf*2.5, prog_non_ini /x, largGraf);

  fill(#FF8000-125);

  rect(posX+prog_non_ini /x, posY+largGraf*2.5, prog_non_fin/x, largGraf);
  stroke(0);
}






boolean ombra=true;
boolean dis_dati=false;


void grafico(int pos_X, int pos_Y, float diam_A, float diam_B, float lungTOT, float lungGIU, float numCerchi) {



  // translate(pos_X,pos_Y);
  float cont=0;
  float varColor=0;
  float a=0;
  float a1=0;


  /////////7 DISEGNA OMBRA
  ////////////////////////////
  if (numProg>100 && ombra) {
    for (float i=0;i<102;i++) {
      noStroke(); 
      a1=a1+(diam_A-diam_B)/lungTOT;
      if (i<100) {
        fill(51+101-i, 72+101-i, 93+101-i);
      }
      cont++;
      if (cont>lungTOT/numCerchi) {
        ellipse (pos_X+i, pos_Y-i, diam_B+a1, diam_B+a1);
      }
    }
  }
  ////////////////////////////


  //disegna LINEE 2
  strokeWeight(2);
  stroke(255);
  fill(44, 62, 80);
  ellipse (pos_X, pos_Y-lungTOT, diam_A, diam_A);

  ellipse (pos_X, pos_Y, diam_B, diam_B);



  for (float i=0;i<lungTOT;i++) {
    // calcola il valore da aggiungere ad ogni cerchio per aumentare dal diametro A al diam B
    a=a+(diam_A-diam_B)/lungTOT;
    // contatore per disegnare il numero di cerchi
    cont++;
    if (cont>lungTOT/numCerchi) {
      varColor=varColor+(255/numCerchi);
      // varia i colori dei cerchi in maniera proggressiva
      if (i<lungGIU) {
        fill(255, 0, 0, 80);
      }


      else {
        //  fill(255-varColor,255-varColor,varColor,50);
        fill(0, varColor+40, varColor+100, 50);
      }


      strokeWeight(2);
      stroke(255, 20);
      // disegna i cerchi da A a B


      if (mouseX>pos_X-diam_B && mouseX<pos_X+diam_B && mouseY<pos_Y+diam_B/2 && mouseY>pos_Y-lungTOT-diam_A/2) {
        dis_dati=true;
        ombra=false;
        fill(0, varColor+40, varColor+100, 0);
      }
      else
      {
        ombra=true;
        dis_dati=false;
      }

      ellipse (pos_X, pos_Y-i, diam_B+a, diam_B+a);
      // azzera il contatore
      cont=0;
    }
  }
  strokeWeight(2);




  if (dis_dati==true) {


    ///linee lunghezza


    fill(200);



    dottedLine(pos_X, pos_Y-lungTOT, pos_X+diam_A/2+20, pos_Y-lungTOT, 40);
    dottedLine(pos_X, pos_Y, pos_X+diam_A/2+20, pos_Y, 40);
    dottedLine(pos_X+diam_A/2+20, pos_Y, pos_X+diam_A/2+20, pos_Y-lungTOT, 60);
    dottedLine(pos_X+diam_A/2+20, pos_Y-lungTOT/2, pos_X+diam_A/2+20+30, pos_Y-lungTOT/2, 40);
    textSize(13);
    text(" N. Progetti:", pos_X+diam_A/2+20+35, pos_Y-lungTOT/2);

    textSize(15);
    text(int(numProg*13*GRAN), pos_X+diam_A/2+20+35, pos_Y+15-lungTOT/2);

    fill(20, 128, 255);


    // linee cerchio grande
    dottedLine(pos_X, pos_Y-lungTOT-diam_A/2, pos_X+diam_A/2+40, pos_Y-lungTOT-diam_A/2, 60);
    dottedLine(pos_X, pos_Y-lungTOT+diam_A/2, pos_X+diam_A/2+40, pos_Y-lungTOT+diam_A/2, 60);
    dottedLine(pos_X+diam_A/2+40, pos_Y-lungTOT-diam_A/2, pos_X+diam_A/2+40, pos_Y-lungTOT+diam_A/2, 60);
    dottedLine(pos_X+diam_A/2+40, pos_Y-lungTOT, pos_X+diam_A/2+40+15, pos_Y-lungTOT, 60);

    textSize(13);
    text(" Fin. Tot:", pos_X+diam_A/2+44+15, pos_Y-lungTOT);
    textSize(15);
    text(int(finzPag*13*GRAN)+" mil.", pos_X+diam_A/2+44+15, pos_Y+15-lungTOT);




    // linee cerchio piccolo


    dottedLine(pos_X, pos_Y-diam_B/2, pos_X+diam_A/2+40, pos_Y-diam_B/2, 60);
    dottedLine(pos_X, pos_Y+diam_B/2, pos_X+diam_A/2+40, pos_Y+diam_B/2, 60);
    dottedLine(pos_X+diam_A/2+40, pos_Y-diam_B/2, pos_X+diam_A/2+40, pos_Y+diam_B/2, 60);
    dottedLine(pos_X+diam_A/2+40, pos_Y, pos_X+diam_A/2+40+15, pos_Y, 60);

    textSize(13);
    text(" Fin. Erogati:", pos_X+diam_A/2+45+15, pos_Y);
    textSize(13);
    text(int(sinfEro*13*GRAN)+" mil.", pos_X+diam_A/2+45+15, pos_Y+15);


    //abbassa il fill delle ellissi
    fill(#2EC7FC, 50);
    ellipse (pos_X, pos_Y, diam_B, diam_B);
  }

  else {
    // setta il fill normale 
    fill(20, 128, 255, 90);
  }


  strokeWeight(2);
  stroke(255);
  // fill(20, 128, 255,90);
  ellipse (pos_X, pos_Y-lungTOT, diam_A, diam_A);
}//fine


void dottedLine(float x1, float y1, float x2, float y2, float steps) {



  for (int i=0; i<=steps; i++) {
    float x = lerp(x1, x2, i/steps);
    float y = lerp(y1, y2, i/steps);
    noStroke();
    ellipse(x, y, 2, 2);
  }
}

void grafico_piccolo(int pos_X, int pos_Y, float diam_A, float diam_B, float lungTOT, float lungGIU, float numCerchi) {



  // translate(pos_X,pos_Y);
  float cont=0;
  float varColor=0;
  float a=0;
  float a1=0;


  //disegna LINEE 2
  strokeWeight(1);
  stroke(255);
  fill(44, 62, 80);
  ellipse (pos_X, pos_Y-lungTOT, diam_A, diam_A);

  ellipse (pos_X, pos_Y, diam_B, diam_B);



  for (float i=0;i<lungTOT;i++) {
    // calcola il valore da aggiungere ad ogni cerchio per aumentare dal diametro A al diam B
    a=a+(diam_A-diam_B)/lungTOT;
    // contatore per disegnare il numero di cerchi
    cont++;
    if (cont>lungTOT/numCerchi) {
      varColor=varColor+(255/numCerchi);
      // varia i colori dei cerchi in maniera proggressiva
      if (i<lungGIU) {
        fill(255, 0, 0, 80);
      }


      else {
        //  fill(255-varColor,255-varColor,varColor,50);
        fill(0, varColor+40, varColor+100, 20);
      }


      strokeWeight(1);
      stroke(255, 20);
      // disegna i cerchi da A a B




      ellipse (pos_X, pos_Y-i, diam_B+a, diam_B+a);
      // azzera il contatore
      cont=0;
    }
  }
  strokeWeight(1);






  stroke(255);
  // fill(20, 128, 255,90);
  ellipse (pos_X, pos_Y-lungTOT, diam_A, diam_A);
}//fine


