#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>

std::ifstream file;
std::string currentSymbol;

bool S_EXPR(), LIST(), ELEMENTS();

void next(){
  if(!(file >> currentSymbol)) {
    currentSymbol = "EOF";
  }
}

void accept(const std::string& symbol){
  if(currentSymbol == symbol) {
    next();
  }
  else {
    std::cout << "ERROR: expected " << symbol << ", got " << currentSymbol << std::endl;
    std::exit(EXIT_FAILURE);
  }
}

// <list> ::= "(" <elements> ")" | "(" ")"
bool LIST() {
  if(currentSymbol == "OPEN_PARENTHESES") {
    accept("OPEN_PARENTHESES");

    if(currentSymbol != "CLOSE_PARENTHESES") {
      if (!ELEMENTS()) {
        return false;
      }
    }

    accept("CLOSE_PARENTHESES");
    return true;
  }
  else {
    std::cout << "ERROR: expected OPEN_PARENTHESES, got " << currentSymbol << std::endl;
    return false;
  }
}

// <elements> ::= <s-expr> <elements> | <s-expr>
bool ELEMENTS() {
  if (!S_EXPR()) {
    return false;
  }
  if (currentSymbol == "ATOM" || currentSymbol == "OPEN_PARENTHESES") {
    return ELEMENTS();
  }

  return true;
}

// <s-expr> ::= <atom> | <list>
bool S_EXPR() {
  if (currentSymbol == "ATOM") {
    accept("ATOM");
    return true;
  }
  else if (currentSymbol == "OPEN_PARENTHESES") {
    return LIST();
  }
  else {
    std::cout << "ERROR: expected ATOM or OPEN_PARENTHESES, got " << currentSymbol << std::endl;
    return false;
  }
}

int main(int argc, char* argv[]) {
  if (argc < 2) {
    std::cout << "Must inform path to file" << std::endl;
    return -1;
  }

  file.open(argv[1]);
  if (!file.is_open()) {
    std::cout << "ERROR: couldn't open file" << std::endl;
    return -1;
  }

  next();

  if(ELEMENTS() && currentSymbol == "EOF"){
    std::cout << "SUCCESS!" << std::endl;
  } else {
    std::cout << "Failure." << std::endl;
    return -1;
  }

  return 0;
}
