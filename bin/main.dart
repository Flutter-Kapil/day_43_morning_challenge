///  Is this a valid credit card number?
///  Are credit card numbers just a random combination of the digits from 0-9? NO!
//  Credit card numbers are a systematic combination of numbers that can satisfy
//  a single test. This test is created so that errors can be avoided while
//  typing in credit card numbers as well as detect counterfeit cards!
//
//  The algorithm is as follows:
//
//  - Reverse the order of the digits in the number.
//  - Take the first, third, ... and every other odd digit in the reversed digits
//  and sum them to form the partial sum s1
//  - Taking the second, fourth ... and every other even digit in the reversed digits:
//        - Multiply each digit by two and sum the digits if the answer is greater
//          than nine to form partial sums for the even digits
//        - Sum the partial sums of the even digits to form s2
//  - If s1 + s2 ends in zero then the original number is in the form of a valid
//  credit card number as verified by the Luhn test.
//  Example
/// Input : 49927398716
/// Output: 49927398716 passes the test

bool verifyCard(int ccNumber) {
  String reversedCcNumber =
      ccNumber.toString().split('').reversed.join().toString();
  print(reversedCcNumber); // #debug
  int s1 = 0;
  int s2 = 0;
  //step 1 for s1
  for (int i = 0; i < reversedCcNumber.length; i++) {
    if (i % 2 == 0) {
      s1 = s1 + int.parse(reversedCcNumber[i]);
    }
  }

  print(s1); //#debug
  //step 2 for s2
  for (int i = 0; i < reversedCcNumber.length; i++) {
    if (i % 2 != 0) {
      int product = (int.parse(reversedCcNumber[i]) * 2);
      if (product > 9) {
        s2 = s2 + int.parse(product.toString()[1]) + 1;
      } else {
        s2 = s2 + product;
      }
    }
  }
  print(s2); // #debug
  int totalSum = s1 + s2;

  return totalSum.toString()[totalSum.toString().length - 1] == '0';
}

main() {
  print(verifyCard(49927398716));
  print(verifyCard(2581));
}
