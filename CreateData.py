import sys
import numpy

# THIS IS A UTILITY FUNCTION TO CREATE FILES FOR LZW COMPRESSION ALGORITHM
#  
# THE FUNCTION REQUIRES FOLLOWING FRAME FORMAT: -filename -filelength -flag -string(optional)
#
#
# FLAGS: 
#	-b	:	CREATES BINARY DATA
#	-s	:	TAKES THE LAST COMMANDLINE ARGUMENT STRING AND WRITES IT INTO FILE
#	-r	:	READ FROM ANOTHER TEXT FILE
#
#
# EXAMPLE_1:	python CreateData.py "data.txt" 10000 -b
# EXAMPLE_2:	python CreateData.py "data.txt" 10000 [a,b,c,d]
# EXAMPLE_3:	python CreateData.py "data.txt" -s "BANANA BANDANA"
# EXAMPLE_4:	python CreateData.py "data.txt" -r "readFrom.txt"
	


if str(sys.argv[3])=='-b':
    f = open(str(sys.argv[1]),"w")
    arr = numpy.random.randint(2, size=(int(sys.argv[2])))
    for i in range(int(sys.argv[2])):
        f.write(str(arr[i])+'\n')
elif str(sys.argv[2])=='-s':
    f = open(str(sys.argv[1]),"w")
    for i in range(len(sys.argv[3])):
        f.write(sys.argv[3][i]+'\n')
		
elif str(sys.argv[2])=='-r':
	f = open(str(sys.argv[3]),"r")
	fw = open(sys.argv[1],"w")
	arr = f.read()
	for i in range(len(arr)):
		if arr[i]==' ':
			fw.write('_\n')
		else:
			fw.write(arr[i]+'\n')
else:   
    sym = list(map(str,sys.argv[3].strip('[]').split(',')))
    f = open(str(sys.argv[1]),"w")
    arr = numpy.random.randint(len(sym), size=(int(sys.argv[2])))
    for i in range(int(sys.argv[2])):
        f.write(sym[arr[i]] +'\n')


print("new file created")