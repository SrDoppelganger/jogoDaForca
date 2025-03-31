//base de dados
String[]palavras;
String palavra;
char[] resposta;

//contador de erros
int erro = 0;

//ordenação das palavras na tela
int i = 0;


void setup(){
  //setup inicial das variavéis (TODO colocar isso numa função para ser chamada dps)
  gameStart();
  
  //setup da tela do jogo
  size(600, 600);
  background(0);
  
  //setup dos gráficos
  drawHud();
  
}

void draw(){
  
}

//detecta o que foi digitado
void keyTyped(KeyEvent e){ 
  println("typed "+ key + " " + keyCode);
  
  if(key == '0'){
    gameStart();
  }
  
  if (checkResp(resposta)){
   //fill(75, 0, 130);  
   println("yaaay");
  }
  else{
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
     ellipse(150,80,40,40);
     noFill();
     break;
   case 2:
     line(150,80,150,200);
     break;
   case 3:
     line(150,100,190,140);
     break;
   case 4:
     line(150,100,110,140);
     break;
   case 5:
     line(150,200,190,240);
     break;
   case 6:
     line(150,200,110,240);
     break;
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
  background(0);
  textSize(32);
  textAlign(CENTER);
  text("Você perdeu!", 300,300);
  text("A palavra era: " + palavra, 300,350);
  //fill(75, 0, 130);
}

void gameStart(){
  background(0);
  palavras = loadStrings("frutas.txt");
  palavra = palavras[round(random(0,17))].toLowerCase();
  resposta = palavra.toCharArray();
  erro = -1;
  i = 0;
  
  drawHud();
}

void drawHud(){
  stroke(255);
  strokeWeight(4);
  line(50, 50, 50, 300);
  line(50, 50,150,  50);
  line(150,50,150,80);
  rect(25,300,50,10);

  textAlign(LEFT);
  textSize(32);
  text("erros:",0,400);
}
