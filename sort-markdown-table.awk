/* sort-md-table                                                     */
/* If MD table is preceded by <!-- sorted -->, table will be sorted. */
/* Strict formatting is required. Table identifiers ('|') must be at */
/* first character on line.                                          */
/* Reads table into array and sorts using asort(). (requires gawk)   */
BEGIN {
	sorting = 0; pastHeader = 0;
}
{
	/* Check if we found comment in MD to sort table */
	if (match($0, /^<!-- sorted -->/)) {
		printf("%s\n", $0);
		sorting = 1;
	} else {

		/* Check if we are sorting */
		if (sorting == 1) {

			/* Check if past the table header. We don't sort this */
			if (pastHeader == 0) {
				if (match($0, /^\| --[-\| ]*/)) {
					printf("%s\n", $0);
					pastHeader = 1;
				} else {
					printf("%s\n", $0);
				}
			} else {
				/* Check if still inside a table, add row to array if we are */
				if (match($0, /^\|/)) {
					sorting = 1;
					arr[idx++] = $0;
				} else {

					/* Done with table, sort, and output */
					asort(arr)
					for (i in arr) {
						printf("%s\n", arr[i]);
					}

					/* Reset for next table */
					sorting = 0;
					pastHeader = 0;
					split("", arr);

					/* Print line read but not part of table */
					printf("%s\n", $0);
				}
			}
		} else {
			/* Normal line, just output */
			printf("%s\n", $0);
		}
	}

}
