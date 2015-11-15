# HNBK Vertretungsplan-ID - Klassennamen Zuordnung

Dieses Script generiert eine `.JSON Datei`, die alle Klassennamen und deren zugeordnete Vertretungsplan-ID enthält. Diese Datei ist nach Klassennamen sortiert.

## Vorbereitung

Es wird ruby benötigt.

`gem install nokogiri`

*oder* einfach

`$ bundle install`

ausführen.

# Ausführen des Scripts

`ruby run.rb`

_** das Ergebnis landet in --> in `dist/classes.json`.**_


## Aufbau der JSON-Datei

```
[
  {
    "name": "EE-14A",
    "uid": "c00032"
  },
  {
    "name": "FA-14A",
    "uid": "c00082"
  },
  ...
]
```
