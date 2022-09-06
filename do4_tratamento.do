* RODANDO HOI E DISSIMILARIDADE *

clear

cd "C:\Users\Rodrigo\Documents\Rodrigo\Tese\Tese\Dados\ENEM\2012_2016"

****************************** HOI - MEDIANA ******************************

foreach i in 2009 2010 2011 2012 2013 2014 2015 2016 { 

use `i'_banco_final.dta, clear

hoi p_mediana mulher preto pardo amarelo indigena ate_1sm de_1sm_a_2sm de_2sm_a_5sm de_5sm_a_10sm de_10sm_mais n_estudo fund_inc fund_comp med_comp sup_comp, estimate

gen hoi_m = .
replace hoi_m = r(hoi_1) if _n == 1

gen diss_m = .
replace diss_m = r(d_1) if _n == 1

gen ano = .
replace ano = `i' if _n == 1

keep hoi_m diss_m ano

save `i'_hoi_diss_mediana.dta, replace

}


*criando banco de HOI e Dissimilaridade

use 2009_hoi_diss_mediana.dta, clear

foreach x in 2010 2011 2012 2013 2014 2015 2016 {
append using `x'_hoi_diss_mediana.dta
}
drop if ano == .
save hoi_diss_mediana_todos_anos.dta, replace

****************************** HOI - MAIOR QUARTIL ******************************

foreach i in 2009 2010 2011 2012 2013 2014 2015 2016 { 

use `i'_banco_final.dta, clear

hoi p_quartil75 mulher preto pardo amarelo indigena ate_1sm de_1sm_a_2sm de_2sm_a_5sm de_5sm_a_10sm de_10sm_mais n_estudo fund_inc fund_comp med_comp sup_comp, estimate

gen hoi_q75 = .
replace hoi_q75 = r(hoi_1) if _n == 1

gen diss_q75 = .
replace diss_q75 = r(d_1) if _n == 1

gen ano = .
replace ano = `i' if _n == 1

keep hoi_q75 diss_q75 ano

save `i'_hoi_diss_q75.dta, replace

}


*criando banco de HOI e Dissimilaridade

use 2009_hoi_diss_q75.dta, clear

foreach x in 2010 2011 2012 2013 2014 2015 2016 {
append using `x'_hoi_diss_q75.dta
}
drop if ano == .

save hoi_diss_q75_todos_anos.dta, replace

****************************** HOI - MAIOR DECIL ******************************

foreach i in 2009 2010 2011 2012 2013 2014 2015 2016 { 

use `i'_banco_final.dta, clear

hoi p_decis90 mulher preto pardo amarelo indigena ate_1sm de_1sm_a_2sm de_2sm_a_5sm de_5sm_a_10sm de_10sm_mais n_estudo fund_inc fund_comp med_comp sup_comp, estimate

gen hoi_d90 = .
replace hoi_d90 = r(hoi_1) if _n == 1

gen diss_d90 = .
replace diss_d90 = r(d_1) if _n == 1

gen ano = .
replace ano = `i' if _n == 1

keep hoi_d90 diss_d90 ano

save `i'_hoi_diss_d90.dta, replace

}


*criando banco de HOI e Dissimilaridade

use 2009_hoi_diss_d90.dta, clear

foreach x in 2010 2011 2012 2013 2014 2015 2016 {
append using `x'_hoi_diss_d90.dta
}
drop if ano == .

save hoi_diss_d90_todos_anos.dta, replace

****************************** HOI - MAIOR CENTIL ******************************

foreach i in 2009 2010 2011 2012 2013 2014 2015 2016 { 

use `i'_banco_final.dta, clear

hoi p_centil99 mulher preto pardo amarelo indigena ate_1sm de_1sm_a_2sm de_2sm_a_5sm de_5sm_a_10sm de_10sm_mais n_estudo fund_inc fund_comp med_comp sup_comp, estimate

gen hoi_c99 = .
replace hoi_c99 = r(hoi_1) if _n == 1

gen diss_c99 = .
replace diss_c99 = r(d_1) if _n == 1

gen ano = .
replace ano = `i' if _n == 1

keep hoi_c99 diss_c99 ano

save `i'_hoi_diss_c99.dta, replace

}


*criando banco de HOI e Dissimilaridade

use 2009_hoi_diss_c99.dta, clear

foreach x in 2010 2011 2012 2013 2014 2015 2016 {
append using `x'_hoi_diss_c99.dta
}
drop if ano == .

save hoi_diss_c99_todos_anos.dta, replace
