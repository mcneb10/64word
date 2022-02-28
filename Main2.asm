// 10 SYS2304

*=$0801

        .byte $0B, $08, $0A, $00, $9E, $32, $33, $30, $34, $00, $00, $00
.label PRINTLN=$AB1E
.label CLRSCRN=$E544
.label CHROUT=$FFD2
*=$0900
MAIN:   jsr CLRSCRN     // clear the screen
        lda $D012       // get "random" number (raster line)
        cmp #$3F        // next couple of statements check size of number
        bmi SMALL       // and go to specific label
        cmp #$7E        //
        bmi MED         //
        cmp #$BD        //
        bmi BIG         //
        cmp #$FC        //
        bmi VERYBIG     //
        ldx #$14        // very large set hi address to 20
        stx ANSHIPTR    //
SMALL:  jmp DETLO       // do nothing
MED:    ldx #$11        // set hi address to 17
        stx ANSHIPTR    //
        jmp DETLO       //
BIG:    ldx #$12        // set hi address to 18
        stx ANSHIPTR    //
        jmp DETLO       //
VERYBIG: ldx #$13       // set hi address to 19
        stx ANSHIPTR    //
DETLO:  tax				//a = x
		cpx #$32        // if x < 50
        bmi SMALNUM     // go to small number label
        ldx #$32        // otherwise x = 50
SMALNUM: cpx #$0        // if x = 0
        beq SMNEND      // go to next label
        dex             // otherwise x-1
		adc #5			// add 5
        jmp SMALNUM     // loop
SMNEND: lda ANSLOPTR	//
		sta $BB			//
		lda ANSHIPTR	//
		sta $BC			//
		ldy #$0			//
		lda ($BB),Y		//
		sta $0400		//
		inc $BB			//
		lda ($BB),Y		//
		sta $0401		//
		inc $BB			//
		lda ($BB),Y		//
		sta $0402		//
		inc $BB			//
		lda ($BB),Y		//
		sta $0403		//
		inc $BB			//
		lda ($BB),Y		//
		sta $0404		//
		inc $BB			//
