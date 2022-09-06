clear

cd "C:\Users\Rodrigo\Documents\Rodrigo\Tese\Tese\Dados\ENEM"

foreach i in 2009 2010 2011 2012 2013 2014 2015 2016 {

clear

use `i'recorte.dta

* ESTATÍSTICAS DESCRITIVAS

*dummy de mulher
gen mulher = .
replace mulher = 1 if sexo == 1
replace mulher = 0 if sexo == 2

*dummy de cor
replace cor = . if  cor == 0
tab cor, gen(d_cor)

*dummy de esc. pai

replace escpai = . if escpai == 9

tab escpai, gen(d_escpai)

*dummy de renda

tab renfam, gen(d_renfam)

*dummy acesso

gen acesso_mediana = .
replace acesso_mediana = 1 if nnotag == 1
replace acesso_mediana = 0 if nnotag == 0

* rodando modelo

hoi acesso_mediana mulher d_cor* d_escpai* d_renfam*, estimate

gen hoi = .
replace hoi = r(hoi_1) if _n == 1

gen dissimilarity = .
replace dissimilarity = r(d_1) if _n == 1

*gen se_hoi = .
*replace se_hoi = r(se_oi_l) if _n == 1

*gen se_dissimilarity = .
*replace se_dissimilarity = r(se_d_1) if _n == 1

gen ano = .
replace ano = `i' if _n == 1

keep hoi dissimilarity ano

*keep hoi dissimilarity se_hoi se_dissimilarity ano

*drop if ano == .

* gerando tabelas

*logit acesso_mediana mulher d_cor* d_escpai* d_renfam*

* estimate store 

save `i'_hoi_dissimilarity.dta, replace

}


*criando banco de HOI e Dissimilaridade

use 2009_hoi_dissimilarity.dta, clear

foreach x in 2010 2011 2012 2013 2014 2015 2016 {
append using `x'_hoi_dissimilarity.dta
}

*gerando estatisticas descritivas

foreach i in 2009 2010 2011 2012 2013 2014 2015 2016 {

clear

use `i'recorte.dta

* ESTATÍSTICAS DESCRITIVAS

*dummy de mulher
gen mulher = .
replace mulher = 1 if sexo == 1
replace mulher = 0 if sexo == 2

*dummy de cor
replace cor = . if  cor == 0
tab cor, gen(d_cor)

*dummy de esc. pai

replace escpai = . if escpai == 9

tab escpai, gen(d_escpai)

*dummy de renda

tab renfam, gen(d_renfam)

gen id = 1

collapse (mean) mulher d_cor* d_escpai* d_renfam* (sum) id

save `i'_stat.dta, replace

}

use 2009_stat.dta, clear

foreach x in 2010 2011 2012 2013 2014 2015 2016 {
append using `x'_stat.dta
}
