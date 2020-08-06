** CHANGE THIS FOR RE-RUN ON NEW COMPUTER
cd "C:\Users\stephanie.whiteman\The UWI - Cave Hill Campus\DataGroup - repo_data\data_p138\version01\2-working"


** CLOSE ANY OPEN LOG FILE AND OPEN A NEW LOG FILE
	capture log close
	log using "YaleTCC_DSsurvey_Preferences.smcl", replace

**  GENERAL DO-FILE COMMENTS
//  project:      Yale-TCC Data Sharing Survey
//  author:       HAMBLETON, WHITEMAN, JEYASEELAN \ 30-JUL-2020
//  description:  Data Analysis for the Yale-TCC Data Sharing Survey

** DO-FILE SECTION 00
** DO-FILE SET UP COMMANDS
version 16
clear all

** DO-FILE SECTION 01 - Importing the data set

local datapath "C:\Users\stephanie.whiteman\The UWI - Cave Hill Campus\DataGroup - repo_data\data_p138"
use "`datapath'\version01\2-working\YaleTCC_DSsurvey.dta", clear
**---------------------------------------


**------------------------------------------------
** DO-FILE SECTION 02 - Data Sharing Preferences
**------------------------------------------------

** Time needed to share datasummarize dahp_know01
summarize dahp_know01

generate time=.
replace time=1 if dahp_know01>74 & dahp_know01<.
replace time=2 if dahp_know01>24 & dahp_know01<76
replace time=2 if dahp_know01>24 & dahp_know01<75
replace time=3 if dahp_know01<24
order time, after(dahp_know01)
label define Importance 1 "Important" 2 "Neither important nor unimportant" 3 "Unimportant"
label values time Importance

tab time

graph bar, over(time) bar(1, fcolor(green)) ytitle(Percentage of respondents) title(Time needed to share data)


