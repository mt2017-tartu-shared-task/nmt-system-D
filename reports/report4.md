# Translation quality report. Lab 4. First round of improvements.

### BLEU
BLEU was computed with de-preprocessed files
accurate dev-set (total 1000): **22.54 (22.61 before)**



### Report template

1. ID
2. source
3. target
4. translation
5. errors

4.1. new translation

5.1. new errors


## Changes

1. There were cases when there were two sentences in the same line. The system saw the EOS and did not translate the second part at all. 
[We used](https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/preprocess-estnltk/split_sentences.py "sentence split script") a more sofisticated regular expression to split those lines. This change did not affect the learning, so we decided that it was not necessary to retrain NMT system.

2. Parts of compound words sometimes were not translated. [We used **estnltk**](https://github.com/mt2017-tartu-shared-task/nmt-system-D/blob/master/preprocess-estnltk/split_compounds.py "compounds split script") to split compound words longer than 9 letters by adding spaces between their parts.
In many cases which we reviewed it had a positive effect. This change can possibly affect vocabulary and BPE setup (?).


## Sentence splitting (30 in the set, only positive changes)

### 6

1. ID 53
2. 4) Süsteemi käitajatel ei ole õigust avaldada äriteavet, mis on neile saanud teatavaks nende kohustuste täitmisel. Energiavarustusega kauplejad määratlevad äri- ja konfidentsiaalse teabe sisu, koordineerides seda reguleerijaga.
3. ( 4 ) System operators are not entitled to disclose commercial information , which has become known to them in fulfilling their duties . Energy supply merchants shall determine the contents of commercial and confidential information by co-ordination thereof with the regulator .
4. ( 4 ) System operators do not have the right to disclose commercial information which has received their obligations in the performance of their duties .
5. Source sentence is two sentences in fact: splitting is bad. Second sentence is missing.
"kohustuste" is translated twice as "obligations" and "duties". Second part of translation makes little sense. There are mistakes in word choice and forms.

4.1. 
ID 56: ( 4 ) System operators do not have the right to disclose commercial information which has been notified to them in the performance of their duties .
ID 57: Traders in energy supply define the content of business and confidential information by coordinating the regulator .
5.1. Sentence was split. Now it is translated fully. No improvement on the first part, second was translated almost correctly.

Positive effect of our changes. No new mistakes. BLEU increased.


### 14

1. ID 124
2. Meie veebisaidi sellest osast leiate teavet, kuidas korraldab parlament erinevate komisjonide süsteemi abil oma tööd. Euroopa Parlamendi töö on oluline seepärast, et otsuseid uute Euroopa seaduste kohta teevad paljudes poliitikavaldkondades ühiselt parlament ja ministrite nõukogu, mis esindab liikmesriike.
3. In this part of our website , you can find information on how the Parliament organises its work , through a system of specialised committees . The work of the European Parliament is important because in many policy areas , decisions on new European laws are made jointly by Parliament and the Council of Ministers , which represents Member States .
4. This part of our website will find information on how Parliament will organise its work through a system of different committees .
5. Word dependency is wrong. Second sentence is missing. Article is missing. Wrong tense "will organise". "Different" instead of "specialized"

4.1.
ID 132: This part of our website will find information on how Parliament will organise its work through different committees .
ID 133: The work of the European Parliament is therefore important because decisions on new European laws do jointly with Parliament and the Council of Ministers , which represents the Member States .
5.1. Sentence was split. "System" is missing. Second part translated almost perfectly (BLEU 54)

Successful split. Otherwise everything is fine. BLEU increased.


## Root-splitting for compound words

## Positive

### 2

1. ID 7
2. Surve käsitleda tõhusalt ja korrektselt nii tööprotsesse kui personaliküsimusi on tungiv.
3. The pressure to handle the working processes as well as staff questions in an effective and correct way is urgent .
4. Pressure to address effectively and correctly both processes and personnel issues is pressing .
5. Word "working" is missing because first part of compound word "tööprotsesse" is missing.
Article "the" before "pressure" is missing. Word order is strange, but not completely wrong.

