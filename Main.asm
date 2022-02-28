; 10 SYS2304

*=$0801

        BYTE    $0B, $08, $0A, $00, $9E, $32, $33, $30, $34, $00, $00, $00
PRINTLN=$AB1E
CLRSCRN=$E544
CHROUT=$FFD2
*=$0900
MAIN    jsr CLRSCRN     ; clear the screen
        lda $D012       ; get "random" number (raster line)
        cmp #$3F        ;
        bmi SMALL       ;
        cmp #$7E        ;
        bmi MED         ;
        cmp #$BD        ;
        bmi BIG         ;
        cmp #$FC        ;
        bmi VERYBIG     ;
        ldx #$14        ;
        stx ANSHIPTR    ;
SMALL   jmp DETLO       ; do nothing
MED     ldx #$11        ;
        stx ANSHIPTR    ;
        jmp DETLO       ;
BIG     ldx #$12        ;
        stx ANSHIPTR    ;
        jmp DETLO       ;
VERYBIG ldx #$13        ;
        stx ANSHIPTR    ;
DETLO   cmp #$32        ;
        bmi SMALNUM     ;
        lda #$32        ;
SMALNUM cmp #$0         ;
        beq SMNEND      ;
        tax             ;
        dex             ;
        txa             ;
        inc ANSLOPTR    ;
        inc ANSLOPTR    ;
        inc ANSLOPTR    ;
        inc ANSLOPTR    ;
        inc ANSLOPTR    ;    
        jmp SMALNUM     ;
        ldy #$0         ;
SMNEND  lda (ANSHIPTR),Y;
        jsr CHROUT      ;
