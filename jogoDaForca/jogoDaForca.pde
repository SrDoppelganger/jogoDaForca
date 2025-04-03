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

//var que guarda tentativas erradas
String tentativas = "";

void setup(){
  //setup da tela do jogo
  size(600, 600);
  background(bgColor[0],bgColor[1],bgColor[2]);
  
  //chama a tela inicial do jogo
  telaDeInicio();
}

void draw(){
  if(cena == 2){
    //desenha cenário
    background(bgColor[0],bgColor[1],bgColor[2]);
    drawHud();
    
    //desenha homem na forca
    drawHangman();
    
    //desenha palavra
    textAlign(CENTER);
    fill(lineColor[0],lineColor[1],lineColor[2]);
    textSize(48);
    text(palavra_,300,300);
    
    //desenha tentativas erradas
    textAlign(LEFT);
    text(tentativas, 10, 430);
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
  
  fill(lineColor[0],lineColor[1],lineColor[2]);
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
      if (checkResp(resposta) && key != '1' && key != '2' && key != '3' && key != '4' && key != '5' && key != '6'){
      println("a letra "+key+" está presente na palavra!");
      letraCerta();
    }
    else if(key != '1' && key != '2' && key != '3' && key != '4' && key != '5' && key != '6'){
     letraErrada();
    }
  } 
}

String tentativasErradas(char key){
  tentativas = tentativas + key + " ";
  return tentativas;
}

void letraErrada(){
   tentativasErradas(key);
   erro ++;
   
   if(erro > 6){
     gameOver();
   }
   
   drawHangman();
}

void drawHangman(){
     switch(erro){
   case 0:
     break;
   case 1:
     fill(lineColor[0],lineColor[1],lineColor[2]);
     ellipse(150,80,40,40);
     break;
   case 2:
     fill(lineColor[0],lineColor[1],lineColor[2]);
     ellipse(150,80,40,40);
     
     stroke(lineColor[0],lineColor[1],lineColor[2]);
     line(150,80,150,200);
     break;
   case 3:
     fill(lineColor[0],lineColor[1],lineColor[2]);
     ellipse(150,80,40,40);
     
     stroke(lineColor[0],lineColor[1],lineColor[2]);
     line(150,80,150,200);
     line(150,100,190,140);
     break;
   case 4:
     fill(lineColor[0],lineColor[1],lineColor[2]);
     ellipse(150,80,40,40);
     
     stroke(lineColor[0],lineColor[1],lineColor[2]);
     line(150,80,150,200);
     line(150,100,190,140);
     line(150,100,110,140);
     break;
   case 5:
     fill(lineColor[0],lineColor[1],lineColor[2]);
     ellipse(150,80,40,40);
     
     stroke(lineColor[0],lineColor[1],lineColor[2]);
     line(150,80,150,200);
     line(150,100,190,140);
     line(150,100,110,140);
     line(150,200,190,240);
     break;
   case 6:
     fill(lineColor[0],lineColor[1],lineColor[2]);
     ellipse(150,80,40,40);
     
     stroke(lineColor[0],lineColor[1],lineColor[2]);
     line(150,80,150,200);
     line(150,100,190,140);
     line(150,100,110,140);
     line(150,200,190,240);
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
  textSize(72);
  textAlign(CENTER);
  text("Você perdeu!", 300,100);
  
  //trocar paleta
  textSize(48);
  fill(color1[0],color1[1],color1[2]);
  text("A palavra era: " + palavra, 300,350);
  //fill(75, 0, 130);
  
  textSize(32);
  fill(lineColor[0],lineColor[1],lineColor[2]);
  text("clique para continuar",300,450);
}

void gameWon(){
  cena = 3;
  background(bgColor[0],bgColor[1],bgColor[2]);
  
  
  fill(lineColor[0],lineColor[1],lineColor[2]);
  textSize(72);
  textAlign(CENTER);
  text("Você ganhou!", 300,100);
  
  //trocar paleta
  textSize(48);
  fill(color3[0],color3[1],color3[2]);
  text("A palavra era: " + palavra, 300,350);
  //fill(75, 0, 130);
  
  textSize(32);
  fill(lineColor[0],lineColor[1],lineColor[2]);
  text("clique para continuar",300,450);
}



void drawHud(){
  cena = 2;
  stroke(lineColor[0],lineColor[1],lineColor[2]);
  fill(lineColor[0],lineColor[1],lineColor[2]);
  strokeWeight(4);
  line(50, 50, 50, 300);
  line(50, 50,150,  50);
  line(150,50,150,80);
  rect(25,300,50,10);

  textAlign(LEFT);
  textSize(32);
  text("erros:",0,400);
}


//alterar temas de cores
void keyReleased(){
 //tema claro
  if(key == '1'){
   bgColor = new int[]{255, 255, 255};
   lineColor = new int[]{0, 0, 0};
   color3 = new int[] {0 , 0, 255};
   color1 = new int[] {255, 0, 0};
  }
  
  //tema escuro
  if(key == '2'){
   bgColor = new int[]{0, 0, 0};
   lineColor = new int[]{255, 255, 255};
   color3 = new int[] {65,102,245};
   color1 = new int[] {226,6,44};
  }
  
  //tema claro2
   if(key == '3'){
    bgColor = new int[]{245,245,220};
    lineColor = new int[]{47,79,79};
    color3 = new int[] {255,225,53};
    color1 = new int[] {102,51,153};
  }
  //tema escuro2
   if(key == '4'){
    bgColor = new int[]{8,8,8};
    lineColor = new int[]{50,205,50};
    color3 = new int[] {204,255,0};
    color1 = new int[] {158,253,56};
  }
  //tema claro3
  if(key == '5'){
    bgColor = new int[]{255,228,225};
    lineColor = new int[]{18,97,128};
    color3 = new int[] {159,0,197};
    color1 = new int[] {255,0,144};
  }
  //tema escuro3
  if(key == '6'){
    bgColor = new int[]{7,54,66};
    lineColor = new int[]{181,137,0};
    color3 = new int[] {39,139,210};
    color1 = new int[] {220,50,46};
  }

}
