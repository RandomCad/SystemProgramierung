Nachfolgend eine Samlung an Aufgaben. Wenn es sich um Code handelt werden die Punkte mit # preifixed in (...) je zeile angegeben.
  
## Aufgabe 1
Schreiben sie ein script, welches alle Datein in einem Angegebenen Ordner in das folgende Namensschema umwandelt:
\<nummer\>Datei  

    #! /usr/bin/bash                    # (1)
    #Variablen erstellen
    Folder=$1                           # (1)
    num=0             
    #Alle existirende Datein werden durchgegange
    for i in $(ls $Folder); do          # (1)
      #Neubenenung nach dem Schema
      mv $Folder/$i $Folder/Datei$num   # (1)
      ((num++))                         # (1)
    done
  
## Aufgabe 1b
Stellen sie sicher, dass das soeben geschriebene script auch mehrfach ausgeführt werden kann! (schwer)

    #! /usr/bin/bash
    #Variablen erstellen
    Folder=$1                                                   
    num=0
    
    # Überprüft, ob Bereits Datein nach dem Gegebenen namenschema existiren
    if ls $Folder | grep -q 'Datei'; then                         # (1)
      # Es werden alle Dateien durchgegangen um die Hochstwertige Datei zu finden
      for i in $(ls $Folder | grep '.*Datei'); do                 
        if ((num <= $(echo $i | grep -o '[1234567890]*'))); then  # (2)
          # Stellt sicher, dass num korekt beginnt
          num=$(echo $i|grep -o '[1234567890]*')                  # (1)    
          # wird benötigt, damit nicht die Datei selbst überschrieben wird
          ((num++))                                               # (1)
        fi
      done
    fi
    
    #Alle existirende Datein werden durchgegange
    for i in $(ls $Folder); do          # (1)
      #Neubenenung nach dem Schema
      mv $Folder/$i $Folder/Datei$num   # (1)
      ((num++))                         # (1)
    done
