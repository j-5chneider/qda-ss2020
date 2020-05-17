################################################################ #
#######                                              ########### #
#######  Anleitung                                   ########### #
#######                                              ########### #
################################################################ #
# Code markieren
# dann rechts oben "Run" klicken (oder Strg + Enter)

# Aufgabe: 
# 1. Führen Sie das Sktipt von oben bis unten komplett aus und schauen Sie sich die Ergebnisse an.
#    - was sagen uns die Ergebnisse aus dem frequentistischen und 
#    - was die Ergebnisse aus dem Bayes Faktor t-Test?
# 2. probieren Sie beim "Bayes Faktor t-Test" unterschiedliche das Intervalle und Unsicherheiten 
#    der Hypothesen aus:
#    - probieren Sie z.B. eine Hypothese für negative Effekte (-Inf bis 0) oder ein ganz 
#      spezifisches Intervall aus
#    - probieren Sie unterschiedliche Unsicherheiten aus ("medium", "wide", and "ultrawide") 
#      und beobachten Sie die Auswirkungen auf den BF
# 3. Generieren Sie eine andere Stichprobe oder stellen Sie den "wahren Effekt" der Population um und
#    führen Sie die beiden t-Tests nochmals aus.


################################################################ #
#######                                              ########### #
#######  Voraussetzung: Pakete instellieren & laden  ########### #
#######                                              ########### #
################################################################ #
install.packages(c("BayesFactor", "ggplot2"))
library(BayesFactor)
library(ggplot2)

################################################################ #
#######                                              ########### #
#######   Simulation von Daten                       ########### #
#######                                              ########### #
################################################################ #

# mit Mittelwert 480, SD = 30
mittel_diff <- 30        # EINGABE: Ihren gewünschten Mittelwertsunterschied ("wahrer Erffekt") eingeben
stichprobengroesse <- 10 # EINGABE: Ihre gewünschte Stichprobengröße eingeben

# Die Daten werden generiert
ttest_data <- data.frame(schlafdauer = c(rnorm(n = stichprobengroesse,
                                               mean = 480,
                                               sd = 30),
                                         rnorm(n = stichprobengroesse,
                                               mean = 480 + mittel_diff,
                                               sd = 30)),
                         gruppe = as.factor(c(rep("Kontrollgruppe", stichprobengroesse),
                                              rep("Experimentalgruppe", stichprobengroesse))))


# lassen Sie sich die Verteilung der Daten anzeigen
ggplot(ttest_data, aes(x=schlafdauer, group = gruppe, color = gruppe)) +
  geom_density()

################################################################ #
#######                                              ########### #
#######   t-Tests durchführen                        ########### #
#######                                              ########### #
################################################################ #


### frequentistischer t-Test durchführen ######################### #
ttest_erg_f <- t.test(formula = schlafdauer ~ gruppe, 
                      data = ttest_data,
                      var.equal = TRUE,
                      alternative = "greater"
)

# Ergebnisse ausgeben
ttest_erg_f



### Bayes Faktor t-Test durchführen ############################## #
# EINGABE: Ihre Hypothese(n)
hyp_intervall_l <- 0     # EINGABE: Intervall der Verteilungshyp, untere Grenze
hyp_intervall_u <- Inf   # EINGABE: Intervall der Verteilungshyp, obere Grenze
unsicherheit <- "medium" # EINGABE: Unsicherheit: "medium", "wide", and "ultrawide"

# t-Test mit Bayes Faktor berechnen
ttest_erg_bf <- ttestBF(formula = schlafdauer ~ gruppe, 
                        data = ttest_data,
                        nullInterval = c(hyp_intervall_l, 
                                         hyp_intervall_u), # Intervall der Verteilungshyp
                        rscale  = unsicherheit             # Unsicherheit: 
)

# Ergebnisse ausgeben
ttest_erg_bf
