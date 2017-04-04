package Copart;

import java.util.Scanner;

//Function to convert String to Integer.

public class StringToInteger {

	int String_Conversion(String str) {

		int length = str.length();
		int num = 0;
		int v = 0;
		int n = length - 1;
		for (int i = 0; i < str.length(); i++) {
			v = (int) str.charAt(i) - '0';
			num = (int) (num + (v * Math.pow(10, n)));
			n--;
		}

		return num;

	}

	public static void main(String Args[]) {
		String number;
		int value;
		System.out.println("Please enter a string of numbers");
		Scanner scan = new Scanner(System.in);
		number = scan.next();
		StringToInteger st = new StringToInteger();
		value = st.String_Conversion(number);
		System.out.print("The integer value of the number string is: ");
		System.out.print(value);
	}

}
