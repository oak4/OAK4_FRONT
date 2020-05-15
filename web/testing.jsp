<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="org.json.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
</head>

<body>
    <nav id="navbar">
    </nav>
    <main id="articles-container">
    </main>
    <script>
        window.onload = () => {
            const articles = [
                {
                    "source": {
                        "id": null,
                        "name": "Wasd.ro"
                    },
                    "author": "Ghibirdic Ciprian",
                    "title": "Tot ce sa prezentat la Inside Xbox - WASD.ro",
                    "description": "La Inside Xbox au fost prezentate 13 titluri care vor ajunge pe Xbox Series X. Daca le cumparati pe Xbox One, veti primi upgrade gratuit pe Xbox Series X.",
                    "url": "https://wasd.ro/news/tot-ce-s-a-prezentat-la-inside-xbox/",
                    "urlToImage": "https://static.wasd.ro/wp-content/uploads/2020/05/Inside-Xbox.jpg",
                    "publishedAt": "2020-05-07T21:59:00Z",
                    "content": "Skip to content\r\nLa stream-ul de azi Inside Xbox au fost prezentate 13 titluri care vor ajunge pe Xbox Series X, printre care Assassin's Creed Valhalla. Toate acestea au fost optimizate special pentru noua consola. 10 din 13 titluri vor beneficia de Smart Del… [+3968 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Sport.ro"
                    },
                    "author": "Sport.ro",
                    "title": "Gigi Becali si-a bagat \"perlele\" la REDUCERE! Patronul FCSB ia scazut pretul lui Coman si asteapta ploaia de OFERTE - Sport.ro",
                    "description": "Florinel Coman poate reprezenta principala sursa de venit a FCSB in urmatoarea perioada.",
                    "url": "https://www.sport.ro/liga-1/gigi-becali-si-a-bagat-perlele-la-reducere-patronul-fcsb-i-a-scazut-pretul-lui-coman-si-asteapta-ploaia.html",
                    "urlToImage": "https://assets.sport.ro/assets/sport/2020/05/07/image_galleries/700157/gigi-becali-si-a-bagat-perlele-la-reducere-patronul-fcsb-i-a-scazut-pretul-lui-coman-si-asteapta-ploaia_size6.jpg",
                    "publishedAt": "2020-05-07T20:29:17Z",
                    "content": "Florinel Coman poate reprezenta principala sursa de venit a FCSB in urmatoarea perioada.\r\nGigi Becali a scazut pretul lui Florinel Coman pe aceasta vreme de criza si cere 10 milioane de euro plus 20% dintr-un viitor transfer. Dupa reducerea salariilor si dupa… [+1093 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Stiripesurse.ro"
                    },
                    "author": "Cristi Șelaru, Redactor",
                    "title": "Dezvăluirea care dă totul peste cap! Nelu Tătaru a spus PROCENTUL REAL al persoanelor care au murit DOAR de... - stiripesurse.ro",
                    "description": "Ministrul Sănătății,  Nelu Tătaru , a făcut o dezvăluire-bombă, în direct, joi seara! Șeful...",
                    "url": "https://www.stiripesurse.ro/dezvaluirea-care-da-totul-peste-cap-nelu-tataru-a-spus-procentul-real-al-persoanelor-care-au-murit-doar-de-coronavirus_1462233.html",
                    "urlToImage": "https://mediastiriv1.freenode.ro/image/202003/w800/media-158522495123871500.jpg",
                    "publishedAt": "2020-05-07T20:29:00Z",
                    "content": "Ministrul Sntii, Nelu Ttaru, a fcut o dezvluire-bomb, în direct, joi seara! eful Sntii a dezvluit procentul real al persoanelor care au murit doar de coronavirus în ultima sptmân.\r\nInvitat la o emisiune televizat i întrebat câte persoane au decedat doar de co… [+232 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Mediafax.ro"
                    },
                    "author": "Adina Petcu",
                    "title": "Coronavirus în România LIVE UPDATE 7 mai. 24 decese confirmate joi în ţară. Numărul morţilor ajunge la - Mediafax",
                    "description": "Coronavirus în România LIVE UPDATE 7 mai. 24 decese confirmate joi în ţară. Numărul morţilor ajunge la 888. Peste 6.000 de persoane s-au vindecat",
                    "url": "https://www.mediafax.ro/coronavirus/coronavirus-in-romania-live-update-7-mai-24-decese-confirmate-joi-in-tara-numarul-mortilor-ajunge-la-888-peste-6-000-de-persoane-s-au-vindecat-19117981",
                    "urlToImage": "https://storage0.dms.mpinteractiv.ro/media/1/1/38326/19117981/14/a096b691-dcd3-4ec9-91ae-920a9f5d7182-2.jpg?width=640",
                    "publishedAt": "2020-05-07T19:53:49Z",
                    "content": "UPDATE Ora 22 Alte 2 decese confirmate. Bilanul ajunge la 888\r\n Alte dou decese înregistrate în rândul pacienilor Covid-19 - Bilanul morilor a ajuns la 888 \r\n- Ultimele 2 victime, din Bucureti i Sibiu, aveau 44, respectiv 57 de ani-Ambii pacieni aveau i alte … [+6281 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Gadget.ro"
                    },
                    "author": null,
                    "title": "MediaTek Dimensity 1000+ este cel mai puternic procesor al producătorului taiwanez - Gadget.ro",
                    "description": "MediaTek a anunţat o versiune uşor upgradată a procesorului MediaTek Dimensity 1000. Cum diferenţele dintre cele două procesoare nu sunt majore, producătorul taiwanez a ales un nume simplu pentru n…",
                    "url": "https://gadget.ro/mediatek-dimensity-1000-este-cel-mai-puternic-procesor-al-producatorului-taiwanez/",
                    "urlToImage": "https://gadget.ro/wp-content/uploads/2020/05/MediaTek-Dimensity-10002.jpg",
                    "publishedAt": "2020-05-07T19:30:18Z",
                    "content": "Hardware\r\nMediaTek a anunat o versiune uor upgradat a procesorului MediaTek Dimensity 1000. Cum diferenele dintre cele dou procesoare nu sunt majore, productorul taiwanez a ales un nume simplu pentru noul procesor: MediaTek Dimensity 1000+ .\r\nCare sunt cele m… [+2125 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Stirileprotv.ro"
                    },
                    "author": null,
                    "title": "Comisarul european pentru afaceri interne cere să intrăm în Schengen după pandemie - stirileprotv.ro",
                    "description": "Comisarul european pentru afaceri interne cere să intrăm în Schengen după pandemie",
                    "url": "https://stirileprotv.ro/stiri/actualitate/comisarul-european-pentru-afaceri-interne-cere-sa-intram-in-schengen-dupa-pandemie.html",
                    "urlToImage": "https://image.stirileprotv.ro/media/images/1408x882/Apr2016/61798868.jpg",
                    "publishedAt": "2020-05-07T19:22:00Z",
                    "content": "Comisarul european pentru afaceri interne Ylva Johansson vrea ca România, Bulgaria i Croaia s adere la spaiul Schengen dup pandemia COVID-19.\r\nUniunea Europeană trebuie să meargă ''înapoi în viitorul'' frontierelor deschise de îndată ce pandemia de COVID-19 e… [+2522 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Digi24.ro"
                    },
                    "author": "Digi24",
                    "title": "Cum va fi încheiată situația școlară a elevilor care nu pot face lecții online. Anunțul ministrului Anisie - Digi24",
                    "description": "Ministrul Educației, Monica Anisie, vine cu preczări în legătură cu modul în care vor fi notați elevii din România, care încheie anul școlar online.",
                    "url": "https://www.digi24.ro/stiri/actualitate/educatie/cum-va-fi-incheiata-situatia-scolara-a-elevilor-care-nu-pot-face-lectii-online-anuntul-ministrului-anisie-1303664",
                    "urlToImage": "https://s.iw.ro/gateway/g/ZmlsZVNvdXJjZT1odHRwJTNBJTJGJTJG/c3RvcmFnZTA2dHJhbnNjb2Rlci5yY3Mt/cmRzLnJvJTJGc3RvcmFnZSUyRjIwMjAl/MkYwNCUyRjI3JTJGMTE4MDY3MF8xMTgw/NjcwX21vbmljYS1hbmlzaWUtaW5xdWFt/LWdhbmVhLTkuanBnJnc9NjQwJmg9NDgw/JnpjPTEmaGFzaD1hNzk0MGI4ZWY4NTM2MmU1MDc3Y2I4YTQ0MjUyMTdhYg==.thumb.jpg",
                    "publishedAt": "2020-05-07T19:14:00Z",
                    "content": "Ministrul Educaiei, Monica Anisie, vine cu preczri în legtur cu modul în care vor fi notai elevii din România, care încheie anul colar online.\r\nDac elevul nu a avut nicio not i nu a participat la leciile online, media de pe primul semestru devine medie anual.… [+2839 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Stirileprotv.ro"
                    },
                    "author": null,
                    "title": "CTP, despre mesajul transmis românilor de CCR privind amenzile: \"Trebuia să fiți șmecheri\" - stirileprotv.ro",
                    "description": "CTP, despre mesajul transmis românilor de CCR privind amenzile: \"Trebuia să fiți șmecheri\"",
                    "url": "https://stirileprotv.ro/stiri/actualitate/ctp-despre-mesajul-transmis-romanilor-de-ccr-privind-amenzile-trebuia-sa-fiti-smecheri.html",
                    "urlToImage": "https://image.stirileprotv.ro/media/images/1408x882/May2020/62124047.jpg",
                    "publishedAt": "2020-05-07T18:30:49Z",
                    "content": "Gazetarul Cristian Tudor Popescu a declarat, într-un interviu acordat tirilor Pro TV, c mesajul pe care CCR l-a transmis românilor prin decizia privind amenzile este c \"suntei proti c ai respectat legea, trebuia s fii mecheri\".\r\nÎntrebat ce ar trebui să înțel… [+2030 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Digi24.ro"
                    },
                    "author": "Digi24",
                    "title": "Restaurant deschis în centrul Clujului. Angajații, prinși de polițiști care s-au dat drept clienți - Digi24",
                    "description": "",
                    "url": "https://www.digi24.ro/stiri/actualitate/restaurant-deschis-in-centrul-clujului-angajatii-prinsi-de-politisti-care-s-au-dat-drept-clienti-1303638",
                    "urlToImage": "https://s.iw.ro/gateway/g/ZmlsZVNvdXJjZT1odHRwJTNBJTJGJTJG/c3RvcmFnZTA2dHJhbnNjb2Rlci5yY3Mt/cmRzLnJvJTJGc3RvcmFnZSUyRjIwMjAl/MkYwMyUyRjE2JTJGMTE3MDM4OV8xMTcw/Mzg5X3Jlc3RhdXJhbnQtbmV3LXlvcmst/cHJvZmltZWRpYS0wMzY4NDgxMDY5Lmpw/ZyZ3PTY0MCZoPTQ4MCZ6Yz0xJmhhc2g9/ODU4Mjk4ZDU0YWIyODFjZDAxMWJlMTI3YzBhOTM2NGM=.thumb.jpg",
                    "publishedAt": "2020-05-07T18:16:00Z",
                    "content": "Un restaurant cu specific italian era deschis, joi, în centrul oraului Cluj-Napoca, iar angajaii au servit poliiti sub acoperire care s-au dat drept clieni. În acest caz a fost întocmit un dosar penal pentru zdrnicirea combaterii bolilor.\r\nReprezentanii Polii… [+984 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Www.gsp.ro"
                    },
                    "author": "Gazeta Sporturilor",
                    "title": "Se „rupe” CFR Cluj, după monopolul Dan Petrescu? Ce declara Giedrius Arlauskis: „Fără el, nu mai continui nic - Gazeta Sporturilor",
                    "description": "Expansiunea lui Dan Petrescu în club pare să fie din ce în ce mai deranjantă pentru oamenii din jurul său, care nu acceptă politica impusă de „Bursuc”, aceea ca toate deciziile să fie luate doar de el.",
                    "url": "https://www.gsp.ro/fotbal/liga-1/se-rupe-cfr-cluj-giedrius-arlauskis-primul-jucator-care-a-anuntat-ca-pleaca-in-actualele-conditii-598107.html",
                    "urlToImage": "https://cacheimg.gsp.ro/autocrop/smp-images-production/gsp.ro/07052020/1588873004433.jpg?width=600&height=315",
                    "publishedAt": "2020-05-07T17:31:18Z",
                    "content": "Expansiunea lui Dan Petrescu în club pare s fie din ce în ce mai deranjant pentru oamenii din jurul su, care nu accept politica impus de Bursuc, aceea ca toate deciziile s fie luate doar de el. \r\nMarian Copilu, un oficial prezent la mai toate succesele CFR-ul… [+1213 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Digi24.ro"
                    },
                    "author": "Digi24",
                    "title": "Orban: Planul de ridicare a restricţiilor, prezentat până luni şi supus dezbaterii publice. Cetățenii pot face propuneri - Digi24",
                    "description": "Premierul Ludovic Orban a anunțat joi că regulile aferente ridicării fiecărei restricţii vor fi prezentate public până luni și vor fi supuse dezbaterii publice. Instituțiile vizate, dar și cetățenii, vor putea face propuneri.",
                    "url": "https://www.digi24.ro/stiri/actualitate/social/orban-planul-de-ridicare-a-restrictiilor-prezentat-pana-luni-si-supus-dezbaterii-publice-cetatenii-pot-face-propuneri-1303601",
                    "urlToImage": "https://s.iw.ro/gateway/g/ZmlsZVNvdXJjZT1odHRwJTNBJTJGJTJG/c3RvcmFnZTA2dHJhbnNjb2Rlci5yY3Mt/cmRzLnJvJTJGc3RvcmFnZSUyRjIwMjAl/MkYwNSUyRjA1JTJGMTE4MjU0Ml8xMTgy/NTQyX3Byb2ZpbWVkaWEtMDUxNzAzMTA3/Ny5qcGcmdz02NDAmaD00ODAmemM9MSZo/YXNoPWMzODIwYTZmMWE5Y2FiNzUwNDczOTg4ZGZhNzMzZDUw.thumb.jpg",
                    "publishedAt": "2020-05-07T16:36:00Z",
                    "content": "Premierul Ludovic Orban a anunat joi c regulile aferente ridicrii fiecrei restricii vor fi prezentate public pân luni i vor fi supuse dezbaterii publice. Instituiile vizate, dar i cetenii, vor putea face propuneri.\r\n\"Setul de reguli aferente ridicrii fiecrei … [+859 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Stirileprotv.ro"
                    },
                    "author": null,
                    "title": "Zona prin care coronavirusul intră în corp. Ne acoperim degeaba doar gura - stirileprotv.ro",
                    "description": "Zona prin care coronavirusul intră în corp. Ne acoperim degeaba doar gura",
                    "url": "https://stirileprotv.ro/stiri/stiinta/zona-cea-mai-vulnerabila-din-corp-cum-ne-putem-infecta-cel-mai-usor-cu-noul-coronavirus.html",
                    "urlToImage": "https://image.stirileprotv.ro/media/images/1408x882/Apr2020/62121738.jpg",
                    "publishedAt": "2020-05-07T16:25:00Z",
                    "content": "Dou tipuri de celule din cavitatea nazal au fost identificate drept cele mai probabile puncte de intrare a coronavirusului în corpul uman, a concluzionat o echip internaional de cercettori.\r\nOamenii de ştiinţă au descoperit că două tipuri de celule prezentau … [+3103 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Digisport.ro"
                    },
                    "author": "Digi Sport",
                    "title": "Sorin Cârţu a clarificat problema antrenorului Craiovei. Ce spune despre Papură: \"Eu ştiu de ce a plecat\" - DigiSport",
                    "description": "Plecarea lui Cornel Papură de pe banca celor de la Universitatea Craiova a surprins pe toată lumea, iar zvonurile au început să apară pe bandă rulantă.",
                    "url": "https://www.digisport.ro/fotbal/liga-1/sorin-cartu-a-clarificat-problema-antrenorului-craiovei-ce-spune-despre-papura-eu-stiu-de-ce-a-plecat-834368",
                    "urlToImage": "https://s.iw.ro/gateway/g/ZmlsZVNvdXJjZT1odHRwJTNBJTJGJTJG/c3RvcmFnZTAxdHJhbnNjb2Rlci5yY3Mt/cmRzLnJvJTJGc3RvcmFnZSUyRjIwMjAl/MkYwNCUyRjI5JTJGMTE4MTI1NF8xMTgx/MjU0X0JPR18wMTc1X2NvcHkuanBnJnc9/NjQwJmg9NDgwJnpjPTEmaGFzaD02ZjBh/MmUwMzBiOWU5ZGMyNzRjNzEwNTMxOGJiZmYzNg==.thumb.jpg",
                    "publishedAt": "2020-05-07T16:07:00Z",
                    "content": "Preedintele oltenilor, Sorin Câru, a inut s clarifice variantele din ultima vreme, Edi Iordnescu, Cosmin Contra sau Eugen Neagoe.\r\n\"Nu cred c va fi Contra. Eugen Neagoe poate. Mai dureaz dou-trei zile, pân duminic maxim, când se decide. Eu nu mai am vâna care… [+1016 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Idevice.ro"
                    },
                    "author": "Adrian Gabor",
                    "title": "LUNA: Descoperirea ULUITOARE care Schimba TOT ceea ce Stiam - iDevice.ro",
                    "description": "LUNA este in centrul unei descoperiri impresionante facute de catre cercetatori, iar asta ar putea schimba multe din ceea ce stim in momentul de fata in legatura cu satelitul natural al Pamantului. Mai exact, o nava care era in orbita lunii a detectat faptul …",
                    "url": "https://www.idevice.ro/2020/05/07/luna-carbon-416015/",
                    "urlToImage": "https://www.idevice.ro/wp-content/uploads/2020/05/luna-carbon.jpg",
                    "publishedAt": "2020-05-07T15:57:29Z",
                    "content": "LUNA este in centrul unei descoperiri impresionante facute de catre cercetatori, iar asta ar putea schimba multe din ceea ce stim in momentul de fata in legatura cu satelitul natural al Pamantului. Mai exact, o nava care era in orbita lunii a detectat faptul … [+2142 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Mobilissimo.ro"
                    },
                    "author": "https://www.facebook.com/mobilissimo",
                    "title": "LG Velvet a debutat oficial: telefon fashion cu CPU Snapdragon 765G, 5G, preţ de aproape 3.300 lei - Mobilissimo.ro",
                    "description": "După foarte multe teasere şi scăpări, fashion phone-ul celor de la LG este în sfârşit oficial. LG Velvet a fost prezentat astăzi în Coreea de Sud, unde costă 735 de dolari, adică aproximativ 3.300 lei. Începând de pe 8 mai",
                    "url": "https://www.mobilissimo.ro/stiri-telefoane/lg-velvet-a-debutat-oficial",
                    "urlToImage": "https://images2.mobilissimo.ro/Z2k/5eb428b44007e.jpg",
                    "publishedAt": "2020-05-07T15:34:45Z",
                    "content": "Dup foarte multe teasere i scpri, fashion phone-ul celor de la LG este în sfârit oficial. LG Velvet a fost prezentat astzi în Coreea de Sud, unde cost 735 de dolari, adic aproximativ 3.300 lei. Începând de pe 8 mai, adic mâine doritorii din Coreea de Sud vor … [+1542 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Mediafax.ro"
                    },
                    "author": "Mihaela Gidei",
                    "title": "Marcel Vela: ”Mesajul meu a fost trunchiat”. Cine va putea părăsi de fapt localitatea din 15 mai - Mediafax",
                    "description": "Marcel Vela: ”Mesajul meu a fost trunchiat”. Cine va putea părăsi localitatea din 15 mai",
                    "url": "https://www.mediafax.ro/politic/marcel-vela-revine-din-15-mai-vei-putea-parasi-localitatea-doar-daca-stai-in-zone-metropolitane-19119125",
                    "urlToImage": "https://storage0.dms.mpinteractiv.ro/media/1/1/1687/19119125/1/7564581-mediafax-foto-alexandru-dobre.jpg?width=640",
                    "publishedAt": "2020-05-07T15:22:28Z",
                    "content": "Marcel Vela a revenit i spune c, de fapt, mesajul lui de asear a fost trunchiat i rspunsurile au fost scoase din context. Astfel, Vela  spune pe Facebook cum vei prsi localitatea din 15 mai i a transcris întrebrile i rspunsurile. \r\n Întrebare 1: Prin prsirea … [+2430 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Digi24.ro"
                    },
                    "author": "Digi24",
                    "title": "Două țări europene critică postarea lui Viktor Orban cu „Ungaria mare”. Președintele Croației: Acele hărți vor rămâne în dulap - Digi24",
                    "description": "Croația, țară care deține președinția rotativă a Uniunii Europene, și Slovenia au criticat o postare a premierului Ungariei, Viktor Orban, în care era prezentată o hartă a „Ungariei mari”, cu Transilvania, Slovacia și Croația în componența ei.",
                    "url": "https://www.digi24.ro/stiri/externe/ue/doua-tari-europene-critica-postarea-lui-viktor-orban-cu-ungaria-mare-presedintele-croatiei-acele-harti-vor-ramane-in-dulap-1303556",
                    "urlToImage": "https://s.iw.ro/gateway/g/ZmlsZVNvdXJjZT1odHRwJTNBJTJGJTJG/c3RvcmFnZTA3dHJhbnNjb2Rlci5yY3Mt/cmRzLnJvJTJGc3RvcmFnZSUyRjIwMTgl/MkYxMiUyRjE5JTJGMTAyMDI5NV8xMDIw/Mjk1X3Zpa3Rvci1vcmJhbi1HZXR0eUlt/YWdlcy05ODYxNzQ3NTAuanBnJnc9NjQw/Jmg9NDgwJnpjPTEmaGFzaD05NWY0MTY5/MjM3MjJiNWNhODgxNGVhNTJhNWE0ZjcxZg==.thumb.jpg",
                    "publishedAt": "2020-05-07T14:48:00Z",
                    "content": "Croaia, ar care deine preedinia rotativ a Uniunii Europene, i Slovenia au criticat o postare a premierului Ungariei, Viktor Orban, în care era prezentat o hart a Ungariei mari, cu Transilvania, Slovacia i Croaia în componena ei.\r\nSunt provocri ale celor care … [+1527 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Ziarpiatraneamt.ro"
                    },
                    "author": "Ziar Piatra Neamt",
                    "title": "În serile de mai se pot vedea pe cer Mercur și Venus © - Ziar Piatra Neamt",
                    "description": "FOTO: Observatorul Astronomic \"Victor Anestin\" BacauÎn luna mai pe cerul de seară va fi vizibilă planeta Venus sau Luceafărul. Veți putea observa planeta ca un corp celest foarte strălucitor,  spre orizontul vestic şi nord-vestic. „Venus, cea mai str",
                    "url": "https://www.ziarpiatraneamt.ro/in-serile-de-mai-se-pot-vedea-pe-cer-mercur-si-venus",
                    "urlToImage": "https://www.ziarpiatraneamt.ro/wp-content/uploads/2020/05/sky-5114501_1920.jpg",
                    "publishedAt": "2020-05-07T14:24:00Z",
                    "content": "FOTO: Observatorul Astronomic „Victor Anestin” Bacau\r\nÎn luna mai pe cerul de sear va fi vizibil planeta Venus sau Luceafrul. Vei putea observa planeta ca un corp celest foarte strlucitor, spre orizontul vestic i nord-vestic. \r\nVenus, cea mai strlucitoare pla… [+2041 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Click.ro"
                    },
                    "author": null,
                    "title": "FOTO Ce fericiți sunt Laura Andreșan și Grasu XXL de când au devenit părinți! Micuța lor împlinește un an - Click!",
                    "description": "Ce mult s-a schimbat Laura Andreşan! Fosta bombă sexy, care în trecut cataloga bărbaţii după perfomanţele sexuale, s-a retras de câţiva ani din lumea pestriţă a showbiz-ului şi s-a axat pe relaţia pe care o are cu Grasu XXL, rapperul cu care formează un cuplu…",
                    "url": "https://www.click.ro/vedete/romanesti/foto-ce-fericiti-sunt-laura-andresan-si-grasu-xxl-de-cand-au-devenit-parinti-micuta",
                    "urlToImage": "https://www.click.ro/sites/default/files/medias/2020/05/07/laura-andresan-4.jpeg",
                    "publishedAt": "2020-05-07T14:20:00Z",
                    "content": "De la profa de amor, la mama perfect a fost doar un pas pentru Laura Andresan (38 de ani). Dup o relaie de zece ani cu rapperul Drago Nichifor (38 de ani), alias Grasu XXL, atena a devenit mmic anul trecut, în luna iunie. A avut o sarcin extrem de grea, dar a… [+712 chars]"
                },
                {
                    "source": {
                        "id": null,
                        "name": "Digi24.ro"
                    },
                    "author": "Bogdan Pacurar",
                    "title": "Se mai pot aplica amenzi după decizia CCR de ieri? Ce spun specialiștii, în timp ce Guvernul este confuz - Digi24",
                    "description": "Avocata Elenina Nicuț contrazice interpretarea premierului Ludovic Orban, care a declarat joi că după decizia Curții Constituționale amenzile pentru nerespectarea ordonanțelor militare vor reveni la nivelul inițial, înainte de a fi majorate. Avocatul explică …",
                    "url": "https://www.digi24.ro/stiri/actualitate/se-mai-pot-aplica-amenzi-dupa-decizia-ccr-de-ieri-ce-spun-specialistii-in-timp-ce-guvernul-este-confuz-1303481",
                    "urlToImage": "https://s.iw.ro/gateway/g/ZmlsZVNvdXJjZT1odHRwJTNBJTJGJTJG/c3RvcmFnZTA2dHJhbnNjb2Rlci5yY3Mt/cmRzLnJvJTJGc3RvcmFnZSUyRjIwMjAl/MkYwNSUyRjA3JTJGMTE4MzI5MF8xMTgz/MjkwX29yYmFuLmpwZyZ3PTY0MCZoPTQ4/MCZ6Yz0xJmhhc2g9NjhkZTYwZDEyOTlkYjc2ZGNmNzMxODljNzEwY2NjZGE=.thumb.jpg",
                    "publishedAt": "2020-05-07T14:14:00Z",
                    "content": "Avocata Elenina Nicu contrazice interpretarea premierului Ludovic Orban, care a declarat joi c dup decizia Curii Constituionale amenzile pentru nerespectarea ordonanelor militare vor reveni la nivelul iniial, înainte de a fi majorate. Avocatul explic faptul c… [+3759 chars]"
                }
            ];
            <% 
                URL obj = new URL("http://localhost:7001/OAK4_MID/webresources/entities.categorii");
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		if (responseCode == HttpURLConnection.HTTP_OK) { // success
			BufferedReader in = new BufferedReader(new InputStreamReader(
					con.getInputStream()));
			String inputLine;
			StringBuffer res = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				res.append(inputLine);
			}
			in.close();
                        JSONObject json = XML.toJSONObject(res.toString());
                        String jsonPrettyPrintString = json.toString(4);
                        out.println("const catReq = ");
                        out.println(jsonPrettyPrintString);
                        out.println(";const categories =[{ 'nume': 'Home', 'categorieId': '', 'status': {} }].concat( catReq['categoriis']['categorii']);");
		}
        %>
//            const categories = [
//                { 'name': 'Home', 'link': 'index.html', 'current_link': true },
//                { 'name': 'Business', 'link': 'business.html', 'current_link': false },
//                { 'name': 'Entertainment', 'link': 'entertainment.html', 'current_link': false },
//                { 'name': 'Health', 'link': 'health.html', 'current_link': false },
//                { 'name': 'Science', 'link': 'science.html', 'current_link': false },
//                { 'name': 'Sports', 'link': 'sports.html', 'current_link': false },
//                { 'name': 'Technology', 'link': 'technology.html', 'current_link': false },
//            ];
            populateCategories(categories);
            populateArticles(articles);
        }
    </script>
</body>

</html>