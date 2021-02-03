** HEADER -----------------------------------------------------
**  DO-FILE METADATA
    //  algorithm name			data_sharing_yale_001.do
    //  project:				Analysis of YALE data sharing survey
    //  analysts:				Ian HAMBLETON
    // 	date last modified	    20-Jan-2021
    //  algorithm task			

    ** General algorithm set-up
    version 16
    clear all
    macro drop _all
    set more 1
    set linesize 80

    ** Set working directories: this is for DATASET and LOGFILE import and export
    ** DATASETS to encrypted SharePoint folder
    local datapath "X:\The University of the West Indies\DataGroup - repo_data\data_p138"
    ** LOGFILES to unencrypted OneDrive folder
    local logpath "X:\OneDrive - The University of the West Indies\repo_datagroup\repo_p138"

    ** Close any open log fileand open a new log file
    capture log close
    cap log using "`logpath'\data_sharing_yale_001", replace
** HEADER -----------------------------------------------------

** Use the joint dataset
use "`datapath'\version01\2-working\joint_datasharing_001", clear 

** Add unique ID
gen rid = _n 
label var rid "Record ID" 

** NEW 21-Jan-2021
** Organizational split into Academic and Non-academic participants for report 
tab organization dataset 
tab organization dataset , nofreq col
gen group = .
replace group = 1 if organization == 1
replace group = 2 if organization > 1
label define group_ 1 "academic" 2 "not academic"
label values group group_
drop if group==.
tab group dataset 
tab group dataset , nofreq col

** ------------------------------------
** Basic demographics 
** ------------------------------------
* gender 
tab gender group
tab gender group , nofreq col
* age group 
tab age_group group 
tab age_group group , nofreq col

** ------------------------------------
** Data sharing Practices 
** Preparation
** ------------------------------------
** These run from ALWAYS to NEVER 
** So will be inappropriately labelled 
** Just want the average score though for Table 1 
rename ds_01a ds_30 
rename ds_01b ds_31 
rename ds_01c ds_32 
rename ds_01d ds_33 
rename ds_01e ds_34 
rename ds_01f ds_35 
rename ds_01g ds_36 
rename ds_01h ds_37 
order ds_30 ds_31 ds_32 ds_33 ds_34 ds_35 ds_36 ds_37, after(ds_29) 

** ------------------------------------
** Hierarchy of concerns
** in data sharing
** 1 = time needed
** 2 = funds needed
** 3 = data confidentiality
** 4 = permission from employers
** 5 = concern about data misuse
** ------------------------------------
preserve
    rename dahp_know01 k1
    rename dahp_know02 k2
    rename dahp_know03 k3
    rename dahp_know04 k4
    rename dahp_know06 k5
    gen a = 1 
    collapse (mean) k1 k2 k3 k4 k5, by(a)
    reshape long k, i(a) j(q)
    label define k_ 1 "time" 2 "funds" 3 "confid" 4 "permission" 5 "misuse"
    label values q k_
    egen kmax = max(k)
    gen score = (k/kmax)*100
    sort k
restore


