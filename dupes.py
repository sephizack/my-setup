import sys, os

dupefiles = {}

# Run:
# find ./ -type f -exec md5 {} \; | awk -F '=' '{print $2 "\t" $1}' > dupes.txt
for l in open("dupes.txt", "r"):
    spl = l.split("\t")
    md5 = spl[0].strip()
    file = spl[1].split("(")[1].strip()[0:-1]
    if md5 not in dupefiles:
        dupefiles[md5] = []
    dupefiles[md5].append(file)

print("Dupe files:")
for md5, dupes in dupefiles.items():
    if len(dupes) > 1:
        print("\n"+md5)
        for i, file in enumerate(dupes):
            print(" "+str(i+1)+" "+file)
        fileidx_to_keep = int(input("File to be kept (default 0, keep all) : ") or "0")
        if fileidx_to_keep == 0:
            print("Keeping all files")
            continue
        for i, file in enumerate(dupes):
            if (i+1) != fileidx_to_keep:
                os.remove(file)
                print("Removed "+file)
