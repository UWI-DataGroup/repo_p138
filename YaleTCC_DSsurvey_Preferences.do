** CHANGE THIS FOR RE-RUN ON NEW COMPUTER
cd "C:\Users\stephanie.whiteman\Documents\Stata Files\p138\repo_p138"


** CLOSE ANY OPEN LOG FILE AND OPEN A NEW LOG FILE
	capture log close
	log using "YaleTCC_DSsurvey_Preferences.smcl", replace

**  GENERAL DO-FILE COMMENTS
//  project:      Yale-TCC Data Sharing Survey
//  name: 		  YaleTCC_DSsurvey_Preferences
//  author:       HAMBLETON, WHITEMAN, JEYASEELAN \ 30-JUL-2020
//  description:  Data Analysis for the Yale-TCC Data Sharing Survey

** DO-FILE SECTION 00
** DO-FILE SET UP COMMANDS
version 16
clear all

** DO-FILE SECTION 01 - Importing the data set

local datapath "X:\The UWI - Cave Hill Campus\DataGroup - repo_data\data_p138"
use "`datapath'\version01\2-working\YaleTCC_DSsurvey.dta", clear
**---------------------------------------


**------------------------------------------------
** DO-FILE SECTION 02 - Data Sharing Preferences
**------------------------------------------------

** Time needed to share data
summarize dahp_know01

generate time=.
replace time=1 if dahp_know01>75 & dahp_know01<.
replace time=2 if dahp_know01>25 & dahp_know01<75
replace time=3 if dahp_know01<25
order time, after(dahp_know01)
label define Importance 1 "Important" 2 "Neither important nor unimportant" 3 "Unimportant"
label values time Importance

tab time

graph bar, over(time) bar(1, fcolor(green)) ytitle(Percentage of respondents) title(Time needed to share data)


** Funds needed to share data 
summarize dahp_know02

generate funds=.
replace funds=1 if dahp_know02>75 & dahp_know02<.
replace funds=2 if dahp_know02>25 & dahp_know02<75
replace funds=3 if dahp_know02<25
label values funds Importance
order funds, after(dahp_know02)

tab funds

graph bar, over(funds) bar(1, fcolor(green)) ytitle(Percentage of respondents) title(Importance of funds needed to share data)

** Data Confidentiality

summarize dahp_know03

generate confidentiality=.
replace confidentiality=1 if dahp_know03>75 & dahp_know03<.
replace confidentiality=2 if dahp_know03>25 & dahp_know03<75
replace confidentiality=3 if dahp_know03<25
label values confidentiality Importance
order confidentiality, after(dahp_know03)

tab confidentiality

graph bar, over(confidentiality) bar(1, fcolor(green)) ytitle(Percentage of respondents) title(Importance of data confidentiality to share data)


** Permission from my employers

summarize dahp_know04

generate permission=.
replace permission=1 if dahp_know04>75 & dahp_know04<.
replace permission=2 if dahp_know04>25 & dahp_know04<75
replace permission=3 if dahp_know04<25
label values permission Importance
order permission, after(dahp_know04)

tab permission

graph bar, over(permission) bar(1, fcolor(green)) ytitle(Percentage of respondents) title(Importance of having permission from employer to share data)

** Concern about data misuse by others

summarize dahp_know06

generate misuse=.
replace misuse=1 if dahp_know06>75 & dahp_know06<.
replace misuse=2 if dahp_know06>25 & dahp_know06<75
replace misuse=3 if dahp_know06<25
label values misuse Importance
order misuse, after(dahp_know06)

tab misuse

graph bar, over(misuse) bar(1, fcolor(green)) ytitle(Percentage of respondents) title (Concern about the misuse of data by others)


