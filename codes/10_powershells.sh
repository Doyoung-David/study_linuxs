# 15th of July, 2025
# Practice commands in Powershell
# ls, cd, pwd (Searching Command)
PS C:\Users\Administrator> cd /Develops
PS C:\Develops> ls


    디렉터리: C:\Develops


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15  오전 10:22                Downloads
d-----      2025-07-15   오전 8:33                VMs


PS C:\Develops> cd Downloads
PS C:\Develops\Downloads> ls


    디렉터리: C:\Develops\Downloads


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-14  오전 10:10      589891952 Docker Desktop Installer.exe
-a----      2025-07-14  오전 11:20    12851544064 Rocky-9.6-x86_64-dvd.iso
-a----      2025-07-14  오전 10:46      420928760 VMware-workstation-full-17.6.3-24583834.exe
-a----      2025-07-14  오전 11:59      111484776 VSCodeUserSetup-x64-1.102.0.exe


PS C:\Develops\Downloads> cd C:\/Develops/VMs
PS C:\Develops\VMs> cd C:\
PS C:\> cd C:\/Develops
PS C:\Develops> pwd

Path
----
C:\Develops


PS C:\Develops> ls


    디렉터리: C:\Develops


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15  오전 10:22                Downloads
d-----      2025-07-15   오전 8:33                VMs

# mkdir [Making Directory Command]
PS C:\Develops\temp_dir> mkdir dir_first


    디렉터리: C:\Develops\temp_dir


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 2:22                dir_first

PS C:\Develops\temp_dir> ls


    디렉터리: C:\Develops\temp_dir


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 2:22                dir_first
-a----      2025-07-15   오후 2:24              0 file_first.txt

# rm [Removing Directory or File Command]
PS C:\Develops\temp_dir> rm dir_first
PS C:\Develops\temp_dir> ls


    디렉터리: C:\Develops\temp_dir


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 2:24              0 file_first.txt


PS C:\Develops\temp_dir> rm file_first.txt
PS C:\Develops\temp_dir> ls

# mv [Moving Files or Directories to other location]
PS C:\Develops\temp_dir> mv file_first.txt C:\/Develops
PS C:\Develops\temp_dir> ls


    디렉터리: C:\Develops\temp_dir


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 2:38                dir_first


PS C:\Develops\temp_dir> cd C:\/Develops
PS C:\Develops> ls


    디렉터리: C:\Develops


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15  오전 10:22                Downloads
d-----      2025-07-15   오후 2:46                temp_dir
d-----      2025-07-15   오후 2:00                temp_dir_graphic
d-----      2025-07-15   오전 8:33                VMs
-a----      2025-07-15   오후 2:38              0 file_first.txt

PS C:\Develops> cd temp_dir
PS C:\Develops\temp_dir> mv dir_first C:\/Develops
PS C:\Develops\temp_dir> ls
PS C:\Develops\temp_dir> cd C:\/Develops
PS C:\Develops> ls


    디렉터리: C:\Develops


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 2:38                dir_first
d-----      2025-07-15  오전 10:22                Downloads
d-----      2025-07-15   오후 2:48                temp_dir
d-----      2025-07-15   오후 2:00                temp_dir_graphic
d-----      2025-07-15   오전 8:33                VMs
-a----      2025-07-15   오후 2:38              0 file_first.txt


PS C:\Develops>
# Tree (Tree of Directories)
PS C:\Develops\temp_dir> tree
폴더 PATH의 목록입니다.
볼륨 일련 번호는 52B6-33C5입니다.
C:.
└─dir_first
    └─temp_dir_graphic
PS C:\Develops\temp_dir> mv dir_first C:\/Develops
PS C:\Develops\temp_dir> tree
폴더 PATH의 목록입니다.
볼륨 일련 번호는 52B6-33C5입니다.
C:.

에 하위 폴더가 없습니다.
PS C:\Develops\temp_dir>