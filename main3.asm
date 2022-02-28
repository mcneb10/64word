// 10 SYS2304

*=$0801

        .byte $0B, $08, $0A, $00, $9E, $32, $33, $30, $34, $00, $00, $00
.label PRINTLN=$AB1E
.label CLRSCRN=$E544
.label CHROUT=$FFD2
.label SCNKEY=$FF9F
.label GETIN=$FFE4
.label RESET=$FCE2
.label ANSHIPTR=$BC
.label ANSLOPTR=$BB
.label CWHIPTR=$FC
.label CWLOPTR=$FB
.label CSHIPTR=$FE
.label CSLOPTR=$FD
*=$0900
MAIN:   	jsr CLRSCRN     // clear the screen
		ldx #$FF
		txs
		lda #10
		sta ANSHIPTR
		lda #0
		sta ANSLOPTR
		sta CWLOPTR
		sta CSLOPTR
		lda #4
		sta CWHIPTR
		lda #1
		sta $289
		lda #$7F
		sta $28A
		lda #$D8
		sta CSHIPTR
        	ldx $D012       // get "random" number (raster line)
FLOOP:  	cpx #0
		beq SF2
		dex
		lda ANSLOPTR
		cmp #$FF
		bne ADDFIVE
		inc ANSHIPTR
		lda #4
		sta ANSLOPTR
		jmp FLOOP
ADDFIVE: 	adc #5 
		sta ANSLOPTR
		jmp FLOOP
SF2:		ldx $A2
FLOOP2: 	cpx #0
		beq SMNEND
		dex
		lda ANSLOPTR
		cmp #$FF
		bne ADDFIVE2
		inc ANSHIPTR
		lda #4
		sta ANSLOPTR
		jmp FLOOP2
ADDFIVE2: 	adc #5 
		sta ANSLOPTR
		jmp FLOOP2
SMNEND: 	lda ANSLOPTR	//
		sta $BB		//
		lda ANSHIPTR	//
		sta $BC		//
INPLOOP:	lda $CB
		cmp #$40
		beq INPLOOP
		jsr SCNKEY
		jsr GETIN
		cmp $0D
		beq INPLOOP
nnl:		inc CHARC
		ldx CHARC
		cpx #5
		bne oc
		jsr CHROUT
		ldx #0
		stx CHARC
		lda #$0D
		jsr CHROUT
		inc NLC
		lda NLC
		cmp #6
		beq GO
		jmp INPLOOP
oc:		jsr CHROUT
		jmp INPLOOP
GO:		jsr CLRSCRN
		lda #<GAMEOVER
		ldy #>GAMEOVER
		jsr PRINTLN
GOIL:		jsr SCNKEY
		jsr GETIN
		cmp #$52
		beq restart
		cmp #$45
		bne GOIL
		jsr RESET
restart:	lda #$10
		sta ANSHIPTR
		lda #0
		sta ANSLOPTR
		sta CHARC
		sta NLC
		sta $BB
		sta $BC
		jmp MAIN
highlight:	ldx NLC
l2ml:		cpx #1
		beq l2md
		lda CWLOPTR
		adc #40
		sta CWLOPTR
		dex
		jmp l2ml
l2md:		ldx #0
cmploop:	cpx #4
		beq done
		lda (CWLOPTR,X)
		cmp (ANSLOPTR,X)
		bne nextcol
		lda #5
		sta (CSLOPTR,X)
endcmp:		inx
		jmp cmploop
nextcol:	txa
		pha
		ldx #0
yloop:		cpx #4
		bne ylc
		lda TEMP+1
		cmp #0
		bne cmploop
ylc:		lda (ANSLOPTR,X)
		cmp (CWLOPTR,X)
		beq nexty
		txa
		tay
		pla
		tax
		lda #7
		sta (CSLOPTR,X)
		txa
		pha
		tya
		tax
		inc TEMP+1
nexty:		inx
		jmp yloop
grey:		pla
		tax
		lda #12
		sta (CSLOPTR,X)
		jmp endcmp
done:		rts

