///  Is this a valid credit card selectedNumber?
///  Are credit card numbers just a random combination of the digits from 0-9? NO!
//  Credit card numbers are a systematic combination of numbers that can satisfy
//  a single test. This test is created so that errors can be avoided while
//  typing in credit card numbers as well as detect counterfeit cards!
//
//  The algorithm is as follows:
//
//  - Reverse the order of the digits in the selectedNumber.
//  - Take the first, third, ... and every other odd digit in the reversed digits
//  and sum them to form the partial sum s1
//  - Taking the second, fourth ... and every other even digit in the reversed digits:
//        - Multiply each digit by two and sum the digits if the answer is greater
//          than nine to form partial sums for the even digits
//        - Sum the partial sums of the even digits to form s2
//  - If s1 + s2 ends in zero then the original selectedNumber is in the form of a valid
//  credit card selectedNumber as verified by the Luhn test.
//  Example
/// Input : 49927398716
/// Output: 49927398716 passes the test

bool verifyCard(int ccNumber) {
  String reversedCcNumber =
      ccNumber.toString().split('').reversed.join().toString();
  print(reversedCcNumber); // #debug
  int s1 = 0, s2 = 0;

  for (int i = 0; i < reversedCcNumber.length; i++) {
    int selectedNumber = int.parse(reversedCcNumber[i]);
    if (i % 2 == 0) {
      //calculate s2
      s1 = s1 + selectedNumber;
    } else {
      //calculate s2
      int product = (selectedNumber * 2);
      s2 = s2 + (product > 9 ? ((product % 10) + 1) : product);
    }
  }
  print('s1:$s1 , s2:$s2'); //#debug
  int totalSum = s1 + s2;
  return (totalSum % 10) == 0;
}

main() {
  print(verifyCard(49927398716));
  print(verifyCard(2581));
}
