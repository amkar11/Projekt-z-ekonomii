#Rossmann
library(readxl)
library(dplyr)
rossmann <- read_xlsx("C:\\Users\\2016s\\OneDrive\\Zadania w R\\rossmann.xlsx")
otwarte_sklepy <- rossmann %>%
  filter(czy_otwarty == "Tak" & data == "2014-02-25" & sklep_asort == "Rozszerzony")
otwarte_sklepy_ilosc <- nrow(otwarte_sklepy)
print(otwarte_sklepy)
print(otwarte_sklepy_ilosc)
liczba_klientaw <- rossmann %>%
  filter(sklep_id == 101) %>%
  group_by(dzien_tyg) %>%
  summarise(największa_ilość_ludzi_w_tygodniu = max(mean(liczba_klientow)))
print(liczba_klientaw)
typ_sklepu <- rossmann %>%
  select(sprzedaz, sklep_typ) %>%
  group_by(sklep_typ) %>%
  summarise(największa_mediana = max(median(sprzedaz)))
print(typ_sklepu)
sprzedaz_zlotowki <- rossmann %>%
  sprzedaz <- sprzedaz * 2.8505
print(sprzedaz_zlotowki)