Rozważmy aplikację typu REST napisaną za pomocą Flask, który łączy się z bazą danych typu SQL, posiadająca następującą tabelę:



Aplikacja ma posiadać zapytanie typu GET /cars wyświetlające wszystkie auta oraz GET /cars?year wyświetlające samochody z danego rocznika.

Następnie oddzielnie napisz mikroserwis, korzystając z express.js, który również będzie posiadał zapytanie typu GET /cars, ale dodatkowo będzie posiadał zapytanie typu POST /addCar, w którym zostanie dodane auto do bazy.

Obydwie aplikacje zbuduj przy pomocy Dockerfile, a następnie korzystając z Traefik  skorzystaj z serwera proxy, który będzie rzutował obydwie aplikacje pod jeden adres.

Rozwiązanie umieść w repozytorium, gdzie w pliku README wyjaśnione będzie jak uruchomić kontenery i jak wywołać zapytania w tym serwisie.

##  Zadanie 3

skrypt do uruchomienia:

start.sh

lecz nie zawsze działa komenda:

docker run -d --name traefik --network proxy -p 80:80 -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock traefik:latest --api.insecure=true --providers.docker

dlategoże w razie problemów należy uruchomić traefik z poziomu konsoli

docker run -d --name traefik --network proxy -p 80:80 -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock traefik:latest --api.insecure=true --providers.docker

przegladarka 

localhost/cars
localhost/cars/2014


postman

post  localhost/addCar