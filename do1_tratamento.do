* COMPATIBILIZANDO BANCOS *

clear

cd "C:\Users\Rodrigo\Documents\Rodrigo\Tese\Tese\Dados\ENEM\2012_2016"

foreach x in 2009 {

# delimit;

infix

str nu_inscricao 1-12
nu_ano 13-16
str tp_sexo 20-20
nu_nt_cn 524-532
nu_nt_ch 533-541
nu_nt_lc 542-550
nu_nt_mt 551-559
nu_nota_redacao 974-982

using DADOS_ENEM_`x'.txt;
#delimit cr

save banco_filtro_A_`x'.dta, replace

clear

# delimit;

infix

str nu_inscricao 1-12
str q3 16-16
str q17 30-30
str q21 34-34

using QUESTIONARIO_SOCIO_ECONOMICO_ENEM_`x'.txt;
#delimit cr

save banco_filtro_B_`x'.dta, replace

merge 1:1 nu_inscricao using banco_filtro_A_`x'.dta

save banco_filtro_`x'.dta, replace
}

foreach x in 2010 {
 clear 
# delimit;

infix

str nu_inscricao 1-12
nu_ano 13-16
str tp_sexo 20-20
tp_cor_raca 203-203
nu_nt_cn 537-545
nu_nt_ch 546-554
nu_nt_lc 555-563
nu_nt_mt 564-572
nu_nota_redacao 997-1005

using DADOS_ENEM_`x'.txt;
#delimit cr

save banco_filtro_A_`x'.dta, replace

clear 

# delimit;

infix

str nu_inscricao 1-12
str q02 15-15
str q04 17-17

using QUESTIONARIO_SOCIO_ECONOMICO_ENEM_`x'.txt;
#delimit cr

save banco_filtro_B_`x'.dta, replace

merge 1:1 nu_inscricao using banco_filtro_A_`x'.dta

save banco_filtro_`x'.dta, replace

}

foreach x in 2011 {

clear

# delimit;

infix

str nu_inscricao 1-12
nu_ano 13-16
tp_sexo 20-20
tp_cor_raca 203-203
nu_nt_cn 537-545
nu_nt_ch 546-554
nu_nt_lc 555-563
nu_nt_mt 564-572
nu_nota_redacao 997-1005

using DADOS_ENEM_`x'.txt;
#delimit cr

save banco_filtro_A_`x'.dta, replace

clear

# delimit;

infix

str nu_inscricao 1-12
str q02 16-16
str q04 18-18

using QUESTIONARIO_SOCIO_ECONOMICO_ENEM_`x'.txt;
#delimit cr

save banco_filtro_B_`x'.dta, replace

merge 1:1 nu_inscricao using banco_filtro_A_`x'.dta

save banco_filtro_`x'.dta, replace

}
*rodar a partir daqui**********************
foreach x in 2012 {

clear 

insheet using microdados_enem_`x'.csv, delimiter(",")

keep nu_inscricao nu_ano tp_sexo tp_cor_raca nu_nt_cn nu_nt_ch nu_nt_lc nu_nt_mt nu_nota_redacao

save banco_filtro_A_`x'.dta, replace
}

clear 

insheet using QUESTIONARIO_ENEM_2012.csv, delimiter(",")

keep nu_inscricao q01 q03

save banco_filtro_B_2012.dta, replace

merge 1:1 nu_inscricao using banco_filtro_A_2012.dta

save banco_filtro_2012.dta, replace

*até aqui****************************

foreach x in 2013 {

clear

insheet using microdados_enem_`x'.csv, delimiter(";")

keep nu_ano tp_sexo tp_cor_raca q001 q003 nota_cn nota_ch nota_lc nota_mt nu_nota_redacao

save banco_filtro_`x'.dta, replace
}

foreach x in 2014 {

clear

insheet using microdados_enem_`x'.csv, delimiter(",")

keep nu_ano tp_sexo tp_cor_raca q001 q003 nota_cn nota_ch nota_lc nota_mt nu_nota_redacao

save banco_filtro_`x'.dta, replace
}

foreach x in 2015 {

clear

insheet using microdados_enem_`x'.csv, delimiter(",")

keep nu_ano tp_sexo tp_cor_raca q001 q006 nu_nota_cn nu_nota_ch nu_nota_lc nu_nota_mt nu_nota_redacao

save banco_filtro_`x'.dta, replace
}


foreach x in 2016 {

clear

insheet using microdados_enem_`x'.csv, delimiter(";")

keep nu_ano tp_sexo tp_cor_raca q001 q006 nu_nota_cn nu_nota_ch nu_nota_lc nu_nota_mt nu_nota_redacao

save banco_filtro_`x'.dta, replace
}