4.1 Pressure to deal effectively and correctly with both work processes and personnel issues .
5.1 "deal" is better than "address". Predicate went missing, "processes" became "work processes", which is better.

Positive influence by our changes. Some improvement. Some new mistakes. BLEU decreased.


### 21 [!]

1. ID 172
2. Euroopa Parlamendi mõju EL asjaajamises suureneb ning 1979. aastal saavad kodanikud esmakordselt parlamendi liikmeid otse valida.
3. The European Parliament increases its influence in EU affairs and in 1979 all citizens can , for the first time , elect their members directly .
4. The European Parliament's influence in the EU's business is increasing , and citizens will be able to choose directly from Parliament in 1979 .
5. "Is increasing" and "will be" wrong tense. "For the first time" ("esmakordselt") is missing.

4.1. ID 184: The European Parliament's impact on EU affairs will increase and citizens will be able to choose directly from Parliament for the first time in 1979 .
5.1. "For the first time" emerged (because of root-splitting "esmakordselt" "kordselt" part received more attention)

Improvements related to our changes. No new mistakes. BLEU increased.

![](https://raw.githubusercontent.com/mt2017-tartu-shared-task/nmt-system-D/master/reports/report4/forthefirsttime.png)


### 24 [!]

1. ID 190
2. Riikidevaheline reisimine on lihtsam, kuna enam pole rahavahetuse kulu ja vaeva.
3. Travel between euro countries is easier because the costs and inconvenience of changing money have disappeared .
4. Transnational travel is easier , since the cost of money is no longer the cost and the effort .
5. Idea of european countries is missing. Second part is wrong because of compound word "rahavahetuse" ("changing money").

4.1. ID 202: Transnational travel is easier because there is no money for money exchange and trouble .
5.1. "Exchange" emerged (because of splitting "raha_vahetuse")

Improvements related to our changes. No new mistakes. BLEU increased.

![](https://raw.githubusercontent.com/mt2017-tartu-shared-task/nmt-system-D/master/reports/report4/rahavahetuse.png)


### 26 [!]

1. ID 711
2. Tekivad ka kaks põhituumakiirt, mille energia küündib 1 150 TeV-ni, kuid vähemate kokkupõrgete arvuga sekundis.
3. Two beams of lead nuclei will also be produced , reaching energies of 1 150 TeVs , but with fewer collisions per second .
4. Two major nuclear speeds are also emerging , with energy reaching 1 150 Tev , but a few seconds per second .
5. "A few" != "fewer". "Collisions" became "seconds". Many word errors (compound words?).

4.1. ID 732: There are also two core nuclear speeds , which will be fuelled by 1 150 Tev , but fewer clashes per second .
5.1. "kokkupõrgete" was splitted => "clashes" emerged.

Improvements related to our changes. No new mistakes. BLEU the same.


### 27 [!]

1. ID 726
2. Teades enne kokkupõrget osakeste energiaid, võrdlevad nad pärast kokkupõrget tekkinud osakeste energiaid.
3. Knowing the energies of the particles prior to collision , they will be compared to the energies of the particles produced after the collisions .
4. Knowing before the impact on particle energy , they compare the energy of particles after impact .
5. Active voice instead of passive. "Impact" != "collisions". Wrong preposition "on".

4.1. ID 747: Given the impact of particle energy before collision , they will compare the particle energy generated after collision .
5.1. "kokkupõrgete" was splitted. "Impact" became "collisions" which is right.

Improvements related to our changes. No new mistakes. BLEU increased.


### 31 [!]

1. ID 761
2. Iga osakese jaoks on antiosake, mis muude omaduste hulgas omab sama massi, kuid vastaslaengut.
3. For each particle , there is an antiparticle that has , among other properties , the same mass but an opposite charge . the same mass but an opposite charge .
4. For each part , an antibody is an antique which includes the same mass , but the counterpart .
5. Lexical mistakes (physical terms)

4.1. ID 782: For each part of the component , an antique element includes the same weight as the same mass but opposite the charge .
5.1. "vastaslaengut" split - "opposite charge" emerged. 

Some improvements. No new mistakes. BLEU increased.


### 32 [!!]

1. ID 828
2. IBM-i äri katkematuse ja paindlikkuse teenus aitab tagada äritoimingute katkematust ja abistada regulatiivse järgimist, täiustatud süsteemi kättesaadavus, andmekaitse ja integreerimine IT-toimingute riskihaldusstrateegiatega.
3. IBM Business Continuity and Resiliency Services helps ensure the continuity of business operations and assists with regulatory compliance , improved systems availability , protection of data , and the integration of IT operational risk management strategies .
4. The IBM business and flexibility service will help to ensure that business operations are uninterrupted and assist in regulatory compliance , availability of an improved system , data protection and integration with IT operations .
5. Wrong tense "will help". "Flexibility" is the wrong word. Word dependency of "improved" is wrong. "Risk management strategies" missing.

4.1. ID 851: The IBM business continuity and flexibility service will help ensure the continuity of business operations and assist regulatory compliance , the availability of improved system , data protection and the risk management strategies of IT operations .
5.1. "riskihaldusstrateegiatega" split - "risk management strategies" emerged. "business continuity" emerged. Now sentence seems to be translated correctly.

Improvements related to our changes. No new mistakes. BLEU increased.

![](https://raw.githubusercontent.com/mt2017-tartu-shared-task/nmt-system-D/master/reports/report4/business.png)


## No effect

### 5

1. ID 24
2. Üksuste juhid peavad aktiivset rolli mängima ka pädevusvaldkondade teemade ja sisu väljatöötamisel.
3. An active role is needed from the heads of units also when determining the topics and contents for competence areas .
4. The Heads of Unit must play an active role in developing themes and content of competences .
5. "Unit" is singular, the second part of compound word "pädevusvaldkondade" is missing (second case already).
All the other mistakes are rephrasing.

4.1. The leaders of the entities must also play an active role in the development of thematic areas and content .
5.1. Despite the splitting there was no attention payed to "pädevus" part.

Neutral effect of out changes. No improvement. No new mistakes. BLEU increased.



##  Overview of the other sentences

### 1

1. ID 2
2. Praegu puudub investeerimisosakonnal PH-funktsioon.
3. At present the Investment department has no HRM function .
4. There is currently no PH-function on the investment department .
5. Abbreviation is wrong (PH instead of HRM), preposition "on" is wrong, all other innaccuracies are due to refrasing

4.1. There is currently no investment unit in PH .
5.1. "function" became missing for no reason. "department" became "unit".

Nothing related to our changes. No improvement. No new mistakes. BLEU decreased.


### 3

1. ID 14
2. Peagi on valmimas PRK (projekti rakendamise käsiraamat) ja PKJ (projekti korraldamise juhend).
3. PIM ( Project Implementation Manual ) and POG ( Project Organization Guide ) are under finalising .
4. The PRK ( Project Handbook on Project Implementation ) and PKJ will soon be prepared .
5. Abbreviations are completely wrong (can words in braces be abbreviated instead of direct translation?)
"Project" is duplicated unnecessarily. "Manual" is close in meaning to "handbook". Rephrasing presented.

4.1. The PRK will soon be ready and PKJ ( manual of project implementation ) .
5.1. Word order became wrong.  

Nothing related to our changes. No improvement. Some new mistakes. BLEU decreased.


### 4

1. ID 21
2. Kava taustaks on eeldus, et personalijuht/-koordinaator saab alustada täiskohaga tööd PH arendamise kallal 2003. aasta detsembri alguses.
3. As background for the schedule is assumed that in the beginning of December 2003 the HR-Manager / Coordinator could start on full time basis to work on developing the HRM .
4. The plan would be a prerequisite for the staff manager / coordinator to start full-time work on a PH development in early December 2003 .
5. The sentence has a complex structure and this is the main problem here. Abbreviations have gone wrong. 
"HR" was translated as "staff", this is quiet interesting. "Would" is in incorrect form.

4.1. The plan would be a presumption that the staff manager / coordinator will be able to start full-time work at the beginning of December 2003 .
5.1. "presumption" is a better word. "developong the HRM" is missing. "Will be able" was added and better conveys the meaning.

Nothing related to our changes. Some improvement. Some new mistakes. BLEU increased.


### 7

1. ID 62
2. Programmis peegeldatakse Lissaboni strateegia eesmärkide saavutamiseks Läti olulisimaid probleeme ning näidatakse nende probleemide lahendamise meetmete ja tegevuste peamisi jooni, aga ka nende eesmärkide saavutamise tulemusnäitajaid.
3. The Programme reflects the most essential problems for Latvia to achieve the Lisbon strategy goals , indicating the main lines of action and activities to solve these problems , as well as performance indicators for achieving the goals .
4. The programme reflects the key challenges of the Lisbon Strategy to achieve the objectives of the Lisbon Strategy and identifies the main features of the actions and actions to address these challenges , but also indicators for achieving these objectives .
5. Casing mistake in "programme", "Latvia" is completely missing, "Lisbon strategy" translated twice. "Features of actions" instead of "lines of actions.
"meetmete" and "tegevuste" both translated as "actions", "but" instead of "as well as".

4.1. ID 68: The programme reflects the most important challenges facing Latvia in achieving the objectives of the Lisbon Strategy and identifies the main features of actions and actions to tackle these challenges , as well as indicators for achieving these objectives .
5.1. Latvia emerged! "As well" is better than "but".

It can be effect of our changes, but we are not sure. Overall improvement. No new mistakes. BLEU increased.


### 8

1. ID 66
2. Nõu peeti seimi (Läti parlament) ja sotsiaalpartneritega.
3. Consultations with the Saeima ( the Latvian Parliament ) and social partners were held .
4. The consultation was held by the Sejm ( Latvian Parliament ) and the social partners .
5. "Consultation" is singular and with article. "By" instead of "with". "the" is missing before "Latvian parliament" and redundant before "social partners".
Interesting mistake "Sejm" (correct, but initially is not translated) 

4.1. ID 71: The consultation was held with the Sejm ( Latvian Parliament ) and the social partners .
5.1. "With" instead of "by" is better. 

No improvement related to our changes. No new mistakes. BLEU increased.


### 9

1. ID 72
2. 31. detsembril 2004. aastal ulatus riigivõlg 975 miljoni latini ehk 13,3%-ni SKT-st.
3. On December 31 , 2004 the central government debt reached LVL 975 million or 13.3% of GDP .
4. On 31 December 2004 , public debt amounted to 975 million tonnes , i . e . 13,3% of GDP .
5. Debt is measured in tonnes (emerged from nowhere), "puclic" instead of "central government", "amounted" rephrased as "reached". 
Abbreviation GDP is correct.

4.1. ID 78: 	On 31 December 2004 , public debt amounted to 975 million latin or 13,3% of GDP 
5.1. "latin" is clearly wrong (but better than "tonnes").

No improvement related to our changes. No new mistakes. BLEU increased.


### 10

1. ID 85 
2. Tuleb aga märkida, et vananev elanikkond paneb uuel viisil proovile tervishoiusüsteemi.
3. However , it has to be noted that the population ageing creates new challenges for the health- care system .
4. It should be noted , however , that an ageing population will test the health system in a new way .
5. Sentence is completely rephrased but correct. Only translation of compound word "tervishoiusüsteemi" lacks "care" part.

4.1. It should be noted , however , that the ageing population will test the health system in a new way .
5.1. "care" is still absent. Translation is approximately the same.

No improvement. No new mistakes. BLEU increased.


### 11

1. ID 104
2. Läti peab määrama kindlaks siseturu eeskirjade ülevõtmise tähtaja, aga ka tagama järelevalve direktiivide riigihalduse ja poliitilisel tasandil ülevõtmise koordineerimise üle.
3. Latvia must set a deadline to transpose Internal Market directives as well as ensure the supervision and co-ordination of directives' transposition at the public administration level and political level .
4. Latvia must determine the deadline for transposition of the internal market rules , but also ensure monitoring of the transposition of the directives on national administration and at political level .
5. "But" instead of "as well". "Coordination" is missing. Preposition "on" instead of "at". 
Article missing. Rephrasing.

4.1. ID 110: Latvia must determine the deadline for transposition of the internal market rules , but also ensure that the supervisory directives are coordinated at national level .
5.1. "political" part is missing.

Nothing related to out changes. Part of sentence is missing. BLEU decreased.


### 12

1. ID 108
2. Praeguse seisuga pole ELi õigusaktide ülevõtmise järelevalveks rajatud tõhusat kõikehõlmavat andmebaasi, mis annaks võimaluse jälgida direktiivide ülevõtmisprotsessi mitmes võrdluspunktis määratud aja jooksul, ning seega – lisaks muudele asjaoludele – aeglustub direktiivide ülevõtmisprotsess ning ELi siseturu normatiivibaasi loomine on takistatud.
3. At present , no efficient comprehensive data base for the supervising the transposition of EU legal acts has been established , which would provide an opportunity to follow up the directives' transposition process at several reference points in due time , hence , beside other circumstances , the process of directives' transposition slows down and the creation of a normative base of the EU Internal Market is encumbered .
4. As far as the current transposition of EU legislation is concerned , an effective database which would provide the opportunity to monitor the transposition process within a number of reference points , as well as in addition to other circumstances , is slowing down the transposition process and creating an EU internal market .
5. Very long and complicated sentence. Missing words, problems with word dependencies.

4.1. ID 114: At present , there is no effective comprehensive database for monitoring transposition of EU legislation , providing the possibility of monitoring the transposition process of directives over a number of time limits , and , in addition to other circumstances , the transposition process of directives is slowing down and the establishment of the EU internal market standards is impeded .
5.1. New translation seems better, but it is not clear why. 

Some words changed to better ones. BLEU increased.


### 13

1. ID 116
2. 1. juuli 2004. aasta seisuga seati juriidiliste isikute puhul kvalifitseeritud vabatarbija staatuse künniseks 0,0 GWh.
3. As of July 1 , 2004 the threshold for eligibility of a legal entity to the status of a qualified eligible customer was set at the 0.0 GWh .
4. As of 1 July 2004 , a qualified free consumer status threshold was set at 0,0 GWh .
5. "Eligible" is missing, "the threshold for eligibility of a legal entity" part is also missing (no attention).

4.1. ID 122: As at 1 July 2004 , a qualified consumer status threshold for legal persons was set at 0,0 GWh .
5.1. "Legal persons" emegred, but it is not clear, why.

Some improvements. No new mistakes. BLEU increased.


### 15

1. ID 134
2. Praegu on veidi üle kolmandiku EP liikmetest naised.
3. At present slightly over one third of MEPs are women .
4. It is a little more than a third of Parliament's members .
5. "At present" and "women" are missing. "EP" abbreviation is "parliament" without "e[uropean]". "It is" is redundant.

4.1. ID 144: Today , a slightly more than one third of MEPs are women .
5.1. "Women" emerged which is good. Abberviation remained.

Sentence became significantly better (BLEU 48), but it is not clear why. BLEU increased.


### 16

1. ID 139
2. Kuna Euroopa Parlamendi liikmete võim on üha suurem, mõjutavad nad oma tegevusega kõiki kodanike igapäevaelu valdkondi: keskkonda, tarbijakaitset, transporti ja ka haridust, kultuuri, tervishoidu jne.
3. Members of the European Parliament , whose powers have become more and more extensive , influence every area of the day to day life of the European public : the environment , consumer protection and transport , as well as education , culture , health etc .
4. Since the power of Members of the European Parliament is increasing , they will have an impact on all citizens' everyday lives : Environment , consumer protection , transport and education , culture , health , etc .
5. Wrong tense "will have an impact" instead of "influence". Wrong casing in "environment". Article is missing.

4.1. ID 151: Since the power of Members of the European Parliament is increasing , they influence all the areas of everyday life of their citizens : The environment , consumer protection , transport and also education , culture , health , etc .
5.1. Tense changed to present which is good, "influence" as in the human translation instead of "impact"

No improvement related to our changes. BLEU increased.


### 17

1. ID 150
2. Lisaks lubavad asutamislepingu sätted igal Euroopa kodanikul jälgida Parlamendi tööd, küsida küsimusi ning saada vastuseid oma keeles.
3. The Treaty provisions also allow all European citizens to follow Parliament's work , to ask questions and to receive replies in their own language .
4. Furthermore , the provisions of the Treaty allow every European citizen to monitor the work of the Parliament , ask questions and receive answers in its language .
5. Rephrasing everywhere. "Its" instead of "their own".

4.1. ID 162: 	Furthermore , the provisions of the Treaty allow every European citizen to monitor Parliament's work , ask questions and receive answers in its language .
5.1. Translation is a bit more similar to the human one. Otherwise the same.

No improvement. No new mistakes. BLEU increased.


### 18

1. ID 160
2. Kuus asutajariiki on Belgia, Holland, Itaalia, Luksemburg, Prantsusmaa ja Saksamaa.
3. The six founders are Belgium , France , Germany , Italy , Luxembourg and the Netherlands .
4. Six founding countries are Belgium , the Netherlands , Italy , Luxembourg , France and Germany .
5. Human translation shuffled countries. Otherwise everything is OK.

4.1. Six founding countries are Belgium , the Netherlands , Italy , Luxembourg , France and Germany .
5.1. ID 172: Nothing changed.


### 19

1. ID 164
2. 1960ndatel kerkib esile „noorsookultuur”, the Beatles ja teised ansamblid meelitavad kõikjal kokku tohutuid teismeliste fännide hulki, soodustades kultuurirevolutsiooni ja põlvkondadevahelise lõhe laienemist.
3. The 1960s sees the emergence of ‘youth culture’ , with groups such as The Beatles attracting huge crowds of teenage fans wherever they appear , helping to stimulate a cultural revolution and widening the generation gap .
4. In the 1960s , & quot ; youth culture & quot ; is emerging , the Beatles and other bands attract enormous teenagers everywhere , encouraging the cultural revolution and the widening gap between generations .
5. "Crowds" and "wherever they appear" are absent. Rephrasing.

4.1. In the 1960s , & quot ; youth culture & quot ; , the Beatles and other bands attract huge teenagers everywhere , encouraging the revolution of cultural revolution and widening the gap between generations .
5.1. "Revolution" doubled, which is bad.

No improvement. Doubling mistake. BLEU increased.


### 20

1. ID 170
2. Langevad Euroopa viimased parempoolsed diktatuurid, kui 1974. aastal kukutatakse Portugalis Salazari režiim ning 1975. aastal sureb Hispaanias kindral Franco.
3. The last right-wing dictatorships in Europe come to an end with the overthrow of the Salazar regime in Portugal in 1974 and the death of General Franco of Spain in 1975 .
4. The last European right-wing dictatorships are falling in the area of Salazar's regime in 1974 , and in 1975 General Franco dies in Spain .
5. Wrong tense "are falling". "Portugal" is missing. Word dependencies between first and second part of the sentence are incorrect.
"In the area" is wrong by meaning.

4.1. ID 182: The last European right-wing dictatorships , if in 1974 , the Salazar regime will fall in Portugal , and in 1975 , General Franco dies in Spain .
5.1. Structure of sentence is worse. Future tense.

No improvement. Some new mistakes (not related to our changes). BLEU increased.


### 22

1. ID 178
2. Kommunismi kokkuvarisemine kogu Kesk- ja Ida-Euroopas tugevdab eurooplaste naabrussuhteid.
3. With the collapse of communism across central and eastern Europe , Europeans become closer neighbours .
4. The collapse of Communism throughout Central and Eastern Europe strengthens the neighbourhoods of Europeans .
5. Casing problems. "Neibourhoods" is used with the wrong meaning.

4.1. ID 190: The collapse of Communism across Central and Eastern Europe strengthens the neighbourhood of Europeans .
5.1. Almost nothing changed. "Across" was the right word.

No improvement. No new mistakes. BLEU increased.


### 23

1. ID 181
2. Kodanikud tunnevad üha suuremat muret keskkonna kaitsmise pärast, samas otsitakse uusi võimalusi Euroopa julgeoleku- ja kaitsealaseks ühistööks.
3. People are concerned about how to protect the environment and also how Europeans can act together when it comes to security and defence matters .
4. Citizens are increasingly concerned about protecting the environment , while looking for new opportunities for European security and defence .
5. Human translation misses "increasingly" ("üha"). MT is rephrased but otherwise absolutely correct.

4.1. ID 193: Citizens are increasingly concerned about protecting the environment , while looking for new opportunities for European security and defence .
5.1. Nothing changed.


### 25

1. ID 193
2. EL kaitseb tarbijaid vigaste ja ebakvaliteetsete toodete eest olenemata sellest, kas kaupu ostetakse kodukohast või teisest riigist.
3. As consumers , EU rules protect you from faulty or substandard products whether you buy locally or in another country .
4. The EU protects consumers against defective and unquality products , whether goods are purchased from home or from another country .
5. "Rules" is missing. "Unquality" is the wrong word. Wrong preposition "from home". Can't replace "locally" with "home" here.

4.1. ID 205: The EU protects consumers from defective and unquality products regardless of whether goods are purchased from a home or another country .
5.1. No major changes

No improvements. No new mistakes. BLEU decreased.


### 28

1. ID 741
2. 1960-ndatel taipasid teadlased, et prootonid ja neutorinud, mis moodustasid aatomi tuuma, olid ise tehtud veelgi algelisematest osakestest - kvarkidest.
3. In the 1960s , scientists realised that the protons and neutrons that make up the nucleus of atoms , were themselves made up of more basic particles , quarks .
4. In the '60s , scientists realized that proton and neutrtoring which formed nuclear nucleus were made even more of the original particles - quarts .
5. Strange word "neutrtoring" - BPE problems. "Protons" are singular. System suffers the lack of physical lexicon. 
Wrong tense "formed".

4.1. ID 762: In the '60s , scientists realized that the protons and neutralizing , which formed a nuclear nucleus , were made even more primitive than the quarks .
5.1. "Quarks" named right. "Neutralizing" instead of "neutrtoring" - attempt to translate "neutrons".

Some improvements. No new mistakes. BLEU increased.


### 29

1. ID 745
2. Kvarkide kohta üteldakse, et nad on vangis.
3. Quarks are said to be confined .
4. They say they're in prison .
5. "Quarks" are missing. "Confined" != "in prison" here.

4.1. ID 766: The quarks are saying they're in jail .
5.1. "Quarks" emerged. 

Some improvements. No new mistakes. BLEU increased.


### 30

1. ID 755
2. See on põhjuseks, miks füüsikud soovivad seda uurida LHC abil loodud ioonikiirte abil.
3. That is why physicists wish to study it with the help of lead-ion beams produced by the LHC .
4. This is the reason why physics want to investigate it using the iion speeds created by LHC .
5. "Physics" != "physicists". "Iion" - wrong word. "Beams" != "speeds" 

4.1. ID 776: This is why physicians want to investigate the ion beam generated by LHC .
5.1. "Physics" became "physicians" which is bad. "ioonikiirte" was split - "ion beam" emerged, which is good.

Some improvements. Some new mistakes. BLEU increased.


### 33

1. ID 837
2. Sellega, et ärid muutuvad keerulisemateks ja rahvusvaheliselt seotuks, laienevad katkestuste riskid ja kulutused IT-st kaugemale, igale äriprotsessi aspektile.
3. With business becoming more complex and interconnected , the risk and cost of disruption extends well beyond IT , to every aspect of business processes .
4. The fact that business becomes more complex and internationally linked , the risks of interruptions and costs beyond IT go beyond the business process .
5. "Internationally" != "interconnected". Word dependencies problem("risk and costs" -> "risk of costs"). "Beyond" twice instead of "every aspect".

4.1. ID 860: As businesses become more complex and internationally linked , the risks of interruptions and the costs of the ITD go beyond the business process .
5.1. "As business become" is better. Abberviation was broken. Otherwise the same.

No improvements. No new mistakes. No BLEU change.


### 34

1. ID 859
2. Me tavaliselt teostame hindamise ja loome üksikasjaliku, tähtsuse järjekorras teekaardi ja tehnilise arhitektuuri.
3. We typically perform an assessment and develop a detailed , prioritized roadmap and technical architecture .
4. We usually carry out an evaluation and create a detailed , priority order in the road map and technical architecture .
5. "In" is redundant. Rephrasing.

4.1. ID 883: We usually carry out an evaluation and a detailed , prioritisation of a roadmap and technical architecture .
5.1. Almost nothing changed.

No improvement. No new mistakes. BLEU increased.


### 35

1. ID 871
2. Laiendada vastastikust koostööd ja koostööd kogu väärtusvõrgu ulatuses.
3. Extend interoperability and collaboration across the value net
4. Extend mutual cooperation and cooperation throughout the value network .
5. "Cooperation" twice, it is not pretty but grammatically correct.

4.1. ID 895: Extend mutual cooperation and cooperation across the value network .
5.1. "Across" instead of "throughout" is slightly better.

No improvements. No new mistakes. BLEU increased.


### 36

1. ID 878
2. info haldamise, mis kasvab astmeliselt
3. Management of information that is multiplying exponentially
4. Information on the management , incremental
5. Swap word dependencies, "incremental" != "multiplying exponentially". Ungrammatical.

4.1. ID 902: The information management , which is growing gradually
5.1. Better grammar, more sense.

Some improvements. No new mistakes. BLEU increased.


### 37

1. ID 881
2. Asudes äriprotsesside vahel on nende käivitamiseks vajalikuks infrastruktuuriks vahevara.
3. Located between your business processes and the infrastructure needed to execute them is the middleware layer .
4. In the context of business processes , an intermediate asset is necessary for their start-up .
5. "Infrastructure" is missing. "Located between" != "in the context". Word dependencies problem. 
"Start-up" != "execute".

4.1. ID 905: In the setting up of business processes , it is necessary to provide infrastructure with an infrastructure .
5.1. Wasn't fixed at all.

No improvements. No new mistakes. BLEU increased.


### 38

1. ID 886
2. Me saame aidata klientidel saavutada nende eesmärgid kiiremini ja vähendatud riskiga, kuna me saame rakendada oma tohutud parimate praktikate, metoodikate, tööriistade ja tõestatud arhitektuuride kogumit, mis oleme kogunud aastate jooksul erinevatest koostöökogemustest klientidega kõigis ettevõtetest üle maailma.
3. We can help clients achieve their goals more quickly and with decreased risk because we can leverage our vast set of best practices , methodologies , tools and proven architectures gained over years of diverse engagement experience with clients in all industries worldwide .
4. We can help customers achieve their goals faster and reduced , since we can implement our vast best practice , methodologies , tools and proven architectures , which we have gathered over the years with customers across the world from different business experience .
5. "Risks" is missing. Word dependencies problem in the end of the sentence. Grammatically incorrect. 

4.1. ID 910: We can help customers achieve their goals faster and reduced at risk because we can implement our huge best practice , methodologies , tools and proven architectures that we have gathered over the years from different experiences of cooperation with customers worldwide .
5.1. "Risk" emerged. End of sentence looks more like human translation.

Some improvements. No new mistakes. BLEU increased.


### 39

1. ID 896
2. IBM-i nõudmisel oleva info infrastruktuuriteenused
3. IBM Information on Demand Infrastructure Services
4. Information infrastructure provided at the request of IBM
5. "On demand" != "at the request". "Services" is missimg. Word dependencies problem.

4.1. ID 921: Information Infrastructure for IBM on request
5.1. Almost nothing changed.

No improvements. No new mistakes. BLEU increased.


### 40

1. ID 899
2. Looge kiire infrastruktuur, mis võimaldab äriprotsesside integreerimist
3. Create an agile infrastructure that enables business process integration
4. Set up a rapid infrastructure allowing the integration of business processes
5. "Agile" != "rapid" here. Rephrasing.

4.1. ID 924: Create a fast infrastructure that allows the integration of business processes
5.1. Seems more like human translation.

No improvement. No new mistakes. BLEU increased.

