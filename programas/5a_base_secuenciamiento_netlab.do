import excel "${datos}\raw\base_netlab_junio.xlsx", sheet(Hoja1) clear 

rename A dni
rename B linaje
gen mes = 6
gen muestra = "netlab"
keep dni mes linaje muestra

save "${datos}\temporal\secuenciamiento_1", replace
*******************************************************************************
import excel "${datos}\raw\base_netlab_julio.xlsx", sheet(Hoja1) clear 

rename A dni
tostring dni, replace
rename B linaje
gen mes = 7
gen muestra = "netlab"
keep dni mes linaje muestra

save "${datos}\temporal\secuenciamiento_2", replace
*******************************************************************************

import excel "${datos}\raw\base_netlab_abril_mayo.xlsx", sheet(Hoja1) firstrow clear

tostring DNI, replace
rename DNI dni
rename TIPODEVARIANTELINAJE linaje
gen mes = 4 if MES == "ABRIL"
replace mes = 5 if MES == "MAYO"
keep dni mes linaje
gen muestra = "netlab"
keep dni mes linaje muestra

save "${datos}\temporal\secuenciamiento_3", replace
*******************************************************************************
import excel "${datos}\raw\base_netlab_mayo_junio.xlsx", sheet(Hoja1) firstrow clear

gen mes_0= month(FECHACOLECTA)
gen mes = 5 if mes_0 == 5
replace mes = 6 if mes_0 == 6
rename DNI dni
rename PANGOLINEAGE linaje 
gen muestra = "netlab"
keep dni mes linaje muestra
*******************************************************************************
save "${datos}\temporal\secuenciamiento_4", replace

* agosto y septiembre
import excel "${datos}\raw\base_netlab_agosto_septiembre.xlsx", sheet(Hoja1) firstrow clear

rename E dni
drop if dni == ""
gen mes = 8 in 1/32 // sólo es agosto los primeros 32 observaciones
replace mes = 9 in 33/41
rename F linaje
gen muestra = "netlab"
keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_5", replace
*******************************************************************************
import excel "${datos}\raw\base_netlab_septiembre.xlsx", sheet(Hoja1) firstrow clear

rename C dni
rename E linaje
gen mes = 9
gen muestra = "netlab"
keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_6", replace

*******************************************************************************
import excel "${datos}\raw\base_netlab_unsaac.xlsx", sheet(Hoja1) firstrow clear

keep PANGO_lineage id fechacolecta
gen mes = month(fechacolecta)
replace mes = 7 if mes == .
gen muestra = "netlab" if mes == 6 | mes == 5
replace muestra = "unsaac" if mes == 7
keep id PANGO_lineage mes muestra
rename PANGO_lineage linaje 
sort id
replace id = _n+131 if id == .
sort id
duplicates drop id, force

save "${datos}\temporal\secuenciamiento_7", replace
*******************************************************************************
* Importante
use "${datos}\output\base_noticovid", clear

rename idFicha id
keep id dni

merge m:1 id using "${datos}\temporal\secuenciamiento_7" 

keep if _merge == 2 | _merge == 3

keep dni linaje mes muestra

save "${datos}\temporal\secuenciamiento_7_1", replace

*******************************************************************************
import excel "${datos}\raw\base_netlab_octubre.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje

gen mes = 10
gen muestra = "netlab"
keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_8", replace
************************************************************************
import excel "${datos}\raw\base_netlab_noviembre.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 11
gen muestra = "netlab"

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_9", replace
************************************************************************

import excel "${datos}\raw\base_netlab_diciembre.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 12
gen muestra = "netlab"

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_10", replace
************************************************************************

