//base de dados.
String[]palavras;
String palavra;
String palavra_;
char[] resposta;

//variaveis para temas de cores
int[] bgColor = {255, 255, 255};
int[] lineColor = {0, 0, 0};

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
    fill(lineColor[0],lineColor[1],lineColor[2]);
  }
}

void telaDeInicio(){
  cena = 0;
  
  textSize(90);
  textAlign(CENTER);
  fill(lineColor[0],lineColor[1],lineColor[2]);
  text("Jogo da Forca", 300, 200);
  
  textSize(32);
  fill(lineColor[0],lineColor[1],lineColor[2]);
  text("clique para começar", 300, 350);
}

void gameStart(){
  background(bgColor[0],bgColor[1],bgColor[2]);
  palavra = palavras[round(random(0,39))].toLowerCase();
  palavra_ = "_ ".repeat(palavra.length());
  resposta = palavra.toCharArray();
  erro = -1;
  i = 0;
  
  text(palavra_, 300, 300);
  //troca para a tela principal
  cena = 2;
}



void mouseReleased(){
 
  
  //tela de inicio
  if(cena==0){
    escolherPalavras();
  }
  //tela de escolha de palavras
  if(cena==1){
    delay(500);
    if(mouseX >= 100 && mouseX <= 500 && mouseY >= 202 && mouseY <= 272){
      palavras = loadStrings("frutas.txt");
      gameStart();
    }
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
 rect(100, 202,400,70);
 textSize(48);
 text("Frutas", 300, 250);
 
 noFill();
 rect(100, 302,400,70);
 textSize(48);
 text("Países", 300, 350);
 
 noFill();
 rect(100, 402,400,70);
 textSize(48);
 text("Animais", 300, 450);
 
}






//detecta o que foi digitado
void keyTyped(KeyEvent e){ 
  println("typed "+ key + " " + keyCode);
  
  //reseta o jogo
  if(key == '0'){
    gameStart();
  }
  
  if (checkResp(resposta)){
    println("a letra "+key+" está presente na palavra!");
    letraCerta();
  }
  else if(key != '0'){
   letraErrada();
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
      palavra_ = palavra_.replaceAll("_ ", "_"); //concerta problema com espaçamento
      String palavraRevelada = palavra_.substring(0, pos) + key + palavra_.substring(pos+1); 
      palavraRevelada = palavraRevelada.replaceAll("_", "_ ");
      palavra_ = palavraRevelada;
      
      //testar sem isso
      stroke(bgColor[0],bgColor[1],bgColor[2]);
      fill(bgColor[0],bgColor[1],bgColor[2]);
      rect(200,200,400,180);
      
      fill(lineColor[0],lineColor[1],lineColor[2]);
      println(palavra_);
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
  background(bgColor[0],bgColor[1],bgColor[2]);
  
  fill(lineColor[0],lineColor[1],lineColor[2]);
  textSize(16);
  text("Pressione 0 para reiniciar",420,24);
  
  
  fill(lineColor[0],lineColor[1],lineColor[2]);
  textSize(32);
  textAlign(CENTER);
  text("Você perdeu!", 300,300);
  fill(lineColor[0],lineColor[1],lineColor[2]);
  text("A palavra era: " + palavra, 300,350);
  //fill(75, 0, 130);
}

void gameWon(){
  background(bgColor[0],bgColor[1],bgColor[2]);
  
  fill(lineColor[0],lineColor[1],lineColor[2]);
  textSize(16);
  text("Pressione 0 para reiniciar",420,24);
  
  textSize(32);
  textAlign(CENTER);
  text("Você ganhou!", 300,300);
}



void drawHud(){
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
