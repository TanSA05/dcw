# == Schema Information
#
# Table name: complaints
#
#  id                            :integer          not null, primary key
#  complainant                   :string(255)
#  address                       :string(255)
#  complaint_number              :string(255)
#  target_date                   :date
#  file                          :string(255)
#  registration_date             :date
#  status                        :string(255)
#  prayers                       :text(65535)
#  overdue                       :boolean
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  category                      :string(255)
#  respondent_if_person          :string(255)
#  respondent_if_agency          :string(255)
#  brief_of_complaint            :text(65535)
#  contact_number_of_complainant :string(255)
#  locality                      :string(255)

class Complaint < ActiveRecord::Base
	has_paper_trail
	include RailsAdminCharts
	include AASM

	# aasm_column :status

  validates_presence_of :complainant, :contact_number_of_complainant, :address
  # validates_presence_of :file

	extend Enumerize
	enumerize :locality, in: ["A.G.C.R. ENCLAVE","A.I.I.M.S.","A.V. NAGAR","ABUL FAZAL ENCLAVE PART - 1","ABUL FAZAL ENCLAVE PART - 2","ACHARYA NIKETAN","ADARSH NAGAR (MOOL CHAND NAGAR)","ADHCHINI VILLAGE","ADHYAPAK NAGAR","AIMMAT PURI","AIR FORCE STATION BASANT NAGAR","AJAY ENCLAVE","AJIT NAGAR","AJMERI GATE","ALAKNANDA","ALI VILLAGE","ALIGANJ","ALIPUR","AMAN VIHAR","AMAR COLONY","AMAR MOHALLA","AMAR VIHAR","AMBAR HAI","AMBEDKAR NAGAR","AMBIKA VIHAR","ANAJ MANDI SHAHADARA","ANAND GRAM","ANAND LOK","ANAND NIKETAN","ANAND PARBAT","ANAND VIHAR","ANANGPUR DAIRY","ANARKALI","ANDHA MUGHAL","ANDHERAI MOR","ANDREWS GANJ","ANGURI BAGH MKT","ANSAL PLAZA","ANSARI  NAGAR EAST","ANSARI  NAGAR WEST","ANUP NAGAR","APS COLONY","ARAB KI SARAI","ARAM BAGH","ARAM NAGAR","ARJAN GARH","ARJUN NAGAR","ARMY CAMP","ARMY GOLF COURSE","ARMY PARADE GROUND COMPLEX","ARUNA NAGAR","ARYA NAGAR","ASHA PARK","ASHOK NAGAR","ASHOK PARK","ASHOK VIHAR PHASE - 1","ASHOK VIHAR PHASE - 2","ASHOK VIHAR PHASE - 3","ASHOK VIHAR PHASE - 4","ASHOKA PAHARI","ASMARA LINE","ASOLA WILD LIFE SANCTUARY","AURVIGYAN NAGAR","AVANTIKA","AYA NAGAR","AZAD MARKET","AZAD NAGAR","AZAD NAGAR COLONY","AZADPUR","BABA COLONY","BABARPUR","BABOO NAGAR","BADARPUR","BADLI INDUSTRIAL AREA PHASE - 1","BADLI INDUSTRIAL AREA PHASE - 2","BAGHWATI GARDEN","BAGICHI ALLAUDDIN","BAGICHI PEER JI","BAHADUR GARH ROAD","BAHADUR SHAH ZAFAR MARG","BAHUBALI ENCLAVE","BAIRD LANE MARKET ","BAKHTAWAR PUR","BAL BHAVAN COMPLEX","BALBIR NAGAR","BALBIR NAGAR EXTENSION","BALDEV PARK","BALI NAGAR","BALJIT NAGAR","BALLIMARAN","BANARSI DAS ESTATE","BANDA BAHADUR","BANDER WALI KUI","BANGLA SAHIB GURUDWARA","BANK COLONY","BANKNER","BAPA NAGAR","BARA","BARA HINDU RAO","BASAI DARAPUR","BASANT ENCLAVE","BASANT GAON","BATLA HOUSE","BAWANA","BAZAR SITARAM","BEGAMPUR","BEGUMPUR","BEHLOLPUR KHADAR","BER SARAI","BHAGAT SINGH COLONY","BHAGI RATH VIHAR","BHAGVATI VIHAR","BHAGWAN DAS COLONY","BHAGWAN NAGAR","BHAGWANPUR","BHAJANPURA","BHALAWAA JAHAGIR PUR","BHALSWA","BHARAT NAGAR","BHARAULA","BHARTI COLONY","BHARTI NAGAR","BHATI","BHAVISYANIDHI ENCLAVE","BHERA ENCLAVE","BHIKAJI CAMA PLACE","BHIM NAGAR","BHOGAL","BHOLA NATH NAGAR","BHOOLI BHATIARI","BIHARI COLONY","BIHARIPUR","BIJWASAN","BINDAPUR","BIR NAGAR","BIRENDRA NAGAR","BRAHMA PURI","BRIJ PURI","BUDH NAGAR","BUDH VIHAR PHASE - 1","BUDH VIHAR PHASE - 2","BUDHELA","BURARI","C.C. COLONY","C.G.O. COMPLEX","CAMP AREA","CANAL COLONY","CENTRAL MARKET","CENTRAL POST OFFICE COLONY","CHAJJU RAM COLONY","CHAM WOOD VILLAGE","CHAMAN PARK","CHANAKYA PLACE","CHANAKYA PURI","CHAND BAG","CHAND MOHALLA, Gandhi Nagar","CHAND MOHALLA, Vivek Vihar","CHAND NAGAR","CHANDAN VIHAR","CHANDAR NAGAR","CHANDER LOK","CHANDNI CHOWK","CHANDNI MAHAL","CHANDRA SHEKHER AZAD COLONY","CHANDRAWAL (OLD)","CHANDU NAGAR","CHAUHAN BANGAR","CHAUKHANDI","CHAWRI BAZAR","CHHAJJUPUR","CHHATARPUR","CHHAWLA","CHHOTI SUBJI MANDI","CHHTRASAL STADIUM","CHILLA SARDA BANGAR","CHIRAG ENCLAVE","CHIRAGH DELHI","CHITLI QABER","CHITRA KOOT (EAST OF LONI)","CHITRA VIHAR","CHITTARANJAN PARK","CHUNGI NO 2","CIVIL AVIATION COLONY","CIVIL LINES","CLEAR WATER PUMP","CONNAUGHT PLACE","CORONATION MEMORIAL","CROCKERY MARKET","D.D.A. LAND","D.T.C. BUS DEPOT","D.T.C. BUS TERMINAL","D.T.C. COLONY","D.T.C. WORK SHOPS","DABRI EXTENTION","DABRI VILLAGE","DAIRY COLONY","DAKSAINPURI EXTENSION","DAKSHINAPURAM","DAKSHINI PITAMPURA","DAKSHINPURI","DALLOPURA","DALLU PURA","DAO SARAI","DAP TRAINING COMPLEX","DARYA GANJ","DAYABASTI","DAYAL BAGH COLONY","DAYANAND COLONY","DAYANAND VIHAR","DCM CHOWK","DEBI NAGAR","DEEPALI","DEFENCE COLONY","DEFENCE ENCLAVE","DELHI CANTONMENT AREA","DELHI CANTT CHARGE 1","DELHI CANTT CHARGE 4","DELHI CLOTH MILL","DELHI GOLF CLUB","DELHI MILK SCHEME COLONY","DELHI UNIVERSITY GROUND","DELHI ZOOLOGICAL PARK","DEOLI","DEOLI GAON NAI BASTI","DEPUTY GANJ","DERAWAL NAGAR","DESU COLONY","DEV NAGAR","DHAKA COLONY","DHAKA VIHAR","DHAKA VILLAGE","DHARAMPURA","DHAULA KHUAN ENCLAVE - 1","DHAULA KHUAN ENCLAVE - 2","DHIR PUR","DHURGA VIHAR","DICHAON KALAN","DILKHUSH INDUSTRIAL AREA","DILSGAD PLAZA","DILSHAD COLONY","DILSHAD GARDEN","DLF ANKUR VIHAR","DLF AREA","DMS PLANTS","DR LAHIA INDUSTRIAL AREA (RAMPURA)","DR.AMBEDKAR NAGAR","DR.AMBEDKAR STADIUM","DRAIN","DSIDC","DUGGAL COLONY","DURGA COLONY(DASRATHPURI)","DURGA PARK COLONY","DURGAPURI","DWARIKAPURI","DWARKA","DYARAM PARK","EAST ARJUN NAGAR","EAST AZAD NAGAR","EAST BLOCK","EAST END ENCLEVE","EAST GOKALPUR","EAST JYOTI NAGAR","EAST KRISHNA NAGAR","EAST LUXMI MARKET","EAST MUKHERJEE NAGAR","EAST NATHU COLONY","EAST OF KAILASH","EAST PARMANAND NAGAR","EAST PATEL NAGAR","EAST PUNJABI BAGH","EKTA VIHAR","ELECTRICITY COLONY","FARASH BAZAR","FATEH NAGAR","FATEHPURI","FAYAJ GANJ","FILMISTAN","FIRE TRAINING CENTRE","FIROZ SHAH KOTLA CRICKET STADIUM","FREEDOM FIGHTER VIHAR","FRIENDS COLONY EAST","FRIENDS COLONY WEST","FRIENDS ENCLAVE","G [dot] T [dot] B [dot]  NAGAR","G.T.B. ENCLAVE","GAFOOR NAGAR","GAGAN VIHAR","GALIMIYAWALI","GAMRI","GANDHI DARSHAN","GANDHI MAREKT","GANDHI NAGAR","GANDHI NATIONAL MUSEUM","GANDHI SQUARE","GANDHI VIHAR","GANESH NAGAR","GANESH PURA","GANGA VIHAR","GANWARI","GARHI MENDU","GAUSHALA ROAD","GAUTAM NAGAR","GAUTAM VIHAR","GEETA COLONY","GHALIB APPARTMENT","GHAROLI","GHAROLI DAIRY FARM","GHATORNI","GHAZIPUR","GHONDA","GHONDA PATTI GHAUHAN","GHONDLI","GIRI NAGAR","GITANJALI PARK","GITANJLI ENCLAVE","GODAI PUR","GOKALPUR","GOKALPURI COLONY","GOLDEN PARK","GOLE DAKHANA","GOLE MARKET","GOLF LINKS","GOPAL NAGAR","GOPALPUR","GOVERNMENT QUARTERS","GOVIND KHAND","GOVIND MOHALLA","GOVIND PURI","GOVINDPURI EXTENSION","GRAVE YARD","GREATER KAILASH - 1","GREATER KAILASH - 2","GREATER KAILASH ENCLAVE - 1","GREATER KAILASH ENCLAVE - 2","GREATER KAILASH ENCLAVE - 3 (MASJID MOTH)","GREEN PARK","GREEN PARK EXTENSION","GTB ENCLAVE","GUJRANWALA TOWN","GUJRAT VIHAR","GUL MOHAR PARK","GULABI BAGH","GULSHAN PARK","GURGAON SECTOR 19","GURGAON SECTOR 21","GURU ANGAD NAGAR EAST","GURU ANGAD NAGAR WEST","GURU HARKISHAN NAGAR","GURU NANAK NAGAR","GURU TEG BAHADUR NAGAR (KINGSWAY CAMP)","GURUHARKISHAN NAGAR","GYAN NAGAR","GYMKHANA CLUB","H.P.L. COLONY","H.R. HOSPITAL","HAIDARPUR","HAIDARPUR WATER WORKS","HAKIKAT NAGAR","HAMAYUNPUR","HAMDARD NAGAR","HARDEV PURI","HARGOBIND ENCLAVE","HARI ENCLAVE","HARI NAGAR","HARI NAGAR (ASHRAM)","HARIJAN BASTI","HARIJAN COLONY","HARINAGAR","HARKESH NAGAR","HARSH VIHAR","HARSHDEV COLONY (BUDHVIHAR PHASE 2)","HASANPUR","HASHTSAL","HATHI GHAT","HATHI KHANA","HAUZ KHAS","HAUZ QAZI","HAUZ RANI","HAUZRANI VILLAGE","HEMKUNT COLONY","HIND NAGAR","I [dot] P EXTENSION","I.F.C.I. COLONY","I.G. INDOOR STADIUM","I.G.I. AIRPORT","I.P. ESTATE","I.S.B.T. ANAND VIHAR","IARI COLONY","IBRAHIMPUR","IDGAH ROAD","IDLE TRUCK PARKING","IIT","INA COLONY","INDER ENCLAVE","INDER LOK","INDER LOK COLONY","INDER PURI","INDIA GATE","INDIAN AGRICULTURE RESEARCH INSTITUTE","INDIAN AIR LINES &amp; AIR INDIA ESTATE","INDIRA CAMP","INDIRA GANDHI MEMORIAL CENTRE FOR ARTS","INDIRA PARK EXTENTION","INDRA ENCLAVE","INDRA NAGAR","INDRA PARK","INDRA PURI","INDRA VIHAR","INDRA VIKAS COLONY (FLOOD RESETTELMENT COLONY)","INDRALOK","INDRAPRASTHA","INDRAPRASTHA EXTENSION","INDRAPURI","INDUSTRAIL AREA (G.T.KARNAL ROAD)","INTER STATE BUS TERMINAL","INTERNATIONAL AIRPORT AUTHORITY OF INDIA","ISHWARDAS COLONY","ISWAR NAGAR","J.J. COLONY (MILAP NAGAR)","J.J. COLONY (VIKAS PURI)","J.J. COLONY NO.1","J.J. COLONY NO.2","J.J.C.","J.J.C. COLONY (RAGHUBIR NAGAR)","J.J.C. SURAJ PARK","JAANTA COLONY","JAFRRABAD","JAGAT PURI","JAGAT PURI EXTENSION","JAGDAMBA COLONY VILLAGE","JAGJEET NAGAR","JAGRITI ENCLAVE","JAHANGIR PURI-I","JAHANGIR PURI-II","JAHANGIRPURI","JAHANGIRPURI INDL AREA","JAHANPANAH CITY FOREST","JAIDEV PARK","JAIN COLONY (G)","JAIN PARK","JAITPUR","JAKHIRA","JAL VIHAR","JAMA MASJID","JAMIA MILLIA ISLAMIA","JAMIA NAGAR","JANAK PURI NORTH","JANAK PURI SOUTH","JANAKPURI WEST","JANATA COLONY","JANATA FLATS","JANGPURA","JASOLA","JAWAHAR LAL NEHRU STADIUM","JAWAHAR NAGAR","JAWAHER MARKET","JAWALAPURI","JAYA SARAI","JEEVAN NIKETAN","JEEVAN PARK","JEEVAN SARITA","JEEWAN NAGAR","JHANDEWALAN","JHARERA VILLAGE","JHARODA","JHARODA DAIRY COLONY","JHARODA MAZRA BURARI GANO","JHEEL","JHEEL KHURANJA","JHILMIL","JHILMIL COLONY","JHILMIL INDUSTRIAL AREA","JITAR NAGAR","JIWANPUR","JJ.. COLONY (VIKAS PURI)","JNU","JOGABAI","JOHRI","JOHRI PUR","JORBAGH","JOSHI COLONY","JURBAGH","JWALA NAGAR","JWALAHERI","JYOTI COLONY","KABIR BASTI","KABIR NAGAR","KADIPUR","KAILASH COLONY","KAILASH NAGAR, Gandhi Nagar","KAILASH NAGAR, Vivek Vihar","KAILASH PARK","KAILASHPURI EAST","KAILASHPURI WEST","KAKA NAGAR","KAKRAULA","KALAN MAHAL","KALAN MASJID","KALANDER","KALI BASTI","KALINDI KUNJ","KALKAJI","KALU SARAI","KALYAN PURI","KALYANVAS","KALYANY VIHAR","KAMAL PARK","KAMARUDDIN NAGAR EXTENSION","KAMLA MARKET","KAMLA NAGAR","KAMLA NEHRU RIDGE","KANHIYA NAGAR","KANJHAWALA","KANTI NAGAR","KAPASHERA","KAPIL VIHAR","KAPUS HERA","KARALA","KARAMPURA","KARAWAL NAGAR","KARAWAL NAGAR EAST","KARAWAL NAGAR WEST","KARDAM FARM","KARDAM PURI","KARKAR DUMAN","KARMARUDDIN NAGAR","KAROL BAGH","KARTAR NAGAR","KASHMERE GATE","KASTURBA NAGAR","KATWARIA SARAI","KAURIA PUL","KAUSHAMBI","KAVITA COLONY","KEREN LINES","KESAV PURA","KESHAW PURAM","KESHOPUR","KEWAL PARK","KHAJAN BASTI","KHAJOORI KHAS","KHAJURI KHAS","KHALSA NAGAR","KHAN MARKET","KHANPUR","KHANPUR VILLAGE","KHARI BAOLI","KHERA","KHERA GHARI","KHICHRIPUR","KHIRKI VILLAGE","KHIZRABAD","KHOLI VILLAGE","KHORA COLONY","KHUREJI","KHUSHK","KHYALA","KHYBER PASS","KIDWAI NAGAR EAST","KIDWAI NAGAR WEST","KILOKARI","KIRADI VILLAGA","KIRAN GARDEN","KIRAN VIHAR","KIRARI SULEMAN NAGAR","KIRPAL BAGH","KIRTI NAGAR","KISHAN KUNJ","KISHANGANJ","KISHANGARH","KOHAT ENCLAVE","KONDLI","KONDLY GHAROLY","KOTLA MUBARAKPUR","KRISHI BHAVAN","KRISHI KUNJ","KRISHNA KUNJ","KRISHNA NAGAR","KRISHNA NAGAR EXTENSION","KRISHNA PARK","KRISHNA VIHAR","KUCHA PANDIT","KUMAR COLONY","KUNDAN NAGAR","KUNWAR SINGH NAGAR","LADO SARAI","LADY HARDING MEDICAL COLLEGE","LADY IRWIN COLLEGE","LAHORI GATE","LAJPAT NAGAR PART - 1","LAJPAT NAGAR PART - 2","LAJPAT NAGAR PART - 3","LAJPAT NAGAR PART - 4","LAJWANTI GARDEN","LAKSHAMI GARDEN","LAKSHMI BAI NAGAR","LAKSHMI NAGAR","LAKSHMI PARK","LAL QILA","LAL QUARTER","LALBAG COLONY","LALKOT","LALKUAN","LAWRENCE ROAD","LAXMI NAGAR","LAXMI PARK","LEKHA VIHAR","LEKHU NAGAR","LIBASPUR","LODI COLONY","LODI GARDEN","LODI INSTITUTIONAL AREA","LOHA MANDI","LOK VIHAR","MADAN PARK","MADAN PUR DABAS","MADANGIR","MADANGIR CAMP","MADANPUR KHADAR","MADHU VIHAR","MADHUBAN ENCLAVE","MADI PUR","MAGLAPURI - 1","MAGLAPURI - 2","MAHA LAKSHMI ENCLAVE","MAHARAM MOHALLA","MAHARANA PARTAP ENCLAVE","MAHARANI BAGH","MAHAVIR ENCLAVE - 1","MAHAVIR ENCLAVE - 2","MAHAVIR ENCLAVE - 3","MAHAVIR NAGAR","MAHILA COLONY","MAHINDRA PARK","MAHIPALPUR","MAIDANGARHI","MAJ BHUPINDAR NAGAR","MAJLESH PARK","MAJNU KA TILA","MAKANPUR","MAKANPUR COLONY","MAKKI SARAI","MAL ROAD KISHAN GARH","MALAKPUR","MALCHA MARG MARKET","MALKA GANJ","MALVIYA NAGAR","MAMC Campus","MANAK VIHAR","MANDAWALI","MANDAWALI FAZALPUR","MANDOLI","MANGIRAM COLONY (BUDHVIHAR PHASE - 2)","MANGLAPURI","MANGOL PURI NORTH","MANGOLPURI","MANGOLPURI EAST","MANGOLPURI WEST","MANOHAR PARK","MANSA RAM PARK","MANSAROWAR PARK","MANSAROWER GARDEN","MARSH","MASIHGARH","MASJID MOTH","MATA SUNDRI  COLLEGE","MATA SUNDRI RAILWAY COLONY","MATIALA","MAUJPUR","MAURICE NAGAR","MAUSAM VIHAR","MAYA ENCLAVE","MAYAPURI INDUSTRIAL AREA PH - 1","MAYAPURI INDUSTRIAL AREA PH - 2","MAYFAIR GARDEN COLONY","MAYUR VIHAR PHASE - 1","MAYUR VIHAR PHASE - 2","MAYUR VIHAR PHASE - 3","MCD ORCHARD","MCE FORCE COLONY","MEENA BAGH","MEET NAGAR","MEETHEYPUR","MEHRAM NAGAR EAST","MEHRAM NAGAR WEST","MEHRAULI","METEROLOGICAL COMPLEX","MIG FLATS","MILAKPUR KOHI RANGPURI","MILAN VIHAR","MILAP NAGAR","MINAKSHI GARDEN","MINTO ROAD","MINTOROAD RAILWAY COLONY","MIRA BAGH","MITHEPUR EXTENTION","MODEL BASTI","MODEL TOWN","MODERN SCHOOL","MOHAMMAD PUR","MOHAN CO-OP INDUSTRIAL ESTATE","MOHAN GARDEN","MOHAN NAGAR","MOHINDRA ENCLAVE","MOLARBAND COLONY","MOLARBAND EXTENTION","MOLARBAND VILLAGE","MORI GATE","MOTI BAGH","moti bagh","MOTI GAON","MOTI NAGAR","MOTI NAGAR","MOTIAKHAN DUMP SCHEME","MOTIBAGH RAILWAY COLONY","MOTIBAGH SOUTH","MUBARAK PUR","MUBARAKPUR KOTLA","MUJAHIDPUR","MUKAND PUR","MUKARJI PARK","MUKHERJEE NAGAR","MUKUND PUR","MULTANI DHANDA","MUNDKA","MUNIRKA","MUNSHIRAM DAIRY COLONY","MUSTAFABAD","MUTINY MEMORIAL","NABI KARIM","NAGLI RAJAPUR","NAGLIMACHI","NAHARPUR","NAI BASTI","NAJAFGARH","NAJAFGARH ROAD INDUSTRIAL AREA","NANAKPURA","NAND NAGRI","NANDRAM PARK","NANGAL","NANGLI PUNA","NANGLOI EXTENSION","NANGLOI SAYED","NANGLOIN (JJ COLONY NO.3)","NANHE PARK","NARAINA","NARAINA INDUSTRIAL ESTATE PHASE - 1","NARAINA INDUSTRIAL ESTATE PHASE  -1","NARAINA VIHAR","NARANG COLONY","NARDANA","NARELA","NARESH PARK EXTENSION","NARI NIKETAN","NATHUPURA","NATIONAL STADIUM","NAUROJI NAGAR","NAVIN SHADARA","NAVJIVAN VIHAR","NAWABGANJ","NAWADA","NAYA MUHALLA","NAYAA BAZAR","NCERT &amp; NIEPA","NDMC INDOOR STADIUM","NDSE","NEB SARAI","NEETI BAGH","NEHRU NAGAR","NEHRU PLACE","NEHRU VIHAR","NETAJI NAGAR","NEW ASHOK NAGAR","NEW CHANDRAWALI","NEW DELHI RAILWAY STATION","NEW FRIENDS COLONY","NEW GOVIND PURA","NEW GUPTA COLONY","NEW JAFFRABAD","NEW KONDLI","NEW KRISHNA NAGAR","NEW LAYALPUR COLONY","NEW MAHABIR NAGAR","NEW MARKET","NEW MODERN SHAHDARA","NEW MOTI NAGAR","NEW MULTAN NAGAR","NEW RAJDHANI ENCLAVE","NEW RAJENDRA NAGAR","NEW ROHTAK ROAD LEFT SIDE","NEW SABZI MANDI","NEW SAMAIPUR","NEW SANJAY AMAR COLONY","NEW SEELAM PUR","NEW USMANPUR","NEW VISHWAS NAGAR","NEWSILAMPUR PHASE - 3","NICHOLSON LINES","NIHAL VIHAR","NILDTHI","NIRANKARI COLONY","NIRANKARY SAROVAR","NIRMAN BHAVAN","NIRMAN VIHAR","NIZAMUDDIN EAST","NIZAMUDDIN RAILWAY STATION","NIZAMUDDIN WEST","NIZAMUDDIN&#39;S TOMB","NORTH ANARKALI COLONY","NORTH EXTENSION AREA","NORTH GHONDA","NORTH KANTI NAGAR (OLDANPUR)","NORTH SEWAGE TREATMENT PLANT","NOV DURGA VIHAR","NPL HOUSES","NW AVENUE PUNJABI BAGH","O.A. (GREEN BELT)","O.A. (SECTOR 3)","OKHLA","OKHLA INDUSTRIAL AREA PHASE - 1","OKHLA INDUSTRIAL AREA PHASE - 2","OKHLA VILLAGE","OLD DELHI RAILWAY STATION","OLD GOVIND PURA","OLD GUPTA COLONY","OLD LAJPAT RAI MARKET","OLD MAHABIR NAGAR","OLD RAJENDRA NAGAR","OLD SAMAIPUR","OLDANPUR","OM VIHAR","ONKAR NAGAR","OPEN AREA","ORCH","Other","OUT RAM LINES (G T B NAGAR)","P &amp; T COLONY","PACHIMABAD","PACHIMI PITAMPURA","PADAM NAGAR, Civil Lines","PADAM NAGAR, Sadar Bazar","PADAMNAGAR","PADMINI ENCLAVE","PAHAR GANJ","PAHARI DHIRAJ","PAHARI DHIRAJ ENCLAVE","PALAM VILLAGE","PALAM VILLAGE - II","PALIKA NIWAS COLONY","PAMPOSH ENCLAVE","PAN MANDI","PANCHSHEEL ENCLAVE","PANCHSHEEL PARK","PANCHSHILA NORTH","PANCHSHILA SOUTH","PANCHVATI","PANDAV NAGAR","PANDIT PARK","PANT NAGAR","PAPAN KALAN","PARAAO VIHAR","PARK END","PARLIAMENT STREET","PARTAP MARKET","PARTAP NAGAR","PASCHIM VIHAR","PASCHIM VIHAR EXTENSION","PATEL CHEST COLONY","PATEL NAGAR","PATEL NAGAR EAST","PATPAR GANJ","PATPARGANJ INDUSTRIAL AREA","PHOOL BAGH","PIRA GARHI","PITAMPURA","PLUNGI VILLAGE","POLICE COLONY","POSHANGIPUR COLONY","PRAGATI MAIDAN","PRAGATI VIHAR","PRAHLAD VIHAR","PRASAD NAGAR","PRASHANT VIHAR (ROHINI SECTOR 14)","PRATAP GARDEN","PRATAP KHAND","PRATAP NAGAR","PRATAPPURA","PREET VIHAR","PREM NAGAR","PREM VIHAR","PRESEDENTS ESTATE QUARTERS","PRESIDENT POLICE GUARD","PRESIDENTS ESTATE","PRESS COLONY","PRESS ENCLAVE","PRIYA DARSHINI VIHAR","PRIYA ENCLAVE","PRIYADERISHANI VIHAR","PUL MITHAI","PUL PAHALADPUR","Punjabi Bagh (West)","PURAN NAGAR","PUSA HILL FOREST","PUSA INSTITUTE","PUSA ROAD","PUSHPA VIHAR SECTOR 1","PUSHPA VIHAR SECTOR 2","PUSHPA VIHAR SECTOR 3","PUSHPA VIHAR SECTOR 4","PUSHPA VIHAR SECTOR 5","PUSHPA VIHAR SECTOR 6","PUSHPA VIHAR SECTOR 7","PUSHPANJALI","PUSHPANJALI ENCLAVE","PUTH KALAN","Q1A1","QUTAB GARH","QUTAB INSTITUTIONAL AREA","QUTAB ROAD","R K ASHRAM MARG","R.K. PURAM","R.K. PURAM SECTOR 12","R.K. PURAM SECTOR 13","R.P.S.F. COMPLEX","RABINDRA NAGAR","RADHA SWAMI SATSANG BHAWAN","RADHA VIHAR","RADHEY PURI","RADHEY PURI EXTENSION","RADHEY SHYAM PARK","RADIO COLONY","RAGHUBAR PURA","RAGHUBIR NAGAR","RAGHUNAGAR","RAGHUPURA","RAILWAY COLONY","RAILWAY COLONY (SHAKUR BASTI)","RAILWAY EXTENSION","RAILWAY LAND","RAILWAY STATION (NANGLOI)","RAJ NAGAR","RAJ NAGAR - 1","RAJA BAZAR SQUARE","RAJA GARDEN","RAJA PARK","RAJAPURI","RAJASTHANI UDYOG NAGAR","RAJDHANI ENCLAVE","RAJDHANI PARK","RAJENDRA MARKET","RAJENDRA NAGAR","RAJENDRA PARK","RAJENDRA PARK EXTENSION","RAJENDRA PLACE","RAJGARH COLONY","RAJGHAT","RAJIV COLONY","RAJIV GANDHI SMRITI VAN","RAJIV NAGAR","RAJOKARI PAHARI PROTECTED FOREST","RAJOKRI (HARJOKRI)","RAJOKRI PAHARI","RAJOURI GARDEN","RAJOURI GARDEN EXTENSION","RAJPUR KHURD","RAJPURA","RAKSHA BHAVAN","RAM BAGH","RAM BAZAR","RAM DATT ENCLAVE","RAM MANOHAR LOHIA HOSPITAL","RAM NAGAR","RAM VIHAR","RAM VIHAR COLONY","RAMA ENCLAVE","RAMA PARK","RAMESH NAGAR","RAMESHWAR NAGAR","RAMGARH","RAMLILA GROUND","RAMPRASTHA","RAMPURA","RANAPRATAP BAGH","RANGPURI NALLAPAR","RANGPURI PAHARI","RANHOLLA","RANI BAGH","RANI GARDEN","RANIBAGH","RANJIT NAGAR","RANJIT VIHAR CULTIVATED AREA","RASHID MARKET","RATAN BAGH","RATAN PARK","RAVI NAGAR","RAVINDRA PARK","RBI COLONY","REGARPURA","RESERVE BANK COLONY","RESIDENSE WELFARE AGENCY","RESIDENTIAL AREA SOUTH BLOCK","RISHAB VIHAR","RISHI NAGAR","RITHALA","ROCKY AREA (STONE QARRIES)","ROHINI (SECTOR - 23)","ROHINI AVANTIKA (SECTOR 1)","ROHINI SECTOR 11","ROHINI SECTOR 12","ROHINI SECTOR 13","ROHINI SECTOR 14","ROHINI SECTOR 14 EXTENSION","ROHINI SECTOR 15","ROHINI SECTOR 16","ROHINI SECTOR 16 (O.A.)","ROHINI SECTOR 17","ROHINI SECTOR 18","ROHINI SECTOR 19","ROHINI SECTOR 2","ROHINI SECTOR 24","ROHINI SECTOR 25","ROHINI SECTOR 3","ROHINI SECTOR 4","ROHINI SECTOR 5","ROHINI SECTOR 6","ROHINI SECTOR 7","ROHINI SECTOR 8","ROHINI SECTOR 9","ROHIT KUNJ","ROHTASH NAGAR EAST","ROOP NAGAR","ROSHANARA GARDEN","ROSHANARA ROAD","ROSHANPURA","ROUSE AVENUE","RPS COLONY","RUCHI VIHAR VASANT ENCLAVE","RUI MANDI","S B M COLONY","S B NAGAR","S P MARG","S.B.I. COLONY","SABAPUR","SABOLI","SABOLI EXETENSION","SABZI MANDI","SABZI MANDI (OLD)","SADAR BAZAR","SADAR BAZAR RAILWAY STATION","SADATPUR","SADH NAGAR PALAM COLONY","SADH NAGAR PART - II","SADHNAGAR - I","SADHNAGAR - II","SADIQ NAGAR","SAFDARJANG ENCLAVE","SAFDARJUNG HOSPITAL AREA","SAGARPUR EAST","SAGARPUR WEST","SAHAZADA BAGH","SAHIBABAD DAULATPUR","SAHIPUR","SAID - DL - AJAIB","SAINI ENCLAVE","SAINIK FARM","SAINIK VIHAR","SAKDAR PUR","SAKET","SALIM GARH FORT","SAMALKA","SAMASPUR","SAMRAT ENCLAVE","SANDESH VIHAR","SANGAM PARK","SANGAM VIHAR","SANJAY COLONY","SANJAY ENCLAVE (B)","SANJAY GANDHI TRANSPORT NAGAR","SANJAY NAGAR","SANT GARH","SANT NAGAR","SANT VIHAR","SANTOSH PARK","SANTPURA","SANWAL NAGAR","SARADHANAND PARK","SARAI JALINA","SARAI KALE KHAN","SARAI PIPALTHALA","SARAI ROHILL","SARAI ROHILLA","SARASWATI GARDEN","SARASWATI VIHAR","SARITA VIHAR","SAROJINI NAGAR","SAROJINI VIHAR","SARUP NAGAR","SARUP NAGAR COLONY","SARUP NAGAR NEW COLONY","SARVA PRIYA VIHAR","SARVODYA ENCLAVE","SATBARI","SATNAGAR","SATYA NIKETAN","SATYAWATI COLONY","SAVITA VIHAR","SAWAN PARK","SECRETARIAT AREA","SEHATPUR","SEPTIC TANKS","SEWAGE TREATMENT PLANT (PROPOSED)","SEWAK PARK","SHADI KHANPUR","SHAH ALAM","SHAHAZADA BAGH","SHAHDRA","SHAHIBABAD DAULAT PUR","SHAHIBABAD INDUSTRIAL AREA SITE - 4","SHAHID BHAGAT SINGH TERMINAL","SHAHID NAGAR","SHAHPUR JAT","SHAHPURA","SHAKAR PUR","SHAKTI NAGAR","SHAKTI STHAL","SHAKUR BASTI","SHAKURPUR VILLAGE","SHALIMAR BAGH","SHALIMAR GARDEN","SHALIMAR PARK","SHAM NAGAR","SHANKAR NAGAR","SHANKAR VIHAR","SHANTI MOHALLA","SHANTI NAGAR","SHANTI NIKETAN","SHANTI VAN","SHANTI VIHAR","SHARAD VIHAR","SHARDAPURI COLONY","SHARDHANAND MARKET","SHASHI GARDEN","SHASTRI BHAWAN","SHASTRI NAGAR, Civil Lines","SHASTRI NAGAR, Gandhi Nagar","SHASTRI NAGAR, Sadar Bazar","SHASTRI PARK","SHEIKH SARAI","SHEIKH SARAI PHASE - 1","SHEIKH SARAI PHASE - 2","SHERPUR","SHINGALPUR","SHIV NAGAR","SHIV NAGAR EXTENSION","SHIV PURI","SHIV VIHAR","SHIVA KHAND","SHIVAJI PARK","SHREE NAGAR","SHYAM ENCLAVE","SHYAM NAGAR","SIDHARTHA NAGAR","SIDIPURA","SIDORA KALAN","SIGNAL ENCLAVE","SIKANDERPUR GHOSI","SILAMPUR","SIMAPURI","SINDHORA KALAN","SINDHORA KHURD","SIRASPUR","SIRI FORT","SIRSAPUR VILLAGE","SITAPURI","SITARAM BAZAR","SIVALIK COLONY","SLF VED VIHAR","SOAMI NAGAR NORTH","SOAMI NAGAR SOUTH","SOM BAZAR","SOM VIHAR","SONIA GANDHI JJ CAMP","SOUTH ANARKALI COLONY","SOUTH AVENUE","SOUTH EXTENSION PART - 1","SOUTH EXTENSION PART - 2","SOUTH KANTINAGAR","SOUTH PATEL NAGAR","SOUTHERN RIDGE","SRESHTHA VIHAR","SRI NAGAR GARDEN","SRINIWAS PURI","SRINIWAS PURI EXTENTION","STONE QUARRIES","SUBASH NAGAR","SUBHADRA COLONY","SUBHAS MOHLLA","SUBHASH MOHALLA","SUBHASH NAGAR","SUBHASH PACK (C)","SUBHASH PARK","SUBJI MANDI","SUBJI MANDI GHANTA GHAR","SUBROTO PARK","SUBROTO PARK EXTENSION","SUDARSHAN PARK","SUFDARJANG AERODROME","SUI WALAN","SUJAN SING PARK","SUKH VIHAR","SUKHDEV VIHAR","SUKHRAM PARK","SULTANPUR","SULTANPURI","SUNDAR NAGAR","SUNDARVAN ORCHARDS","SUNDER APT.","SUNDER NAGRI","SUNDER VIHAR","SUNLIGHT COLONY","SUPREME COURT","SURAJA CAMP","SURAJMAL VIHAR","SURYA ENCLAVE","SURYA NAGAR","SURYA NIKETAN","SURYA VIHAR","SWADESHI MARKET","SWASTHYA VIHAR","SWEEPERS COLONY","SYNDICATE ENCLAVE","T - EXTENSION","TAGORE GARDEN","TAGORE PARK","TAHARPUR","TAIMOOR NAGAR","TAJPUR","TAJPUR PAHARI","TALKATORA","TALKATORA GARDEN","TARUN ENCLAVE","TATARPUR","TEACHERS COLONY","TEKHAND","TELE EXCHANG","TELEWARA","TELIBARA","THAN SINGH NAGAR","TIGRI","TIHAR CENTRAL JAIL","TIHAR VILLAGE","TILAK NAGAR","TILAK NAGAR INDUSTRIAL AREA","TILAK PARK","TIMARPUR","TIS HAZARI","TODAPUR VILLAGE","TOKARI WALAN","TOMUR COLONY","TRI NAGAR","TRILOKPURI","TUGHLAKABAD","TUKMIRPUR","TULSI NAGAR","TUNDA NAGAR","TURKMAN GATE","TYAGRAJ NAGAR","U.P. IRRIGATION COLONY","UDAY PARK","UDYOG BHAVAN","UDYOG NAGAR","UNIVERSITY CAMPUS","UNIVERSITY GROUND","UTTAM NAGAR","UTTAM NAGAR (EAST)","UTTARANCHAL COLONY","UTTARI PITAMPURA","UTTRAKHAND","VAISALI","VANDANA VIHAR","VASANT KUNJ","VASANT KUNJ","VASANT LOK","VASANT VIHAR","VASHISHT PARK COLONY","VASUDHA ENCLAVE","VASUNDHARA ENCLAVE","VAYUSENABAD","VEENA ENCLAVE","VIDESH SANCHAR ENCLAVE","VIDHAVA COLONY","VIGYAN BHAVAN","VIGYAN LOK","VIGYAN VIHAR","VIJAY ENCLAVE","VIJAY GHAT","VIJAY NAGAR","VIJAY PARK","VIJAY VIHAR","VIKAS PURI","VIKAS PURI EXTENSION","VIKAS VIHAR","VIKRAM NAGAR","VIKRAM VIHAR","VIKRANT ENCLAVE","VILLAGE BAGDULLA","VILLAGE DASGHARA","VILLAGE KISHANGARH","VILLAGE MADANPUR KHADAR","VILLAGE MASUDPUR","VILLAGE PULPAHLAD","VINOBA PURI","VINOD NAGAR EAST","VINOD NAGAR WEST","VIR BHUMI","VIRSINGH COLONY (BUDHVIHAR PHASE - 2)","VISHAL","VISHAL ENCLAVE","VISHNU GARDEN","VISHWA KARMA COLONY","VISHWAS NAGAR","VISHWASNAGAR EXTENSION","VISWAS PARK","VIVEK VIHAR","VIVEKANAND PURI","W.A.","WANI VIHAR","WARE HOUSUNG SCHEME KIRTI NAGAR","WATER SPORTS COMPLEX","WAZIR PUR COMM CENTRE","WAZIRABAD","WAZIRPUR","WAZIRPUR INDUSTRIAL  AREA","WAZIRPUR INDUSTRIAL AREA","WELCOME SEELAMPUR PHASE - 3","WELCOME SEELAMPUR PHASE - 4","WEST ARJUN NAGAR","WEST AZAD NAGAR","WEST BLOCK","WEST ENCLAVE","WEST END","WEST GHONDA","WEST GORAKH PARK","WEST JYOTI NAGAR","WEST KARAMPURA","WEST MOTI BAGH","WEST MUKHERJEE NAGAR","WEST PARMANAD NAGAR","WEST PATEL NAGAR","WEST PUNJABI BAGH","WEST ROHTASH NAGAR","WILLINGDON CRESCENT","WOODED AREA","YADAV NAGAR","YADAV PARK","YAMUNA BAZAR","YAMUNA RIVER","YAMUNA SPORTS COMPLEX","YAMUNA VIHAR","YOJNA VIHAR","YUSUF SARAI","ZAKIR NAGAR","ZAMRUDPUR VILLAGE"]
	#enumerize :nature, in: ["Nature1", "Nature2", "Nature3", "Nature4"]
	enumerize :category, in: ["category 1", "category 2", "category 3"]
	enumerize :respondent_if_agency, in: ["category1", "category2", "category3", "category4"]

	mount_uploader :file, FileUploader

	has_many :hearings

	before_create do
		self.complaint_number = generate_complaint_number
	end

	def generate_complaint_number
		if(Complaint.last)
			complaint_year = Time.now.year.to_s.last(2).to_i
			complaint_last_year = Complaint.last.complaint_number.scan(/\d/)[0,2].join.to_i
			complaint_month = Time.now.strftime("%m").to_i
			complaint_last_month = Complaint.last.complaint_number.scan(/\d/)[2,2].join.to_i
			if((complaint_year == complaint_last_year) and (complaint_month == complaint_last_month))
				count = Complaint.last.complaint_number.last(5).to_i+1
				str_count = format('%05d',count)
				return Time.now.year.to_s.last(2) + Time.now.strftime("%m").to_s + str_count
			else
				return Time.now.year.to_s.last(2) + Time.now.strftime("%m").to_s + "00001".to_s
			end
		else
			return Time.now.year.to_s.last(2) + Time.now.strftime("%m").to_s + "00001".to_s
		end
	end

	#Convention Rails - For forward to get custom complaint number
	def to_s
		self.complaint_number.to_s + " - " + self.complainant.to_s
	end

	def title
		to_s
	end

	rails_admin do
		list do
			field :complaint_number
			field :complainant
			field :respondent_if_person
			field :respondent_if_agency
			field :contact_number_of_complainant
			field :locality
			#field :nature
			field :category
			field :target_date
			field :registration_date
			field :status
			field :overdue
		end
		show do
			field :complaint_number
			field :complainant
			field :respondent_if_person
			field :respondent_if_agency
			field :contact_number_of_complainant
			field :address
			field :locality
			#field :nature
			field :brief_of_complaint
			field :prayers
			field :file
			field :registration_date
			field :target_date
			field :status
			field :overdue
			field :category
			field :hearings
			field :created_at
			field :updated_at
		end
		edit do
			field :complaint_number do
				default_value do
					bindings[:object].generate_complaint_number
				end
				# To make field uneditable
				html_attributes do
					{
						disabled: true
					}
				end
				#Add help text
				help do
					"Auto Generated, Format is YYMMCCCCC"
				end
			end
			field :complainant do
				help do
					"Enter complainant's name"
				end
			end
			field :respondent_if_person do
				help do
					"Enter if respondent is a person"
				end
			end
			field :respondent_if_agency do
				help do
					"Enter if respondent is an agency"
				end
			end
			field :contact_number_of_complainant do
				help do
					"Enter Complainant's contact number"
				end
			end
			field :address do
				help do
					"Enter Complainant's address"
				end
			end
			field :locality do
				help do
					"Choose Complainant's residential area"
				end
			end
			field :brief_of_complaint do
				help do
					nil
				end
			end
			field :prayers do
				help do
					nil
				end
			end
			field :file do
				help do
					"Upload PDF"
				end
			end
			field :registration_date do
				help do
					nil
				end
			end
			field :target_date do
				help do
					nil
				end
			end
			field :category do
				help do
					"Enter the category of complaint"
				end
			end
		end
	end

	aasm :whiny_transitions => false, column: 'status' do
		state :filed, initial: true
		state :recieved
		state :forwarded_interim
		state :forwarded_final
		state :hearing
		state :closed
		state :disposed

		event :recieve do
			transitions from: :filed, to: :recieved
		end

		event :forward do
			transitions from: :recieved, to: :forwarded_interim
		end

		event :forward_keep do
			transitions from: :forwarded_interim, to: :forwarded_final
		end

		event :internal_hearing do
			transitions from: :recieved, to: :hearing
		end

		event :close do
			transitions from: [:recieved, :forwarded_final, :forwarded_interim, :hearing], to: :closed
		end

		event :dispose do
			transitions from: [:recieved, :forwarded_final, :forwarded_interim, :hearing], to: :disposed
		end
	end
end
