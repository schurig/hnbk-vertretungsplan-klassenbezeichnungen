# HNBK Vertretungsplan-ID - Klassennamen Zuordnung

Dieses Script generiert eine `.JSON Datei`, die alle Klassennamen und deren zugeordnete Vertretungsplan-ID enthält.

## Vorbereitung

Es wird ruby benötigt.

`gem install nokogiri`

*oder* einfach

`$ bundle install`

ausführen.

# Ausführen des Scripts

`ruby run.rb`

_**--> in `dist/classes.json` landet das Ergebnis.**_


## Beispiel

```
[
  {
    "name": "FA-14A",
    "uid": "c00082"
  },
  {
    "name": "EE-14A",
    "uid": "c00032"
  },
  ...
]
```
