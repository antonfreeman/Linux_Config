import getpass

user = getpass.getuser()
bash_path = "/home/" + user + "/.bashrc"
bashrc = open(path, 'a+')


zsh_path = "/usr/share/zsh/manjaro-zsh-config"
zshrc = open(path, 'a+')

to_write = """
# ===========================================
#    Start of custom functions
# ===========================================

mkcd(){
    mkdir $1
    cd $1
}

source /etc/profile.d/bash_completion.sh

alias python=python3
alias pip="pip3"

NAU="asf222@linux.cefns.nau.edu"
nau="asf222@linux.cefns.nau.edu"

alias nau-ssh="ssh asf222@linux.cefns.nau.edu"
alias ssh-nau="ssh asf222@linux.cefns.nau.edu"

memtest()
{
	valgrind --tool=memcheck --leak-check=full --track-origins=yes ./$(ls | grep "sim0" | tail -1) -rs $(ls | grep "\.cnf" | tail -1)
}


make_prog()
{
	test=`ls . | grep "\.o" -m 1`

	if [ -e *_mf ] && [ $test ]
	then
   		make -f *_mf clean
   		make -f *_mf
	else
   		make -f *_mf
	fi

}

make_support_files()
{
	if [ -z $1 ]
	then
		echo 'Start Simulator Configuration File:\nVersion/Phase: 1.05\nFile Path: metadata_0.mdf\nCPU Scheduling Code: FCFS-N\nQuantum Time (cycles): 3\nMemory Available (KB): 11100\nProcessor Cycle Time (msec): 10\nI/O Cycle Time (msec): 20\nLog To: Monitor\nLog File Path: logfile_1.lgf\nEnd Simulator Configuration File.' > config0.cfg
	fi

	if [ -z $2 ]
	then
		python /home/anton/Code/OS-TEST-SUIT/Support_Files/proggen.py /home/anton/Code/OS-TEST-SUIT/Core_Files/metadata_0.mdf 50 20 yes 7
	fi

}


simtest()
{
	config_file=`ls | grep "\.cnf" | tail -1`
	metadata_file=`cat $config_file | grep -o -m 1 "\w*\.mdf"`

	make_prog

	sim_file=`ls | grep "sim0" | tail -1`

	make_support_files $config_file $metadata_file


	if [ ! -z $sim_file ] && [ $config_file ] && [ $metadata_file ]
	then
		python -c "print('\n' + '='* $(tput cols) + '\n')"
		./$sim_file -rs $config_file
	fi

	# make -f *_mf
}


fast()
{
	git $1 origin master
}


fast-c()
{
	git add $(git rev-parse --show-toplevel)/*
	git commit -m "${1:-'Emergency fast commit (Sorry future me)'}"
	git push origin $(git branch --show-current)
}


cp-nau()
{
	scp $NAU:/home/a/asf222/$1/* ~/Documents
}


upload-nau()
{
	scp $(pwd)/* $NAU:/home/a/asf222/$1/
}


package()
{
	mkdir temp

	sim_num=`ls | grep -o "[S|s]im0[0-9]" | sort | tail -1 | grep -o [0-9][0-9]`

	c_files=`ls | grep ".c" | grep -v ".c\w" | grep -v "debug"`
	h_files=`ls | grep ".h" | grep -v ".h\w"`
	make_files=`ls | grep "_mf" | grep -v "\.\w"`

	exclude='--exclude=*.o --exclude=*.txt --exclude=*.cnf --exclude=*.py --exclude=*.mdf --exclude=sim$sim_num'
	source_dir='.'
	dest='Sim'$sim_num'_434072.tar.gz'

	tar $exclude -czvf $dest $source_dir
}

setup()
{
	sim_num=`ls | grep -o "[S|s]im0[0-9]" | sort | tail -1 | grep -o [0-9][0-9]`

	#echo "${1:-'simulator_mf'}:${2:-$sim_num}" > dependent.txt

	touch dependent.txt
	for filename in `ls | find *.c *.h | grep -v "debug" | sort`
	do
		echo "Parsing $filename: $sim_num"
		echo $filename >> dependent.txt
		cat $filename | grep '#include \"[a-z]*' | grep -o "\w*\.[h|c]" >> dependent.txt
		echo "------------------------------------" >> dependent.txt
	done


	python parse_dependencies.py ${1:-'simulator_mf'} ${2:-$sim_num}
	rm dependent.txt

}



simple-gcc(){
	gcc $1.c -o $1
}


runc(){
	gcc $1.c -o $1
	./$1
}

finder()
{
	nautilus ${1:-'.'}
}

# ===========================================
#    End of custom functions
# ===========================================
"""

bashrc.write(to_write)
zshrc.write(to_write)

bashrc.close()
zshrc.close()
