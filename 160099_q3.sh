#!/bin/bash
path=$1;
find $path -type f > file.txt
#cat file.txt
#rm file.txt


awk 'BEGIN{
	FS="/"
}
{	
	name=$NF
	print $NF
	if(name in store){
		print $0 " has a duplicate";
		path_1=$0;
		path_2=store[name];
		print path_1,path_2;
		#system("echo 1 > null.txt");
#		acmd="cmp --silent "path_1 " " path_2" || echo 0 > null.txt ";
		acmd2= "if \$(cmp --silent \""path_1 "\" \"" path_2 "\"); then echo 1 >> null.txt; else echo 0 >> null.txt ;fi";
		print acmd2;
		system(acmd2);
		getline null < "null.txt";
#		print null;
		if(null==1){
			print "Same";
			system("rm "path_1)
			system("ln -s "path_2 " "path_1);
		}
		
		
	}	
	else{
		store[name]=$0;
	}
	
}
END{

}' file.txt

rm file.txt null.txt

