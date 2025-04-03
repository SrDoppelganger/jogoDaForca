//base de dados.
String[]palavras;
String palavra;
String palavra_;
char[] resposta;

//variaveis para temas de cores
int[] bgColor = {255, 255, 255};
int[] lineColor = {0, 0, 0};
int[] color1 = {255, 0, 0};
int[] color2 = {0, 255, 0};
int[] color3 = {0, 0, 255};

//contador de erros
int erro = 0;

//ordenação das palavras na tela
int i = 0;

//verificar qual cena o jogo se encontra (0-tela de inicio, 1-tela de escolha de db, 2-tela de principal, 3-tela de fim)
int cena;

void setup(){
  //setup da tela do jogo
  size(600, 600);
  background(bgColor[0],bgColor[1],bgColor[2]);
  
  //chama a tela inicial do jogo
  telaDeInicio();
}

void draw(){
  if(cena == 2){
    drawHud();
  }
}

void telaDeInicio(){
  cena = 0;
  
  background(bgColor[0],bgColor[1],bgColor[2]);
  
  textSize(90);
  textAlign(CENTER);
  fill(lineColor[0],lineColor[1],lineColor[2]);
  text("Jogo da Forca", 300, 200);
  
  textSize(48);
  fill(color2[0],color2[1],color2[2]);
  text("Jogar", 300, 550);
  noFill();
  strokeWeight(2);
  stroke(color2[0],color2[1],color2[2]);
  rect(200,500,200,80);
}

void gameStart(){
  background(bgColor[0],bgColor[1],bgColor[2]);
  palavra = palavras[round(random(0,palavras.length - 1))].toLowerCase();
  palavra_ = "_ ".repeat(palavra.length());
  resposta = palavra.toCharArray();
  erro = -1;
  i = 0;
  
  textSize(48);
  text(palavra_, 300, 300);
  //troca para a tela principal
  cena = 2;
}



void mouseReleased(){
  //tela de inicio
  if(cena==0){
    if(mouseX >= 200 && mouseX <= 400 && mouseY >= 500 && mouseY <= 580){
      escolherPalavras();
    }
  }
  //tela de escolha de palavras
  if(cena==1){
    if(mouseX >= 100 && mouseX <= 500 && mouseY >= 202 && mouseY <= 272){
      palavras = loadStrings("frutas.txt");
      gameStart();
    }
    if(mouseX >= 100 && mouseX <= 500 && mouseY >= 302 && mouseY <= 372){
      palavras = loadStrings("paises.txt");
      gameStart();
    }
    if(mouseX >= 100 && mouseX <= 500 && mouseY >= 402 && mouseY <= 472){
      palavras = loadStrings("animais.txt");
      gameStart();
    }
  }
  //tela de fim
  if(cena == 3){
    telaDeInicio();
  }
}

void escolherPalavras(){
 cena = 1; 
 background(bgColor[0],bgColor[1],bgColor[2]);
 
 fill(lineColor[0],lineColor[1],lineColor[2]);
 textSize(48);
 text("Escolha o Tema", 300, 50);
 
 //opções
 noFill();
 stroke(color1[0],color1[1],color1[2]);
 rect(100, 202,400,70);
 fill(color1[0],color1[1],color1[2]);
 textSize(48);
 text("Frutas", 300, 250);
 
 noFill();
 stroke(color2[0],color2[1],color2[2]);
 rect(100, 302,400,70);
 textSize(48);
 fill(color2[0],color2[1],color2[2]);
 text("Países", 300, 350);
 
 noFill();
 stroke(color3[0],color3[1],color3[2]);
 rect(100, 402,400,70);
 fill(color3[0],color3[1],color3[2]);
 textSize(48);
 text("Animais", 300, 450);
 
}






//detecta o que foi digitado
void keyTyped(KeyEvent e){ 
  if(cena == 2){
      if (checkResp(resposta)){
      println("a letra "+key+" está presente na palavra!");
      letraCerta();
    }
    else if(key != '0'){
     letraErrada();
    }
  } 
}

void letraErrada(){
   text(key, 10 + i, 430);
   i += 24;
   erro ++;
   
   if(erro > 6){
     gameOver();
   }
   
   switch(erro){
   case 0:
     break;
   case 1:
     fill(lineColor[0],lineColor[1],lineColor[2]);
     ellipse(150,80,40,40);
     break;
   case 2:
     stroke(lineColor[0],lineColor[1],lineColor[2]);
     line(150,80,150,200);
     break;
   case 3:
     stroke(lineColor[0],lineColor[1],lineColor[2]);
     line(150,100,190,140);
     break;
   case 4:
     stroke(lineColor[0],lineColor[1],lineColor[2]);
     line(150,100,110,140);
     break;
   case 5:
     stroke(lineColor[0],lineColor[1],lineColor[2]);
     line(150,200,190,240);
     break;
   case 6:
     stroke(lineColor[0],lineColor[1],lineColor[2]);
     line(150,200,110,240);
     break;
   }
}


//se n der certo, trocar palavra por resposta
void letraCerta(){
  //verifica posição da letra e se a letra já foi colocada
  for(int pos = 0; pos<palavra.length(); pos++){
    
    if(palavra.charAt(pos) == key && palavra_.charAt(pos) != key){
      //forma nova string para mostrar na tela
      palavra_ = palavra_.replaceAll("_ ", "_"); //conserta problema com espaçamento
      String palavraRevelada = palavra_.substring(0, pos) + key + palavra_.substring(pos+1); 
      palavraRevelada = palavraRevelada.replaceAll("_", "_ ");
      palavra_ = palavraRevelada;
      
      stroke(bgColor[0],bgColor[1],bgColor[2]);
      fill(bgColor[0],bgColor[1],bgColor[2]);
      rect(150,200,400,180);
      
      textAlign(CENTER);
      fill(lineColor[0],lineColor[1],lineColor[2]);
      println(palavra_);
      textSize(48);
      text(palavra_,300,300);
      
      
    
       //termina o jogo caso o jogador advinhe a ultima letra
       if(!palavra_.contains("_")){
        gameWon();
        }
    }
  }

}

boolean checkResp(char[] resposta){
  boolean check = false;
  for(char letra : resposta){    
    if (letra == key){
      return check = true;
    }
  }
   return check;
}

void gameOver(){
  cena = 3;
  background(bgColor[0],bgColor[1],bgColor[2]);
  
  
  fill(lineColor[0],lineColor[1],lineColor[2]);
  textSize(32);
  textAlign(CENTER);
  text("Você perdeu!", 300,300);
  
  //trocar paleta
  fill(lineColor[0],lineColor[1],lineColor[2]);
  text("A palavra era: " + palavra, 300,350);
  //fill(75, 0, 130);
  
  text("clique para continuar",300,400);
}

void gameWon(){
  cena = 3;
  background(bgColor[0],bgColor[1],bgColor[2]);
  
  fill(lineColor[0],lineColor[1],lineColor[2]);
  textSize(16);
 
  
  textSize(32);
  textAlign(CENTER);
  text("Você ganhou!", 300,300);
  
  fill(lineColor[0],lineColor[1],lineColor[2]);
  text("A palavra era: " + palavra, 300,350);
  
  text("clique para continuar",300,400);
}



void drawHud(){
  cena = 2;
  stroke(lineColor[0],lineColor[1],lineColor[2]);
  strokeWeight(4);
  line(50, 50, 50, 300);
  line(50, 50,150,  50);
  line(150,50,150,80);
  rect(25,300,50,10);

  textAlign(LEFT);
  textSize(32);
  text("erros:",0,400);
}
