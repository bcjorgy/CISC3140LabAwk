BEGIN {
	{ FS = "," } #Field seperator to parse the values into associated columns
}
	{
			if (NR > 1){

			{ year = $7; name = $2; earnings = $8; rank = $4 }

			#Adds athlete(key) to dictionary with earnings(value) from a certain year. If theres already a key value pair for athlete, the earnings gets aggregated.
			if ( earnings > 0 ){ 
				value = athlete_dict[name]
				value += $8
				athlete_dict[name] = value
			}
		}
} 
END {

	#formatting fields with newline "\n" and tab "\t" flags.

	print "\n\n\n\t\t\t\t Forbes Richest Athletes 1990 - 2020"
	print "\t\t\t\t    Highest paid athletes by year"
	print "\t\t\t\t        (Not including 2001)"
	print "\t\t\tTotal amount paid from athletes through years 1990-2020 \n"
	print "\t\t\t   Athlete \t\t\t\tEarnings($ in millions)\n"

	for (key in athlete_dict) {
		printf("\t\t\t %-30s\t\t\t%-5d\n", key, athlete_dict[key]);
	}

}
