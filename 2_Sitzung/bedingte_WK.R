####################################################################### #
##########                                                              #
##########   Bitte das folgende Skript komplett ausführen               #
##########   (alles markieren und Strg + Enter, bzw. Apfel + Enter)     #
##########                                                              #
####################################################################### #
library(pander)
library(dplyr)
bedingte_WK <- mtcars
bedingte_WK$am <- ifelse(bedingte_WK$am == 1, "manuelle Schaltung", "Automatik")
bedingte_WK$gang <- case_when(bedingte_WK$gear == 3 ~ "3 Gänge", 
                              bedingte_WK$gear == 4 ~ "4 Gänge",
                              bedingte_WK$gear == 5 ~ "5 Gänge")



pander(table(bedingte_WK$am, bedingte_WK$gang))
####################################################################### #
#####                                                                   #
##### Sie sehen hier eine Häufigkeitstabelle, in der die Anzahl der     # 
##### Autos nach Art der Gangschaltung und Anzahl der Gänge abgetragen  #
##### sind.                                                             #
##### Berechnen Sie die bedingten Wahrscheinlichkeiten eine Automatik   #
##### Gangschaltung zu haben, unter der Bedingung 3 Gänge (oder 4 oder  #
##### 5) zu haben.                                                      #
#####                                                                   #
##### P(Automatik | 3 Gänge) = ?                                        #
##### P(Automatik | 4 Gänge) = ?                                        # 
##### P(Automatik | 5 Gänge) = ?                                        #
#####                                                                   #
####################################################################### #