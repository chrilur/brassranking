# brassranking

En liste over norske brassband, basert på resultater i NM for brassband og Siddis Brass 2013-17.
Kodet i R, publisert med Highcharts.

Vektingen av resultatene er foretatt slik, med fire faktorer:

(konkurranseår^4) / (detteår^4) * (11-(2*divisjon)) * (22 - plassering) * konkurransetype

1. Konkurranseår sørger for at betydningen av et resultat svekkes eksponensielt over tid. 
  Et resultat i år, 2017, vektes (17^4/17^4) = 1.
  Et resultat i 2013, beregnet i 2017, vektes (13^4/17^4) = 0,34.
  
2. Divisjon = 0-5, der 0 er elite, 5 er 5. divisjon.
   Gir en faktor 11-2*0 = 11 for elite, 11-2*1 = 9 for 1. divisjon, osv.
   
3. Førsteplass gir 22-1 = 21, osv.

4. Konkurransetype: NM = 1, Siddis = 0,8.

Hvis du har innvendinger til algoritmen eller forslag til forbedringer, send meg gjerne en mail med begrunnelse til christian.lura@gmail.com.