import excel "${datos}\raw\base_netlab_enero_2022.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 13
gen muestra = "netlab"

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_11", replace
************************************************************************
import excel "${datos}\raw\base_netlab_febrero_2022.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 14
gen muestra = "netlab"

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_12", replace
************************************************************************
import excel "${datos}\raw\base_netlab_marzo_2022.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 15
gen muestra = "netlab"

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_13", replace
************************************************************************
import excel "${datos}\raw\base_netlab_abril_2022.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 16
gen muestra = "netlab"

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_14", replace
************************************************************************
import excel "${datos}\raw\base_netlab_mayo_2022.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 17
gen muestra = "netlab"

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_15", replace
************************************************************************
import excel "${datos}\raw\base_netlab_junio_2022.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 18
gen muestra = "netlab"

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_16", replace
************************************************************************
import excel "${datos}\raw\base_netlab_julio_2022.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 19
gen muestra = "netlab"

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_17", replace
************************************************************************
import excel "${datos}\raw\base_netlab_agosto_2022.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 20
gen muestra = "netlab"
tostring dni, replace force

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_18", replace
************************************************************************
import excel "${datos}\raw\base_netlab_setiembre_2022.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 21
gen muestra = "netlab"
tostring dni, replace force

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_19", replace
************************************************************************
import excel "${datos}\raw\base_netlab_octubre_2022.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 22
gen muestra = "netlab"
tostring dni, replace force

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_20", replace
************************************************************************
import excel "${datos}\raw\base_netlab_noviembre_2022.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 23
gen muestra = "netlab"
tostring dni, replace force

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_21", replace
************************************************************************
import excel "${datos}\raw\base_netlab_diciembre_2022.xlsx", sheet(Hoja1) firstrow clear

rename DNI dni
rename LINAJE linaje
gen mes = 24
gen muestra = "netlab"
tostring dni, replace force

keep dni mes linaje muestra
save "${datos}\temporal\secuenciamiento_22", replace
************************************************************************


append using "${datos}\temporal\secuenciamiento_1"
append using "${datos}\temporal\secuenciamiento_2"
append using "${datos}\temporal\secuenciamiento_3"
append using "${datos}\temporal\secuenciamiento_4"
append using "${datos}\temporal\secuenciamiento_5"
append using "${datos}\temporal\secuenciamiento_6"
append using "${datos}\temporal\secuenciamiento_7_1"
append using "${datos}\temporal\secuenciamiento_8"
append using "${datos}\temporal\secuenciamiento_9"
append using "${datos}\temporal\secuenciamiento_10"
append using "${datos}\temporal\secuenciamiento_11"
append using "${datos}\temporal\secuenciamiento_12"
append using "${datos}\temporal\secuenciamiento_13"
append using "${datos}\temporal\secuenciamiento_14"
append using "${datos}\temporal\secuenciamiento_15" 
append using "${datos}\temporal\secuenciamiento_16"
append using "${datos}\temporal\secuenciamiento_17"
append using "${datos}\temporal\secuenciamiento_18"
append using "${datos}\temporal\secuenciamiento_19"
append using "${datos}\temporal\secuenciamiento_20"
append using "${datos}\temporal\secuenciamiento_21"
append using "${datos}\temporal\secuenciamiento_22"
*sort mes

sort dni

gen numero = _n

replace dni = "1" if numero == 1
replace dni = "2" if numero == 2
replace dni = "3" if numero == 3
replace dni = "4" if numero == 4
replace dni = "5" if numero == 5
replace dni = "6" if numero == 6
replace dni = "7" if numero == 7
replace dni = "8" if numero == 8

*gen muestra = "unsaac" in 1/8
replace muestra = "netlab" if muestra == ""

drop numero
sort dni
duplicates report dni
duplicates tag dni, gen(dupli_noti)
quietly by dni: gen dup_noti = cond(_N==1,0,_n)
*br dni dupli_noti dup_noti if dup_noti != 0
duplicates drop dni, force

replace linaje = "observacion" if linaje == "AUSENCIA DE MATERIAL GENETICO" | linaje == "AUSENCIA DE MATERIAL GENETICO," | linaje == " -" | linaje == "-" | linaje == "Pendiente revisión" | linaje == "pendiente" | linaje == ""

********************************************************************************
replace dni = "9103464" if dni == "0 9103464"
replace dni = "1510131" if dni == "01510131"
replace dni = "4351364" if dni == "04351364"

keep dni linaje mes muestra

********************************************************************************
save "${datos}\temporal\datos_secuenciamiento_netlab", replace

*export excel using "datos\output\datos_secuenciamiento_netlab.xlsx", replace firstrow(variables)