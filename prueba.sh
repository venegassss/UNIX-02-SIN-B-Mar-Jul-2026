    1  git remove -v
    2  git remote -v
    3  clear
    4  git remote -v
    5  git fetch upstream
    6  git checkout -b eval_p2_1_v1 upstream/eval_p2_1_v1
    7  git push -u origin eval_p2_1_v1
    8  history
    9  clear
   10  cd nebula
   11  ls
   12  mkdir bitacoras
   13  mkdir borradores
   14  ls
   15  git add .
   16  git commit -m "Fix problema 1: estructura de directorios corregida"
   17  mv cosmos.txt bitacoras/
   18  mv estrella.bak estrella.conf
   19  ls
   20  ls bitacoras
   21  git add .
   22  git commit -m "Fix problema 2: archivos movidos y renombrados"
   23  chmod 640 bitacoras/cosmos.txt
   24  ls -l bitacoras/cosmos.txt
   25  git add .
   26  git commit -m "Fix problema 3: permisos numericos 640 en cosmos.txt"
   27  chmod u+x galaxia.sh
   28  chmod o-w estrella.conf
   29  ls -l galaxia.sh
   30  ls -l estrella.conf
   31  git add .
   32  git commit -m "Fix problema 4: permisos simbolicos corregidos"
   33  git add .
   34  git commit -m "Fix problema 4: permisos simbolicos corregidos"
   35  chmod u+s galaxia.sh
   36  ls -l galaxia.sh
   37  git add .
   38  git commit -m "Fix problema 5: SUID activado en galaxia.sh"
   39  git add .
   40  git commit -m "Fix problema 5: SUID activado en galaxia.sh"
   41  chmod +t /tmp/nebula_zone
   42  mkdir -p /tmp/nebula_zone
   43  chmod +t /tmp/nebula_zone
   44  ls -ld /tmp/nebula_zone
   45  chmod o+x /tmp/nebula_zone
   46  ls -ld /tmp/nebula_zone
   47  git add .
   48  git commit -m "Fix problema 6: sticky bit en /tmp/nebula_zone"
   49  gpg --full-generate-key
   50  gpg --list-keys
   51  gpg --encrypt --recipient aurora@nebula.lab bitacoras/cosmos.txt
   52  ls bitacoras
   53  git add .
   54  git commit -m "Fix problema 7: llave GPG generada y cosmos.txt cifrado"
   55  gpg --clearsign nebula/estrella.conf
   56  gpg --clearsign estrella.conf
   57  find
   58  gpg --clearsign estrella.conf
   59  ls
   60  gpg --clearsign estrella.conf
   61  gpg --pinentry-mode loopback --clearsign estrella.conf
   62  export GPG_TTY=$(tty)
   63  gpg --pinentry-mode loopback --clearsign estrella.conf
   64  ls
   65  gpg --list-secret-keys
   66  gpg --local-user aurora@nebula.lab --pinentry-mode loopback --clearsign estrella.conf
   67  gpg --verify nebula/galaxia.sh.sig nebula/galaxia.sh
   68  gpg --verify galaxia.sh.sig galaxia.sh
   69  gpg --list-keys
   70  gpg --list-secret-keys
   71  gpg --export aurora@nebula.lab | gpg --import
   72  gpg --verify galaxia.sh.sig galaxia.sh
   73  gpg --list-secret-keys --keyid-format LONG
   74  gpg --export aurora@nebula.lab | gpg --import
   75  rm galaxia.sh.sig
   76  gpg --local-user aurora@nebula.lab --pinentry-mode loopback --detach-sign galaxia.sh
   77  gpg --verify galaxia.sh.sig galaxia.sh
   78  git add .
   79  git commit -m "Fix problema 8: firmas GPG corregidas y creadas"
   80  gpg --verify estrella.conf.asc
   81  gpg --verify galaxia.sh.sig galaxia.sh
   82  history