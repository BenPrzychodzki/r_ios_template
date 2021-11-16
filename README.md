# SquidGame list
Application written as a recruitment task for Bitcomp Polska.

## Description (in polish)
Twoim zadaniem będzie napisanie aplikacji, która wczyta listę graczy w SquidGame i pozwoli oznaczać wyeliminowanych graczy. Nie wszyscy gracze posiadają zdjęcia, w przypadku gracza bez zdjęcia należy wyświetlić placeholder (szary kwadrat). Przed rozpoczęciem zadań utwórz forka a rozwiązanie zadań proszę zamieść w swoim repozytorium (pamiętaj, żeby było prywatne) i prześlij linka. Oceniane będą zarówno zadania jak i sposób ich realizacji.  

## Tasks (in polish)
 1. Zaimportuj dane z pliku assets/players.json do pamięci (pamiętaj o użyciu odpowiedniego typu kolekcji danych). Zaimportowane dane wyświetl w MainView w formie listy     Wiersz powinien zawierać: Zdjęcie rozmaiar 50X50 obok nazwa gracza.
 2. Dodaj widok danych szczegółowych gdzie wyświetlisz zdjęcie nazwę oraz opis gracza. Widok powinien być otwierany po kliknięciu na wybraną pozycję na liście.
 3. Widok szczegółowy powinien wyświetlać dane z nagłówakmi: Imię i Nazwisko (ang. Name), Opis (ang. Description). Jeśli telefon ma ustawiony język polski powinniśmy widzieć nagłówki po polsku w innym przypadku używamy nazw anglieskich.
 4. W trakcie rozgrywki gracze są eliminowani. Dodaj funkcjonalność, która na widokusz czegółowym pozwoli oznaczyć gracza jako wyeliminowanego. Gracz wyeliminowany powieinen być wyszarzony na liście graczy. TIP: Status nie musi być utrwalany - po zamknięciu aplikacji i ponownym załadowaniu danych gracze powinni być aktywni
 5. *Użyj CoreData do utrwalenia statusów graczy. Statusy powinny być odtworzone po ponownym otwarciu aplikacji

