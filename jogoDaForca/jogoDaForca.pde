//base de dados das palavras
import java.util.Scanner;

String[]palavras = {"maça", "pera", "banana", "abacaxi", "goiaba", "laranja","uva","cupuaçu","guaraná","pitanga","kiwi","melão","melancia","morango","pinha"};
String palavra = palavras[round(random(0,15))];
char[] resposta = palavra.toCharArray();


Scanner scan = new Scanner(System.in);

void setup(){
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
    text(key, 300,250);
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
