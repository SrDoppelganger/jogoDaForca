//base de dados
String[]palavras;
String palavra;
char[] resposta;


void setup(){
  //setup inicial das variavéis
  palavras = loadStrings("frutas.txt");
  palavra = palavras[round(random(0,17))].toLowerCase();
  resposta = palavra.toCharArray();
  
  //setup da tela do jogo
  size(600, 600);
  background(0);
}

void draw(){
  textSize(32);
  textAlign(CENTER);
  text(palavra, 300,300);
}

void keyTyped(KeyEvent e){
  println("typed "+ key + " " + keyCode);
  
  if (checkResp(resposta)){
    text("", 300,250);
    fill(0, 255, 0);
  }
  else{
    text("", 300,250);
    fill(255, 0, 0);
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
