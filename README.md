# LT_Template_Gear

Gear-mod van **Lowlands Tactical**. Geeft spelers en voertuigen automatisch een loadout op basis van hun rol, het gekozen tijdperk van de missie en de parameters die bij de missie zijn ingesteld.

Werkt samen met **[LT_Template_Base](https://github.com/Lowlands-Tactical/LT_Template_Base)**, die hiervoor verplicht is.

- PBO-prefix: `lt_template_gear`

## Tijdperken

Het tijdperk kies je in Eden onder *Scenario > Tijdperk settings* (`LT_Loadout_ID`). Elk tijdperk heeft een eigen map.

| Map | Tijdperk | Extra mods |
| --- | --- | --- |
| `Loadout_BASE` | Huidig | geen |
| `Loadout_GM` | Koude Oorlog | Global Mobilization |
| `Loadout_VN` | Vietnam | S.O.G. Prairie Fire |
| `Loadout_40K` | Warhammer 40K | mods met `TIOW_` en `IC_CAD_` classnames |

Alleen de gear van het gekozen tijdperk wordt gebruikt. De mods van de andere tijdperken hoeven dus niet geladen te zijn.

## Hoe het werkt

1. De missie bepaalt via `LT_Loadout_ID` het tijdperk en via de parameters per kant (BLUFOR, OPFOR, GUER) welke camouflage en welke wapens gelden.
2. `XEH_postInit.sqf` laadt de bijbehorende `SwitchGear*.sqf` en `SwitchWeapon*.sqf` en bouwt daarmee de sets (`westGear`, `eastGear`, `guerGear`, en de wapens).
3. Voor elke speler met een rol (`LT_unit_role`, ingesteld in Eden) past `LT_fnc_initPostUnit` de loadout toe via `LT_fnc_unitLoadout`.
4. Voertuigen en kisten met een `LT_veh_role` krijgen hun lading via `LT_fnc_initPostVeh` en `LT_fnc_vehicleLoadout`.

Eenheden met rol `custom` en civilians krijgen geen loadout.

### Rollen

`com`, `sql`, `jtac`, `ftl`, `gren`, `comms`, `rifl`, `riflat`, `riflaa`, `dmr`, `ar`, `aar`, `medic`, `eng`, `mmg`, `mat`, `vhco`, `vhgu`, `vhdr`, `pilot`, `crew`, `jet`, `lvdw`.

## Missieparameters

De parameters staan in `params*.hpp` per tijdperk en worden in de `description.ext` van de missie opgenomen. De standaardwaarden zijn te overschrijven met een `#define` voor de include.

| Parameter | Betekenis | Define (standaard) |
| --- | --- | --- |
| `lt_gear_camo_blue/red/green` | Camouflage per kant | `BLUE_GEAR`, `RED_GEAR`, `GREEN_GEAR` |
| `lt_gear_weapon_blue/red/green` | Wapenset per kant | `BLUE_WEAPON`, `RED_WEAPON`, `GREEN_WEAPON` |
| `lt_gear_SR` | Korte-afstandsradio: niemand of iedereen | `SHORT_RADIO` |
| `lt_gear_radiopack` | Lange-afstandsradio: niemand of rolspecifiek of iedereen | `LONG_RADIO` |
| `lt_gear_nvg` | Nachtkijkers | `GEAR_NVG` |
| `lt_gear_weapon_att` | Combinatie van wapenattachments | `WEAPON_ATT` |
| `lt_gear_weapon_scope` | Richtkijker op wapens | `WEAPON_SCOPE` |

## Eigen gear voor één missie

Kies bij de camouflage of wapens de optie *Use customGear* of *Use customWeapon* (waarde 0). De mod zoekt dan in de missie naar:

- `Scripts\customGear.sqf`
- `Scripts\customWeapon.sqf`

Als het bestand ontbreekt, valt de mod terug op `Reference/LT_camo_CUSTOM.sqf` en `Reference/LT_wpn_CUSTOM.sqf`. Die geven een foutmelding in het RPT en de chat. Gebruik `Reference/LT_camo_.sqf` en `Reference/LT_wpn_.sqf` als leeg sjabloon.

## Prioriteit en terugval

De missieparameters hebben altijd voorrang. `XEH_postInit.sqf` werkt per kant in deze volgorde:

1. Alle variabelen (`_unif`, `_rifle` enzovoort) worden op een lege waarde gezet.
2. `SwitchGear*.sqf` en `SwitchWeapon*.sqf` vullen ze, ook `customGear.sqf` en `customWeapon.sqf`. Elke include draait in `isNil { }`, zodat een fout in een bestand de rest niet stopt.
3. Daarna wordt elke klasse gecontroleerd: hij moet bestaan, bruikbaar zijn (`scope >= 1`) en in het juiste slot passen (primair wapen, handwapen, launcher, uniform, vest, helm, nachtkijker; bij een rugzak moet het een rugzak zijn). Ongeldige klassen worden verwijderd.
4. Alleen als een slot leeg of helemaal ongeldig blijft, krijgt het een vaste standaard (bijvoorbeeld MX, P07, NLAW of de mcam-uniform). Een tracer-magazijn valt terug op het gewone magazijn, een ongeldig magazijn op het eerste passende.

Elke verwijdering of terugval staat als `WARNING:` met `XEH_Gear` in het RPT en in de chat. Staat er na een missiestart zo'n regel, dan klopt er iets niet in de gear van de missie.

Een nieuwe variabele die een `Camo/*.sqf` of `Weapon/*.sqf` zet, moet ook bovenaan de lus in `XEH_postInit.sqf` met een lege waarde worden aangemaakt. Anders is de waarde buiten de `case` weg en krijg je altijd de standaard.

## Een nieuwe camouflage of wapenset toevoegen

1. Kopieer het sjabloon `Reference/LT_camo_.sqf` (of `LT_wpn_.sqf`) naar de map van het tijdperk, in `Camo/` of `Weapon/`, en geef het een naam als `LT_camo_Naam.sqf`.
2. Vul de classnames in.
3. Voeg in `SwitchGear<Tijdperk>.sqf` (of `SwitchWeapon<Tijdperk>.sqf`) een nieuwe `case` toe met een `#include` naar het nieuwe bestand.
4. Voeg de waarde en de naam toe aan `LT_GEAR_V` en `LT_GEAR_T` (of `LT_WEAPON_V` en `LT_WEAPON_T`) in het `params*.hpp` bestand. De volgorde en het aantal moeten overeenkomen met de `case`-nummers.

## Mapstructuur

| Map / bestand | Inhoud |
| --- | --- |
| `config.cpp` | CfgPatches, CfgFunctions, CfgRemoteExec en Extended Event Handlers |
| `XEH_preInit.sqf` | Itemlijsten, rolgroepen (`RoleSettings`) en wapens per rol |
| `XEH_postInit.sqf` | Bouwt de sets voor het gekozen tijdperk |
| `functions/` | `unitLoadout`, `vehicleLoadout`, `initPostUnit`, `initPostVeh`, `resetMaxLoad` |
| `Loadout_*/` | Per tijdperk: `Camo/`, `Weapon/`, `params*.hpp` en de `Switch*.sqf` bestanden |
| `Reference/` | Sjablonen en fallback voor eigen gear |

## Vereisten

CBA_A3, ACE3 en ACRE2 (via LT_Template_Base), plus de mods van het gekozen tijdperk.

## Credits

Lowlands Tactical, met name Brainless_Ben.