CHARC: .byte $0
NLC: .byte $0
TEMP: .byte $0, $0
GAMEOVER: .text "game over! press r to restart or press e to exit"
.byte $0D
.byte $0
*=$1000
answers:
        .text "abackabaftabaseabashabateabbeyabbotabhorabideablerabodeabortaboutaboveabuseachedacornacridactedactoracuteadageadaptaddedadderadeptadieuadmitadmixadobeadoptadoreadornadultaffixafireafootaforeafoulafteragainagapeagateagentagileagingaglowagonyagreeaheadaidedaimedaimerairedaireraislealarmalbumalderalertalgaealibialienalignalikealivealkylallayalleyallotallowalloyaloftalohaalonealongaloofaloudalphaaltaralteramainamazeamberambleamendamideamigoaminoamityamongamourampleamplyamuseangelangerangleangryangstanionaniseankleannalannexannoyannulannumanodeanticanvilaortaapaceapartaphidapingapishappleapplyapronaptlyarborarcedardorarenaargonargotarguearisearmedarmerarmoraromaarosearrayarrowarsonascotashenasideaskedaskeraskewaspenaspicassayassetasteratollatoneatticaudioauditaugeraughtaugurauralavailavantavertavianavoidawaitawakeawardawareawashawfulawokeaxialaxingaxiomazurebaconbadgebadlybagelbaggybakedbakerbalerbalkybalmybalsabanalbandybanjobaredbarerbargebaronbasalbasedbaserbasicbasilbasinbastebatchbathebatonbawdybayedbayoubeachbeadybeardbeastbeechbeefybefitbefogbeganbegetbeginbegotbegunbeigebeingbelaybelchbeliebellebellybelowbenchberetberneberryberthberylbesetbetelbevelbicepbiddybightbigotbilgebingebingobiotabipedbirchbirthbisonbitchbiterblackbladeblameblandblankblareblaseblastblazebleakblearbleatbleedblendblimpblindblinkblitzbloatblockblokeblondbloodbloomblownbluerbluffbluntblurbblurtblushboardboastbobbybonedbonerbonnyboobyboostboothbootyboozeboraxboredborerboricborneboronbosombosunbotchboughboundbowedbowelbowerboxedboxerbracebraidbrainbrakebrandbrashbravebravobrawlbrawnbrazebreadbreakbreedbrevebriarbribebrickbridebriefbrierbrinebringbrinkbrinybriskbroadbroilbrokebroodbrookbroombrothbrownbruntbrushbrutebuddybudgebuggybuglebuildbuiltbulgebulkybullybunchbunnyburlyburntbursaburstbusedbushybuttebutylbuxombuyerbuzzybylawbywaycabalcabincablecachecacticagedcagercairncakedcalvecamelcanalcandycanercannycanoecanoncantocapercaredcaretcargocarolcarrycarvecasedcastecatchcatercaulkcausecavedcavilceasecedarcededchafechaffchainchairchalkchantcharmchartchasechasmcheapcheatcheckcheekcheerchestchickchidechiefchildchilichillchimechinkchirpchockchoirchokechordchorechosechuckchunkchurnchutecidercigarciliacircacitedcivetciviccivilclaimclampclangclankclashclaspcleanclearcleftclerkclickcliffclimbclimeclingclinkcloakclockclonecloseclothcloudcloutcloveclowncluckclumpclungcoachcoastcobracockycocoacodedcodercoloncolorcomercometcomiccommaconiccookycopedcopracopsecoralcoredcorercornycouchcoughcouldcountcourtcovercovetcowedcowercoypucrackcraftcrampcranecrankcrashcratecravecrawlcrazecrazycreakcreamcreedcreekcreepcrepecreptcrestcriedcriercrimecrispcroakcrockcroftcrookcrowdcrowncrudecruelcrumbcrushcrustcryptcubedcubicculpacuredcurlycurrycursecurvecyclecynicdaddydailydairydaisydancedandydareddarerdateddaterdatumdauntdazeddealtdeathdebardebitdebugdecaldecaydecoydeferdeifydeigndeitydelaydeltadelvedemondemurdensedepotdepthderbydeterdeucedevildiarydickydigitdildodimlydineddinerdingodingydiodedirgedirtyditchdittodittydivandiveddiverdizzydodgedogmadoingdoleddollydomeddonordopeddoperdoseddoteddoubtdoughdoverdoweldownydowrydozeddozendraftdraindrakedramadrankdrapedrawldrawndreaddreamdrieddrierdriftdrilldrilydrinkdrivedrolldronedrooldroopdrovedrowndrunkdrylyduchydullydummydunceduskydustydwarfdwelldweltdyingeagereagleearedearlyeartheasedeaseleateneaterebonyedgededicteerieeggedeightejectelbowelderelectelegyelideeliteelopeeludeembedemberemptyenactendedenderendowenemaenemyenjoyennuiensueenterentryenvoyepochequalequiperaseerecterodeerrederroreruptessayetherethicevadeeventeveryevictevokeexactexaltexcelexertexileexistexpelextolextraexulteyingfablefacedfacetfactofadedfaderfaintfairyfaithfakedfakerfalsefamedfancyfaradfarcefaredfatalfatedfattyfaultfaunafavorfeastfeignfelonfemurfenceferryfetalfetchfetidfeverfewerfiberfieldfiendfieryfifthfiftyfightfiledfilerfillyfilthfinalfinedfinerfinnyfiredfirerfirstfishyfitlyfixedfixerflackflailflairflakeflakyflameflankflareflashflaskfleetfleshflickflierflingflintflirtfloatflockfloodfloorfloraflourflownflufffluidflukeflungflushfluteflyerfoamyfocalfoggyfoistfollyforayforceforgefortefortyforumfoundfountfrailframefrancfrankfraudfreakfreedfreerfreonfreshfriarfriedfrillfriskfrockfrontfrostfrothfrownfrozefruitfudgefuguefullyfumedfungifunnyfurryfusedfussyfuzzygablegailygamedgammagapedgassygatedgatorgaudygaugegauntgauzegavelgawkygayergaylygazedgazergeckogeesegeniegenreghostgiantgiddygirthgivengivergladeglandglareglazegleamgleanglideglintgloatglobegloomgloryglovegluedgnashgnomegodlygoinggollygonergoodygoofygoosegorgegougegourdgracegradegraftgrailgraingrandgrantgrapegraphgraspgrategravegravygrazegreatgreedgreengreetgriefgrillgrimegrindgripegristgroangroingroomgropegroupgrovegrowlgrowngruffgruntguanoguardguestguideguildguileguiltguisegulchgullygunnygustogustygutsyguyedguyergypsyhabithairyhalerhalvehandyhaplyhappyhardyharemharryharshhastehastyhatchhatedhaterhaunthavenhavochazelheardheartheathheaveheavyhedgeheftyhelixhellohenceheronhertzhewedhewerhikedhikerhingehippohiredhirerhitchhoardhoaryhobbyhoistholedhollyhomedhomerhonedhonerhoneyhonorhopedhordehornyhorsehotelhotlyhoundhousehovelhoverhumanhumidhumorhunchhurryhuskyhutchhydrahydrohyenahymenhypericingidealidiomidiotidledidleriglooimageimpelimplyinaneincurindexineptinertinferinfixinfraingotinkedinkerinlayinletinnerinputinsetinterirateirkedironyisletissueivoryjadedjauntjazzyjellyjennyjerkyjeweljiffyjointjokedjokerjollyjoulejoustjudgejuicejuicyjumbojumpyjunkyjuntajurorkanjikappakeyedkinkykioskkitedkittyknackknavekneadkneedkneelknellkneltknifeknockknollknownkoalalabellaborlacedladenladlelagerlamedlancelapellapselargelarvalaserlassolatchlaterlathelaughlayerlazedleafyleakyleaptlearnleaseleashleastleaveledgeleechleerylegallemmalemonleperleveelevelleverlibelliegeliferlightlikedlikenlilaclimbolimitlinedlinenlinerlingoliterlithelivedliverlividloathlobbylocallodgeloftylogicloginlonerlooselorryloserlossylouselousylovedloverlowerlowlyloyallucidluckylumpylunarlunchlurchluredlustylyinglymphlynchlyricmacedmachomacromadammadlymagicmagnamaizemajormakermammamaniamanicmanlymanormaplemarchmarrymarshmasonmatchmatedmatermaximmaybemayormealymeantmeatymedalmediamedicmelonmercymergemeritmerrymesonmessymetalmetedmetermetromewedmicromidstmightmilkymimicminceminedminerminormiredmirthmisermistymitermixedmixermixupmodalmodelmodemmoistmolarmommymoneymonthmoodymoosemopedmoralmoronmossy"

// vim: filetype=kickass

