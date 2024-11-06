dynamic text = '0'; // Stores the displayed text for the calculation
double numOne = 0; // Stores the first number in a calculation
double numTwo = 0; // Stores the second number in a calculation

dynamic result = ''; // Temporarily stores the result of operations
dynamic finalResult = ''; // Holds the final result to be displayed
dynamic opr = ''; // Stores the current operator
dynamic preOpr = ''; // Stores the previous operator for repeated calculations

// Main calculation function that takes in the button text and a callback to update display
void calculation(String btnText, Function updateDisplay) {
  // Reset calculator when 'AC' is pressed
  if (btnText == 'AC') {
    text = '0';
    numOne = 0;
    numTwo = 0;
    result = '';
    finalResult = '0';
    opr = '';
    preOpr = '';
  }
  // Handle consecutive '=' presses to repeat last operation
  else if (opr == '=' && btnText == '=') {
    if (preOpr == '+') {
      finalResult = add();
    } else if (preOpr == '-') {
      finalResult = sub();
    } else if (preOpr == 'x') {
      finalResult = mul();
    } else if (preOpr == '/') {
      finalResult = div();
    }
  }
  // Handle operator presses: +, -, x, /, =
  else if (btnText == '+' ||
      btnText == '-' ||
      btnText == 'x' ||
      btnText == '/' ||
      btnText == '=') {
    if (numOne == 0) {
      // Parse the first number from the result if it’s empty
      numOne = double.parse(result);
    } else {
      // Parse the second number from the result if it's filled
      numTwo = double.parse(result);
    }

    // Perform calculation based on the previous operator
    if (opr == '+') {
      finalResult = add();
    } else if (opr == '-') {
      finalResult = sub();
    } else if (opr == 'x') {
      finalResult = mul();
    } else if (opr == '/') {
      finalResult = div();
    }

    // Store current operator for repeated calculations and reset result
    preOpr = opr;
    opr = btnText;
    result = '';
  }
  // Handle percentage calculation
  else if (btnText == '%') {
    result = numOne / 100;
    finalResult = doesContainDecimal(result);
  }
  // Handle decimal point entry
  else if (btnText == '.') {
    if (!result.toString().contains('.')) {
      result = '$result.'; // Append '.' if not already present
    }
    finalResult = result;
  }
  // Handle toggle between positive and negative
  else if (btnText == '+/-') {
    result = result.toString().startsWith('-')
        ? result.toString().substring(1)
        : '-$result';
    finalResult = result;
  }
  // Handle number button presses
  else {
    result = result + btnText; // Concatenate button text to result
    finalResult = result;
  }

  // Call the callback function to update the display with final result
  updateDisplay(finalResult);
}

// Function to perform addition and return the result as a string
String add() {
  result = (numOne + numTwo).toString();
  numOne = double.parse(result); // Update numOne with new result
  return doesContainDecimal(result);
}

// Function to perform subtraction and return the result as a string
String sub() {
  result = (numOne - numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

// Function to perform multiplication and return the result as a string
String mul() {
  result = (numOne * numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

// Function to perform division and return the result as a string
String div() {
  result = (numOne / numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

// Helper function to remove unnecessary decimals
String doesContainDecimal(dynamic result) {
  if (result.toString().contains('.')) {
    List<String> splitDecimal = result.toString().split('.');
    // Check if the decimal part is 0, then remove it
    if (!(int.parse(splitDecimal[1]) > 0)) {
      return splitDecimal[0].toString();
    }
  }
  return result;
}
