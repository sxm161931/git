package Copart;

import java.util.Scanner;

public class License {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		// Taking input from the user
		
		System.out.println("Please enter a string and an interger to group characters");
		Scanner scan = new Scanner(System.in);
		System.out.println("Please enter a string");
		String str = scan.nextLine();
		System.out.println("Please enter an interger to group characters");
		int k = scan.nextInt();
		StringBuilder strBuilder = new StringBuilder();
		
		// Processing the input entered
		
		for (int i = 0; i < str.length(); i++) {
			char c = str.toUpperCase().charAt(i);
			if (c != '-')
				strBuilder.append(c);
		}
		System.out.println(strBuilder);
		int total = strBuilder.length();
		System.out.println(total);
		int firstGroup = total % k;
		StringBuilder result = new StringBuilder();
		String restGroup = strBuilder.toString();
		
		// Handling the first group of the characters
		
		if (firstGroup > 0) {
			for (int i = 0; i < firstGroup; i++) {
				result.append(strBuilder.charAt(i));
			}
			restGroup = strBuilder.substring(firstGroup, strBuilder.length());
		}

		result.append("-");
		
		// Handling the remaining groups.
		
		while (restGroup.length() > 0) {

			for (int i = 0; i < k; i++) {
				char c = restGroup.charAt(i);
				result.append(c);
			}
			result.append("-");
			restGroup = restGroup.substring(k, restGroup.length());

		}

		System.out.println(result.substring(0, result.length() - 1));

	}

}
