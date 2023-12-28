assembler : assembler.o macro.o file_check.o read_file.o symbol_table.o extern_entry_table.o code_table.o text_analyze.o base_convert.o data_table.o assembler_functions.o
	gcc -g -ansi -Wall -pedantic assembler.o macro.o file_check.o read_file.o symbol_table.o extern_entry_table.o code_table.o text_analyze.o base_convert.o data_table.o assembler_functions.o -lm -o assembler
assembler.o : assembler.c macro.h file_check.h assembler_functions.h base_convert.h
	gcc -c -ansi -Wall -pedantic assembler.c -o assembler.o
macro.o : macro.c macro.h
	gcc -c -ansi -Wall -pedantic macro.c -o macro.o
file_check.o : file_check.c file_check.h symbol_table.h extern_entry_table.h code_table.h text_analyze.h base_convert.h data_table.h assembler_functions.h
	gcc -c -ansi -Wall -pedantic file_check.c -o file_check.o
read_file.o: read_file.c read_file.h
	gcc -c -ansi -Wall -pedantic read_file.c -o read_file.o
symbol_table.o : symbol_table.c symbol_table.h read_file.h
	gcc -c -ansi -Wall -pedantic symbol_table.c -o symbol_table.o
extern_entry_table.o: extern_entry_table.c 
	gcc -c -ansi -Wall -pedantic extern_entry_table.c -o extern_entry_table.o
text_analyze.o: text_analyze.c text_analyze.h
	gcc -c -ansi -Wall -pedantic text_analyze.c -o text_analyze.o
code_table.o: code_table.c base_convert.h
	gcc -c -ansi -Wall -pedantic code_table.c -o code_table.o
base_convert.o: base_convert.c base_convert.h
	gcc -c -ansi -Wall -pedantic base_convert.c -o base_convert.o
data_table.o: data_table.c data_table.h base_convert.h read_file.h text_analyze.h read_file.h
	gcc -c -ansi -Wall -pedantic data_table.c -o data_table.o
assembler_functions.o: assembler_functions.c assembler_functions.h symbol_table.h extern_entry_table.h code_table.h data_table.h 
	gcc -c -ansi -Wall -pedantic assembler_functions.c -o assembler_functions.o
