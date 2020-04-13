all: Syllabus.pdf

## TODO: Replace [ with [\underline{ and ] with }]
Syllabus.pdf:  README.md
	pandoc README.md --reference-links --variable linkcolor="mediumblue" -o Syllabus.pdf

SyllabusRecap.pdf:  README.md
	pandoc README-CORONAVIRUS.md --reference-links --variable linkcolor="mediumblue" -o Syllabus.pdf
