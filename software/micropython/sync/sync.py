#!/usr/bin/python3

import subprocess
import getopt
import sys

BASE_DIR = ""

STRUCTURE = {
        'lib': {
            'app': {
                'base': BASE_DIR + 'app',
                'dirs': ['bmx160', 'drivers'],
                'files': [
                    'main.py',
                    # 'bmx160/bmx160_driver.py',
                    # 'bmx160/constants.py',
                    'drivers/sdcard.py'
                ],
            }
        },
    }


def main(argv):
    help_text = "sync.py -p <port>"
    port = "ser:/dev/ttyUSB0"  # default
    try:
        opts, args = getopt.getopt(argv, "hp:", ["port="])
    except getopt.GetoptError:
        print(help_text)
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print(help_text)
            sys.exit()
        elif opt in ("-p", "--port"):
            port = arg

    dirs = []
    files = []
    for k, v in STRUCTURE.items():
        dirs.append(k)
        for k2, v2 in v.items():
            dirs.append('{}/{}'.format(k, k2))
            for dir in v2['dirs']:
                dirs.append('{}/{}/{}'.format(k, k2, dir))
            files.append((k2, v2['base'], v2['files']))

    dir_cmds = []
    for dir in dirs:
        dir_cmds += ['md {}'.format(dir)]

    file_cmds = []
    for lib in files:
        for file in lib[2]:
            file_cmds += ['put {}/{} lib/{}/{}'.format(lib[1], file, lib[0], file)]

    file_rm_cmds = []
    for lib in files:
        for file in lib[2]:
            file_rm_cmds += ['rm lib/{}/{}'.format(lib[0], file)]

    dir_cmd = ';'.join(dir_cmds)
    file_cmd = ';'.join(file_cmds)
    file_rm_cmd = ';'.join(file_rm_cmds)

    cmd = ';'.join((dir_cmd, file_rm_cmd, file_cmd))

    print("Files to upload")
    print(dirs)
    print(files)
    print("")
    # print(dir_cmds)
    # print(file_cmds)
    # print("")
    # print(dir_cmd)
    # print(file_cmd)
    # print("")
    print(cmd)

    subprocess.run(['mpfshell', port, '-n', '-c', cmd])
    print("Uploading done")


if __name__ == "__main__":
    main(sys.argv[1:])
