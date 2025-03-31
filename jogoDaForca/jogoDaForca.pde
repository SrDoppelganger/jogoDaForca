//base de dados
String[]palavras;
String palavra;
char[] resposta;

//ordenação das palavras na tela
int i = 0;


void setup(){
  //setup inicial das variavéis (TODO colocar isso numa função para ser chamada dps)
  palavras = loadStrings("frutas.txt");
  palavra = palavras[round(random(0,17))].toLowerCase();
  resposta = palavra.toCharArray();
  
  //setup da tela do jogo
  size(600, 600);
  background(0);
  
  //setup dos gráficos
  stroke(255);
  strokeWeight(4);
  line(50, 50, 50, 250);
  line(50, 50,150,  50);
  line(150,50,150,80);
  rect(25,250,50,10);

  
  textSize(32);
  text("erros:",0,400);
}

void draw(){
  textSize(32);
  textAlign(CENTER);
  text(palavra, 300,300);
}

//detecta o que foi digitado
void keyTyped(KeyEvent e){ 
  println("typed "+ key + " " + keyCode);
  
  if (checkResp(resposta)){
    text(key, 300, 350);
    fill(0, 255, 0);   
  }
  else{
    text(key, 10 + i, 430);
    fill(255, 0, 0);
    i += 24;
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
