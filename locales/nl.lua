Locales['nl'] = {
    ['document_deleted'] = "Document is ~g~verwijderd~w~.",
    ['document_delete_failed'] = "Document verwijdering ~r~mislukt~w~.",
    ['copy_from_player'] = "Je ~g~ontvangt~w~ een formulier kopie van een speler.",
    ['from_copied_player'] = "Formulier ~g~gekopierd~w~ naar speler",
    ['could_not_copy_form_player'] = "Kan het formulier ~r~niet~w~ kopieren naar speler.",
    ['document_options'] = "Document Opties",
    ['public_documents'] = "Openbare Documenten",
    ['job_documents'] = "Werk Documenten",
    ['saved_documents'] = "Bewaarde Documenten",
    ['close_bt'] = "Sluit",
    ['no_player_found'] = "Geen spelers gevonden",
    ['go_back'] = "Ga terug",
    ['view_bt'] = "Bekijk",
    ['show_bt'] = "Laat zien",
    ['give_copy'] = "Geef kopie",
    ['delete_bt'] = "Verwijder",
    ['yes_delete'] = "Ja, verwijder",
    ['documents'] = "Documenten",
    ['nearest_players'] = "Dichtbijzijnde spelers",
}

Config.Documents['nl'] = {
      ["public"] = {
        {
          headerTitle = "BEVESTIGINGSFORMULIER",
          headerSubtitle = "Burgers bevestigingsformulier.",
          elements = {
            { label = "BEVESTIGING INHOUD", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "GETUIGE VERKLARING",
          headerSubtitle = "Officiele getuige verklaring.",
          elements = {
            { label = "DATUM VAN GEBEURTENIS", type = "input", value = "", can_be_emtpy = false },
            { label = "VERKLARING INHOUD", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "VOERTUIG OVERDRACHT FORMULIER",
          headerSubtitle = "Voertuig overdraag verklaring naar een andere burger.",
          elements = {
            { label = "KENTEKEN", type = "input", value = "", can_be_emtpy = false },
            { label = "NAAM NIEUWE EIGENAAR", type = "input", value = "", can_be_emtpy = false },
            { label = "AFGESPROKEN PRIJS", type = "input", value = "", can_be_empty = false },
            { label = "OVERIGE INFORMATIE", type = "textarea", value = "", can_be_emtpy = true },
          }
        },
        {
          headerTitle = "SCHULDVERKLARING NAAR DE BURGER",
          headerSubtitle = "Officiele schuldverklaring aan een andere burger.",
          elements = {
            { label = "SCHULDEISER VOORNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "SCHULDEISER ACHTERNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "OPENSTAAND BEDRAG", type = "input", value = "", can_be_empty = false },
            { label = "DATUM BETAALD", type = "input", value = "", can_be_empty = false },
            { label = "OVERIGE INFORMATIE", type = "textarea", value = "", can_be_emtpy = true },
          }
        },
        {
          headerTitle = "SCHULD AFBETAALD VERKLARING",
          headerSubtitle = "Verklaring van schuld afbetaald van een andere burger.",
          elements = {
            { label = "SCHULDENAAR VOORNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "SCHULDENAAR ACHTERNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "BEDRAG SCHULD", type = "input", value = "", can_be_empty = false },
            { label = "OVERIGE INFORMATIE", type = "textarea", value = "HIERBIJ VERKLAART IK DAT GENOEMDE BURGER EEN BETALING HEEFT VOLTOOID MET HET GENOEMDE SCHULDBEDRAG", can_be_emtpy = false, can_be_edited = false },
          }
        }
      },
      ["police"] = {
        {
          headerTitle = "SPECIALE PARKEERVERGUNNING",
          headerSubtitle = "Speciale parkeervergunning, je mag overal parkeren.",
          elements = {
            { label = "HOUDER VOORNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "HOUDER ACHTERNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "GELDIG TOT", type = "input", value = "", can_be_empty = false },
            { label = "INFORMATIE", type = "textarea", value = "BOVENSTAANDE BURGER IS IN ELKE STADSZONE ONBEPERKTE PARKEERVERGUNNING TOEGEKEND EN IS GELDIG TOT DE VERMELDE VERVALDATUM.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "WAPENVERGUNNING",
          headerSubtitle = "Wapenvergunning toegekend door de politie.",
          elements = {
            { label = "HOUDER VOORNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "HOUDER ACHTERNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "GELDIG TOT", type = "input", value = "", can_be_empty = false },
            { label = "INFORMATIE", type = "textarea", value = "BOVENSTAANDE BURGER IS TOEGESTAAN EN VERLEENT EEN WAPENVERGUNNING DIE GELDIG ZAL ZIJN TOT DE VERMELDE VERVALDATUM.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "MAAK STRAFBLAD SCHOON",
          headerSubtitle = "Officiele document om je strafblad schoon te maken.",
          elements = {
            { label = "HOUDER VOORNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "HOUDER ACHTERNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "GELDIG TOT", type = "input", value = "", can_be_empty = false },
            { label = "STRAFBLAD", type = "textarea", value = "DE POLITIE VERKLAART HIERBIJ DAT DE GENOEMDE BURGER EEN DUIDELIJK EEN SCHOONMAAK KRIJGT. DIT RESULTAAT WORDT GEGENEREERD UIT GEGEVENS DIE IN HET STRAFRECHTELIJK SYSTEEM INGEVOERD WORDEN DOOR DE ONDERTEKENDATUM VAN HET DOCUMENT.", can_be_emtpy = false, can_be_edited = false },
          }         }
      },
      ["ambulance"] = {
        {
          headerTitle = "MEDISCH RAPPORT - PATHOLOGIE",
          headerSubtitle = "Officieel medisch rapport verstrekt door een patholoog.",
          elements = {
            { label = "VERZEKERDE VOORNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "VERZEKERDE ACHTERNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "GELDIG TOT", type = "input", value = "", can_be_empty = false },
            { label = "MEDICSCHE NOTITIES", type = "textarea", value = "BOVENGENOEMDE VERZEKERDE BURGER WERD GETEST DOOR EEN AMBTENAAR IN DE GEZONDHEIDSZORG EN GEZOND VASTGESTELD ZONDER ONTDEKT LANGDURIGE OMSTANDIGHEDEN. DIT RAPPORT IS GELDIG TOT DE VERMELDE VERVALDATUM.", can_be_emtpy = false },
          }
        },
        {
            headerTitle = "MEDISCH RAPPORT - PSYCHOLOGIE",
            headerSubtitle = "Officieel medisch rapport verstrekt door een psycholoog.",
          elements = {
            { label = "VERZEKERDE VOORNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "VERZEKERDE ACHTERNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "GELDIG TOT", type = "input", value = "", can_be_empty = false },
            { label = "MEDICAL NOTES", type = "textarea", value = "BOVENGENOEMDE VERZEKERDE BURGER WERD GETEST DOOR EEN AMBTENAAR IN DE GEZONDHEIDSZORG EN BEPAALD MENTAAL GEZOND VOLGENS DE LAAGST GOEDGEKEURDE PSYCHOLOGIENORMEN. DIT RAPPORT IS GELDIG TOT DE VERMELDE VERVALDATUM.", can_be_emtpy = false },
          }
        },
        {
            headerTitle = "MEDISCH RAPPORT - OOGSPECIALIST",
            headerSubtitle = "Officieel medisch rapport verstrekt door een oogspecialist.",
          elements = {
            { label = "VERZEKERDE VOORNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "VERZEKERDE ACHTERNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "GELDIG TOT", type = "input", value = "", can_be_empty = false },
            { label = "MEDICAL NOTES", type = "textarea", value = "BOVENGENOEMDE VERZEKERDE BURGER WERD GETEST DOOR EEN AMBTENAAR IN DE GEZONDHEIDSZORG EN BEPAALD MET EEN GEZOND EN NAUWKEURIG ZICHTBAARHEID. DIT RAPPORT IS GELDIG TOT DE VERMELDE VERVALDATUM.", can_be_emtpy = false },
          }
        },
        {
            headerTitle = "MARIJUANA GEBRUIKSVERGUNNING",
            headerSubtitle = "Officiële vergunning voor medisch marihuanagebruik voor burgers.",
          elements = {
            { label = "VERZEKERDE VOORNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "VERZEKERDE ACHTERNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "GELDIG TOT", type = "input", value = "", can_be_empty = false },
            { label = "MEDICAL NOTES", type = "textarea", value = "BOVENGENOEMDE VERZEKERDE BURGER WORDT, NA GRONDIG ONDERZOEK DOOR EEN SPECIALIST IN DE GEZONDHEIDSZORG, EEN VERGUNNING VOOR HET GEBRUIK VAN MARIHUANA WEGENS NIET-BEGREPEN MEDISCHE REDENEN TOEGEKEND. DE WETTELIJKE EN TOEGESTANE HOEVEELHEID DIE EEN BURGER MAG AANHOUDEN, KAN NIET MEER DAN 5 GRAM BEDRAGEN", can_be_emtpy = false, can_be_edited = false },
          }
        },

      ["avocat"] = {
        {
            headerTitle = "CONTRACT VOOR JURIDISCHE DIENSTEN",
            headerSubtitle = "Juridische dienstverlening door een advocaat.",
          elements = {
            { label = "BEWONER VOORNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "BEWONER ACHTERNAAM", type = "input", value = "", can_be_emtpy = false },
            { label = "GELDIG TOT", type = "input", value = "", can_be_empty = false },
            { label = "INFORMATIE", type = "textarea", value = "DIT DOCUMENT IS HET BEWIJS VAN WETTELIJKE VERTEGENWOORDIGING EN DEKKING VAN DE VOORNOEMDE BURGER. JURIDISCHE DIENSTEN ZIJN GELDIG TOT DE VERMELDE VERVALDATUM.", can_be_emtpy = false },
          }
        }
      }
    }
  }