DEND:   jmp DEND        //
ANSHIPTR: .byte $10
ANSLOPTR: .byte $0
NUMTEMP: .byte $0
*=$1000
answers:
        .text "abackabaftabaseabashabateabbeyabbotabhorabideablerabodeabortaboutaboveabuseachedacornacridactedactoracuteadageadaptaddedadderadeptadieuadmitadmixadobeadoptadoreadornadultaffixafireafootaforeafoulafteragainagapeagateagentagileagingaglowagonyagreeaheadaidedaimedaimerairedaireraislealarmalbumalderalertalgaealibialienalignalikealivealkylallayalleyallotallowalloyaloftalohaalonealongaloofaloudalphaaltaralteramainamazeamberambleamendamideamigoaminoamityamongamourampleamplyamuseangelangerangleangryangstanionaniseankleannalannexannoyannulannumanodeanticanvilaortaapaceapartaphidapingapishappleapplyapronaptlyarborarcedardorarenaargonargotarguearisearmedarmerarmoraromaarosearrayarrowarsonascotashenasideaskedaskeraskewaspenaspicassayassetasteratollatoneatticaudioauditaugeraughtaugurauralavailavantavertavianavoidawaitawakeawardawareawashawfulawokeaxialaxingaxiomazurebaconbadgebadlybagelbaggybakedbakerbalerbalkybalmybalsabanalbandybanjobaredbarerbargebaronbasalbasedbaserbasicbasilbasinbastebatchbathebatonbawdybayedbayoubeachbeadybeardbeastbeechbeefybefitbefogbeganbegetbeginbegotbegunbeigebeingbelaybelchbeliebellebellybelowbenchberetberneberryberthberylbesetbetelbevelbicepbiddybightbigotbilgebingebingobiotabipedbirchbirthbisonbitchbiterblackbladeblameblandblankblareblaseblastblazebleakblearbleatbleedblendblimpblindblinkblitzbloatblockblokeblondbloodbloomblownbluerbluffbluntblurbblurtblushboardboastbobbybonedbonerbonnyboobyboostboothbootyboozeboraxboredborerboricborneboronbosombosunbotchboughboundbowedbowelbowerboxedboxerbracebraidbrainbrakebrandbrashbravebravobrawlbrawnbrazebreadbreakbreedbrevebriarbribebrickbridebriefbrierbrinebringbrinkbrinybriskbroadbroilbrokebroodbrookbroombrothbrownbruntbrushbrutebuddybudgebuggybuglebuildbuiltbulgebulkybullybunchbunnyburlyburntbursaburstbusedbushybuttebutylbuxombuyerbuzzybylawbywaycabalcabincablecachecacticagedcagercairncakedcalvecamelcanalcandycanercannycanoecanoncantocapercaredcaretcargocarolcarrycarvecasedcastecatchcatercaulkcausecavedcavilceasecedarcededchafechaffchainchairchalkchantcharmchartchasechasmcheapcheatcheckcheekcheerchestchickchidechiefchildchilichillchimechinkchirpchockchoirchokechordchorechosechuckchunkchurnchutecidercigarciliacircacitedcivetciviccivilclaimclampclangclankclashclaspcleanclearcleftclerkclickcliffclimbclimeclingclinkcloakclockclonecloseclothcloudcloutcloveclowncluckclumpclungcoachcoastcobracockycocoacodedcodercoloncolorcomercometcomiccommaconiccookycopedcopracopsecoralcoredcorercornycouchcoughcouldcountcourtcovercovetcowedcowercoypucrackcraftcrampcranecrankcrashcratecravecrawlcrazecrazycreakcreamcreedcreekcreepcrepecreptcrestcriedcriercrimecrispcroakcrockcroftcrookcrowdcrowncrudecruelcrumbcrushcrustcryptcubedcubicculpacuredcurlycurrycursecurvecyclecynicdaddydailydairydaisydancedandydareddarerdateddaterdatumdauntdazeddealtdeathdebardebitdebugdecaldecaydecoydeferdeifydeigndeitydelaydeltadelvedemondemurdensedepotdepthderbydeterdeucedevildiarydickydigitdildodimlydineddinerdingodingydiodedirgedirtyditchdittodittydivandiveddiverdizzydodgedogmadoingdoleddollydomeddonordopeddoperdoseddoteddoubtdoughdoverdoweldownydowrydozeddozendraftdraindrakedramadrankdrapedrawldrawndreaddreamdrieddrierdriftdrilldrilydrinkdrivedrolldronedrooldroopdrovedrowndrunkdrylyduchydullydummydunceduskydustydwarfdwelldweltdyingeagereagleearedearlyeartheasedeaseleateneaterebonyedgededicteerieeggedeightejectelbowelderelectelegyelideeliteelopeeludeembedemberemptyenactendedenderendowenemaenemyenjoyennuiensueenterentryenvoyepochequalequiperaseerecterodeerrederroreruptessayetherethicevadeeventeveryevictevokeexactexaltexcelexertexileexistexpelextolextraexulteyingfablefacedfacetfactofadedfaderfaintfairyfaithfakedfakerfalsefamedfancyfaradfarcefaredfatalfatedfattyfaultfaunafavorfeastfeignfelonfemurfenceferryfetalfetchfetidfeverfewerfiberfieldfiendfieryfifthfiftyfightfiledfilerfillyfilthfinalfinedfinerfinnyfiredfirerfirstfishyfitlyfixedfixerflackflailflairflakeflakyflameflankflareflashflaskfleetfleshflickflierflingflintflirtfloatflockfloodfloorfloraflourflownflufffluidflukeflungflushfluteflyerfoamyfocalfoggyfoistfollyforayforceforgefortefortyforumfoundfountfrailframefrancfrankfraudfreakfreedfreerfreonfreshfriarfriedfrillfriskfrockfrontfrostfrothfrownfrozefruitfudgefuguefullyfumedfungifunnyfurryfusedfussyfuzzygablegailygamedgammagapedgassygatedgatorgaudygaugegauntgauzegavelgawkygayergaylygazedgazergeckogeesegeniegenreghostgiantgiddygirthgivengivergladeglandglareglazegleamgleanglideglintgloatglobegloomgloryglovegluedgnashgnomegodlygoinggollygonergoodygoofygoosegorgegougegourdgracegradegraftgrailgraingrandgrantgrapegraphgraspgrategravegravygrazegreatgreedgreengreetgriefgrillgrimegrindgripegristgroangroingroomgropegroupgrovegrowlgrowngruffgruntguanoguardguestguideguildguileguiltguisegulchgullygunnygustogustygutsyguyedguyergypsyhabithairyhalerhalvehandyhaplyhappyhardyharemharryharshhastehastyhatchhatedhaterhaunthavenhavochazelheardheartheathheaveheavyhedgeheftyhelixhellohenceheronhertzhewedhewerhikedhikerhingehippohiredhirerhitchhoardhoaryhobbyhoistholedhollyhomedhomerhonedhonerhoneyhonorhopedhordehornyhorsehotelhotlyhoundhousehovelhoverhumanhumidhumorhunchhurryhuskyhutchhydrahydrohyenahymenhypericingidealidiomidiotidledidleriglooimageimpelimplyinaneincurindexineptinertinferinfixinfraingotinkedinkerinlayinletinnerinputinsetinterirateirkedironyisletissueivoryjadedjauntjazzyjellyjennyjerkyjeweljiffyjointjokedjokerjollyjoulejoustjudgejuicejuicyjumbojumpyjunkyjuntajurorkanjikappakeyedkinkykioskkitedkittyknackknavekneadkneedkneelknellkneltknifeknockknollknownkoalalabellaborlacedladenladlelagerlamedlancelapellapselargelarvalaserlassolatchlaterlathelaughlayerlazedleafyleakyleaptlearnleaseleashleastleaveledgeleechleerylegallemmalemonleperleveelevelleverlibelliegeliferlightlikedlikenlilaclimbolimitlinedlinenlinerlingoliterlithelivedliverlividloathlobbylocallodgeloftylogicloginlonerlooselorryloserlossylouselousylovedloverlowerlowlyloyallucidluckylumpylunarlunchlurchluredlustylyinglymphlynchlyricmacedmachomacromadammadlymagicmagnamaizemajormakermammamaniamanicmanlymanormaplemarchmarrymarshmasonmatchmatedmatermaximmaybemayormealymeantmeatymedalmediamedicmelonmercymergemeritmerrymesonmessymetalmetedmetermetromewedmicromidstmightmilkymimicminceminedminerminormiredmirthmisermistymitermixedmixermixupmodalmodelmodemmoistmolarmommymoneymonthmoodymoosemopedmoralmoronmossy"


