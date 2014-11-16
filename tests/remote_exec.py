import getopt, sys, os
import paramiko

def main(argv):
    try:
        opt, args = getopt.getopt(argv, "hH:e:a:p:", ["help", "host=","execute=", "argument=","path="])
    except getopt.GetoptError, err:
        print str(err)
        usage()
        sys.exit(2)
    output = None
    verbose = False
    for o, a in opt:
        if o in ("-h", "--help"):
            usage()
            sys.exit()
        elif o in ("-H", "--host"):
            host=a
        elif o in ("-e", "--execute"):
            execute=a
	elif o in ("-p", "--path"):
	    path=a
        elif o in ("-a", "--argument"):
            argument=a
        else:
            assert False, "unhandled option"
    try:
        if (host and execute and path):
            print ("host="+host+"    execute="+execute+"    path="+path)
	    execu(host,execute,path)
    except getopt.GetoptError, err:
	    print ("not enough parameters given")

def execu(a,b,c):
    ssh = paramiko.SSHClient()
    ssh.load_system_host_keys()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(a, username='root')
    stdin, stdout, stderr = ssh.exec_command(b)

    output = stdout.read()

    result=output.split("Handle 0x")
    print result[4]

    #stdin.write('lol\n')
    stdin.flush()
#    print output



def usage():
    usage = """
    -h --help                 Prints this
    -e --execute (cmd)        Execute a system command
    -H --host	              Host
    -p --path		      Public key path
    -a --argument (argument   Print (argument)
    """
    print usage

if __name__ == "__main__":
    main(sys.argv[1:]) # [1:] slices off the first argument which is the name of the program