DEND    jmp DEND        ;
ANSHIPTR BYTE $10
ANSLOPTR BYTE $0
NUMTEMP BYTE $0
*=$1000
answers
        TEXT "abackabaftabaseabashabateabbeyabbotabhorabideablerabodeabortaboutaboveabuseachedacornacridactedactoracuteadageadaptaddedadderadeptadieuadmitadmixadobeadoptadoreadornadultaffixafireafootaforeafoulafteragainagapeagateagentagileagingaglowagonyagreeaheadaidedaimedaimerairedaireraislealarmalbumalderalertalgaealibialienalignalikealivealkylallayalleyallotallowalloyaloftalohaalonealongaloofaloudalphaaltaralteramainamazeamberambleamendamideamigoaminoamityamongamourampleamplyamuseangelangerangleangryangstanionaniseankleannalannexannoyannulannumanodeanticanvilaortaapaceapartaphidapingapishappleapplyapronaptlyarborarcedardorarenaargonargotarguearisearmedarmerarmoraromaarosearrayarrowarsonascotashenasideaskedaskeraskewaspenaspicassayassetasteratollatoneatticaudioauditaugeraughtaugurauralavailavantavertavianavoidawaitawakeawardawareawashawfulawokeaxialaxingaxiomazurebaconbadgebadlybagelbaggybakedbakerbalerbalkybalmybalsabanalbandybanjobaredbarerbargebaronbasalbasedbaserbasicbasilbasinbastebatchbathebatonbawdybayedbayoubeachbeadybeardbeastbeechbeefybefitbefogbeganbegetbeginbegotbegunbeigebeingbelaybelchbeliebellebellybelowbenchberetberneberryberthberylbesetbetelbevelbicepbiddybightbigotbilgebingebingobiotabipedbirchbirthbisonbitchbiterblackbladeblameblandblankblareblaseblastblazebleakblearbleatbleedblendblimpblindblinkblitzbloatblockblokeblondbloodbloomblownbluerbluffbluntblurbblurtblushboardboastbobbybonedbonerbonnyboobyboostboothbootyboozeboraxboredborerboricborneboronbosombosunbotchboughboundbowedbowelbowerboxedboxerbracebraidbrainbrakebrandbrashbravebravobrawlbrawnbrazebreadbreakbreedbrevebriarbribebrickbridebriefbrierbrinebringbrinkbrinybriskbroadbroilbrokebroodbrookbroombrothbrownbruntbrushbrutebuddybudgebuggybuglebuildbuiltbulgebulkybullybunchbunnyburlyburntbursaburstbusedbushybuttebutylbuxombuyerbuzzybylawbywaycabalcabincablecachecacticagedcagercairncakedcalvecamelcanalcandycanercannycanoecanoncantocapercaredcaretcargocarolcarrycarvecasedcastecatchcatercaulkcausecavedcavilceasecedarcededchafechaffchainchairchalkchantcharmchartchasechasmcheapcheatcheckcheekcheerchestchickchidechiefchildchilichillchimechinkchirpchockchoirchokechordchorechosechuckchunkchurnchutecidercigarciliacircacitedcivetciviccivilclaimclampclangclankclashclaspcleanclearcleftclerkclickcliffclimbclimeclingclinkcloakclockclonecloseclothcloudcloutcloveclowncluckclumpclungcoachcoastcobracockycocoacodedcodercoloncolorcomercometcomiccommaconiccookycopedcopracopsecoralcoredcorercornycouchcoughcouldcountcourtcovercovetcowedcowercoypucrackcraftcrampcranecrankcrashcratecravecrawlcrazecrazycreakcreamcreedcreekcreepcrepecreptcrestcriedcriercrimecrispcroakcrockcroftcrookcrowdcrowncrudecruelcrumbcrushcrustcryptcubedcubicculpacuredcurlycurrycursecurvecyclecynicdaddydailydairydaisydancedandydareddarerdateddaterdatumdauntdazeddealtdeathdebardebitdebugdecaldecaydecoydeferdeifydeigndeitydelaydeltadelvedemondemurdensedepotdepthderbydeterdeucedevildiarydickydigitdildodimlydineddinerdingodingydiodedirgedirtyditchdittodittydivandiveddiverdizzydodgedogmadoingdoleddollydomeddonordopeddoperdoseddoteddoubtdoughdoverdoweldownydowrydozeddozendraftdraindrakedramadrankdrapedrawldrawndreaddreamdrieddrierdriftdrilldrilydrinkdrivedrolldronedrooldroopdrovedrowndrunkdrylyduchydullydummydunceduskydustydwarfdwelldweltdyingeagereagleearedearlyeartheasedeaseleateneaterebonyedgededicteerieeggedeightejectelbowelderelectelegyelideeliteelopeeludeembedemberemptyenactendedenderendowenemaenemyenjoyennuiensueenterentryenvoyepochequalequiperaseerecterodeerrederroreruptessayetherethicevadeeventeveryevictevokeexactexaltexcelexertexileexistexpelextolextraexulteyingfablefacedfacetfactofadedfaderfaintfairyfaithfakedfakerfalsefamedfancyfaradfarcefaredfatalfatedfattyfaultfaunafavorfeastfeignfelonfemurfenceferryfetalfetchfetidfeverfewerfiberfieldfiendfieryfifthfiftyfightfiledfilerfillyfilthfinalfinedfinerfinnyfiredfirerfirstfishyfitlyfixedfixerflackflailflairflakeflakyflameflankflareflashflaskfleetfleshflickflierflingflintflirtfloatflockfloodfloorfloraflourflownflufffluidflukeflungflushfluteflyerfoamyfocalfoggyfoistfollyforayforceforgefortefortyforumfoundfountfrailframefrancfrankfraudfreakfreedfreerfreonfreshfriarfriedfrillfriskfrockfrontfrostfrothfrownfrozefruitfudgefuguefullyfumedfungifunnyfurryfusedfussyfuzzygablegailygamedgammagapedgassygatedgatorgaudygaugegauntgauzegavelgawkygayergaylygazedgazergeckogeesegeniegenreghostgiantgiddygirthgivengivergladeglandglareglazegleamgleanglideglintgloatglobegloomgloryglovegluedgnashgnomegodlygoinggollygonergoodygoofygoosegorgegougegourdgracegradegraftgrailgraingrandgrantgrapegraphgraspgrategravegravygrazegreatgreedgreengreetgriefgrillgrimegrindgripegristgroangroingroomgropegroupgrovegrowlgrowngruffgruntguanoguardguestguideguildguileguiltguisegulchgullygunnygustogustygutsyguyedguyergypsyhabithairyhalerhalvehandyhaplyhappyhardyharemharryharshhastehastyhatchhatedhaterhaunthavenhavochazelheardheartheathheaveheavyhedgeheftyhelixhellohenceheronhertzhewedhewerhikedhikerhingehippohiredhirerhitchhoardhoaryhobbyhoistholedhollyhomedhomerhonedhonerhoneyhonorhopedhordehornyhorsehotelhotlyhoundhousehovelhoverhumanhumidhumorhunchhurryhuskyhutchhydrahydrohyenahymenhypericingidealidiomidiotidledidleriglooimageimpelimplyinaneincurindexineptinertinferinfixinfraingotinkedinkerinlayinletinnerinputinsetinterirateirkedironyisletissueivoryjadedjauntjazzyjellyjennyjerkyjeweljiffyjointjokedjokerjollyjoulejoustjudgejuicejuicyjumbojumpyjunkyjuntajurorkanjikappakeyedkinkykioskkitedkittyknackknavekneadkneedkneelknellkneltknifeknockknollknownkoalalabellaborlacedladenladlelagerlamedlancelapellapselargelarvalaserlassolatchlaterlathelaughlayerlazedleafyleakyleaptlearnleaseleashleastleaveledgeleechleerylegallemmalemonleperleveelevelleverlibelliegeliferlightlikedlikenlilaclimbolimitlinedlinenlinerlingoliterlithelivedliverlividloathlobbylocallodgeloftylogicloginlonerlooselorryloserlossylouselousylovedloverlowerlowlyloyallucidluckylumpylunarlunchlurchluredlustylyinglymphlynchlyricmacedmachomacromadammadlymagicmagnamaizemajormakermammamaniamanicmanlymanormaplemarchmarrymarshmasonmatchmatedmatermaximmaybemayormealymeantmeatymedalmediamedicmelonmercymergemeritmerrymesonmessymetalmetedmetermetromewedmicromidstmightmilkymimicminceminedminerminormiredmirthmisermistymitermixedmixermixupmodalmodelmodemmoistmolarmommymoneymonthmoodymoosemopedmoralmoronmossy"