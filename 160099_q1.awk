#!/usr/bin/awk
BEGIN{
 FS="\t";
# count;        
}
{#	print NF;	
	if(NF>=3){
		split($3,a," ");
		cmd=a[1];
#		print cmd;
	
		if(cmd in count){
			count[cmd]=count[cmd]+1;
		}
		else{
			count[cmd]=1;
#			print cmd,count[cmd];
		}
	}
}

END{
	for(i in count){
		print i,count[i] "\t";
	}
}