** ------------------------------------
** Data Sharing Attitudes
** Preparation
** ------------------------------------
keep dataset group rid  ds_02 - ds_37
forval x = 2(1)9 {
    rename ds_0`x' ds_`x' 
}
forval x = 2(1)37 {
    replace ds_`x' = 6 if ds_`x'==. 
    label define extra 1 "Strongly agree" 2 "Agree" 3 "Neither agree nor disagree" 4 "Disagree" 5 "Strongly disagree" 6 "not answered", modify  
    label values ds_`x' extra 
}

reshape long ds_, i(group rid) j(question)
gen attitude = 1 
collapse (count) attitude, by(group question ds_)
fillin group question ds_
replace attitude = 0 if attitude==.
drop _fillin
drop if ds_ == 6

** ATTITUDE SCORES BY PARTICIPANT GROUP 
** Academic and non-academic
preserve
    ** Score for each question 
    gen score = ds_ * attitude 
    bysort group question: egen tscore = sum(score)
    bysort group question: egen total = sum(attitude)
    gen fscore = tscore/total 
    collapse (mean) final_score = fscore, by(group question) 

    rename final_score score
    reshape wide score , i(question) j(group)
    rename score1 s_acad
    rename score2 s_nonacad
    gen y = 1 

    ** Color scheme from : colorbrewer.org
    ** NINE-level color gradient 
    ** from RED
    ** 165 0 38
    ** 215 48 39
    ** 244 109 67
    ** 253 174 97
    ** 254 224 139
    ** 217 239 139
    ** 166 217 106
    ** 102 189 99
    ** 26 152 80
    ** 0 104 55
    ** to GREEN

    ** The thin color strips are created by a long-thin scatter graph
    ** These new vector constants define the color breakpoints
    gen EY1 = 1
    gen EX1 = 0
    gen EX2 = 0.55
    gen EX3 = 1.11
    gen EX4 = 1.66
    gen EX5 = 2.22
    gen EX6 = 2.77
    gen EX7 = 3.33
    gen EX8 = 3.88
    gen EX9 = 4.44
    gen EX10 = 5

    ** Following questionnaire design - reverse the following questions
    gen s_acad_rev = s_acad
    gen s_nonacad_rev = s_nonacad
    local questions = "4 8 10 12 13 14 15 21 24 26 27 28 30 31 32 33 34 35 36 37"
    foreach x of numlist `questions' {
            replace s_acad_rev = 5 - s_acad if question==`x'
            replace s_nonacad_rev = 5 - s_nonacad if question==`x'
    }
    ** TABLE OF SCORES BY GROUP
    format s_acad_rev %9.1f 
    format s_nonacad_rev %9.1f
    list question s_acad_rev s_nonacad_rev

    ** 29 charts - 1 for each question
    forval x = 2(1)29 {
        #delimit ;
        gr twoway
            (sc EY EX1 if question==2,  msize(125) m(s) mlc(gs10) mfc("165 0 38") mlw(none))
            (sc EY EX2 if question==2,  msize(125) m(s) mlc(gs10) mfc("215 48 39") mlw(none))
            (sc EY EX3 if question==2,  msize(125) m(s) mlc(gs10) mfc("244 109 67") mlw(none))
            (sc EY EX4 if question==2,  msize(125) m(s) mlc(gs10) mfc("253 174 97") mlw(none))
            (sc EY EX5 if question==2,  msize(125) m(s) mlc(gs10) mfc("254 224 139") mlw(none))
            (sc EY EX6 if question==2,  msize(125) m(s) mlc(gs10) mfc("217 239 139") mlw(none))
            (sc EY EX7 if question==2,  msize(125) m(s) mlc(gs10) mfc("166 217 106") mlw(none))
            (sc EY EX8 if question==2,  msize(125) m(s) mlc(gs10) mfc("102 189 99") mlw(none))
            (sc EY EX9 if question==2,  msize(125) m(s) mlc(gs10) mfc("26 152 80") mlw(none))
            (sc EY EX10 if question==2,  msize(125) m(s) mlc(gs10) mfc("0 104 55") mlw(none))

            (sc y s_acad_rev if question==`x',  msize(75) m(o) mlc(blue%75) mfc(blue%25) mlw(3))
            (sc y s_nonacad_rev if question==`x',  msize(75) m(o) mlc(purple%75) mfc(purple%25) mlw(3))
                ,
                graphregion(color(gs16) margin(zero))
                plotregion(margin(-100 -100 -100 -100)) 
                ysize(1) xsize(9)
                xlab(-0.5(0.5)5.5)
                xscale(off noline range(-1(0.1)6))
                xtitle("", size(2.5) color(gs0) margin(zero))
                ylab(, nogrid glc(gs16) angle(0) format(%9.0f))
                yscale(off noline)
                ytitle("", size(2.5) margin(zero))
                legend(off)
            name(ds_`x')
                ;
    #delimit cr
    }
restore

** ATTITUDE SCORES - SUMMARISED FOR ENTIRE PARTCIPANT SAMPLE (n=113)
** Academic and non-academic combined
preserve
    gen score = ds_ * attitude 
    bysort question: egen tscore = sum(score)
    bysort question: egen total = sum(attitude)
    gen fscore = tscore/total 

    ** collapse (sum) gscore=score (mean) gtot=tscore gscale=fscore, by(question ds_) 
    ** format gscale %9.1f
    ** gen gperc = (gscore/gtot)*100
    ** format gperc %9.1f

    collapse (mean) final_score = fscore, by(question) 
    rename final_score score
    ** reshape wide score , i(question) j(group)
    gen y = 1 

    ** Reverse the following questions
    gen score_rev = score
    local questions = "4 8 10 12 13 14 15 21 24 26 27 28 30 31 32 33 34 35 36 37"
    foreach x of numlist `questions' {
            replace score_rev = 5 - score if question==`x'
    }
    ** TABLE OF SCORES BY GROUP
    format score_rev %9.1f 
    list question score_rev
restore
