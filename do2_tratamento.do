* CRIANDO VARIÁVEIS *

clear

cd "C:\Users\Rodrigo\Documents\Rodrigo\Tese\Tese\Dados\ENEM\2012_2016"

use banco_filtro_2009.dta, clear

*variável mulher*

gen mulher = .
replace mulher = 1 if tp_sexo == "F"
replace mulher = 0 if tp_sexo == "M"

* variáveis cor*

gen branco = .
replace branco = 1 if q3 == "A"
replace branco = 0 if q3 != "A"
replace branco = . if q3 == "." | q3 =="*" | q3 == ""

gen pardo = .
replace pardo = 1 if q3 == "B"
replace pardo = 0 if q3 != "B"
replace pardo = . if q3 == "." | q3 =="*" | q3 == ""

gen preto = .
replace preto = 1 if q3 == "C"
replace preto = 0 if q3 != "C"
replace preto = . if q3 == "." | q3 =="*" | q3 == ""

gen amarelo = .
replace amarelo = 1 if q3 == "D"
replace amarelo = 0 if q3 != "D"
replace amarelo = . if q3 == "." | q3 =="*" | q3 == ""

gen indigena = .
replace indigena = 1 if q3 == "E"
replace indigena = 0 if q3 != "E"
replace indigena = . if q3 == "." | q3 =="*" | q3 == ""

*variáveis escolaridade*

gen n_estudo = .
replace n_estudo = 1 if q17 == "A"
replace n_estudo = 0 if q17 != "A"
replace n_estudo = . if q17 == "." | q17 == "*" | q17 == "I" | q17 == ""

gen fund_inc = .
replace fund_inc = 1 if q17 == "B"
replace fund_inc = 0 if q17 != "B"
replace fund_inc = . if q17 == "." | q17 == "*" | q17 == "I" | q17 == ""

gen fund_comp = .
replace fund_comp = 1 if q17 == "C" | q17 == "D"
replace fund_comp = 0 if q17 != "C" & q17 != "D"
replace fund_comp = . if q17 == "." | q17 == "*" | q17 == "I" | q17 == ""

gen med_comp = .
replace med_comp = 1 if q17 == "E" | q17 == "F"
replace med_comp = 0 if q17 != "E" & q17 != "F"
replace med_comp = . if q17 == "." | q17 == "*" | q17 == "I" | q17 == ""

gen sup_comp = .
replace sup_comp = 1 if q17 == "G" | q17 == "H"
replace sup_comp = 0 if q17 != "G" & q17 != "H"
replace sup_comp = . if q17 == "." | q17 == "*" | q17 == "I" | q17 == ""

* variável renda *

gen ate_1sm = .
replace ate_1sm = 1 if q21 == "A"
replace ate_1sm = 0 if q21 != "A"
replace ate_1sm = . if q21 == "." | q21 == "*" | q21 == "H" | q21 == ""

gen de_1sm_a_2sm = .
replace de_1sm_a_2sm = 1 if q21 == "B"
replace de_1sm_a_2sm = 0 if q21 != "B"
replace de_1sm_a_2sm= . if q21 == "." | q21 == "*" | q21 == "H" | q21 == ""


gen de_2sm_a_5sm = .
replace de_2sm_a_5sm = 1 if q21 == "C"
replace de_2sm_a_5sm = 0 if q21 != "C"
replace de_2sm_a_5sm= . if q21 == "." | q21 == "*" | q21 == "H" | q21 == ""

gen de_5sm_a_10sm = .
replace de_5sm_a_10sm = 1 if q21 == "D"
replace de_5sm_a_10sm = 0 if q21 != "D"
replace de_5sm_a_10sm= . if q21 == "." | q21 == "*" | q21 == "H" | q21 == ""

gen de_10sm_mais = .
replace de_10sm_mais = 1 if q21 == "E" | q21 == "F" | q21 == "G"
replace de_10sm_mais = 0 if q21 != "E" & q21 != "F" & q21 != "G"
replace de_10sm_mais= . if q21 == "." | q21 == "*" | q21 == "H" | q21 == ""

drop if nu_nt_cn == 0 | nu_nt_cn == . | nu_nt_ch == 0 | nu_nt_ch == . | nu_nt_lc == 0 | nu_nt_lc == . | nu_nt_mt == 0 | nu_nt_mt == . | nu_nota_redacao == 0 | nu_nota_redacao == .

gen notag = (nu_nt_cn + nu_nt_ch + nu_nt_lc + nu_nt_mt + nu_nota_redacao)/3

xtile mediana = notag, nquantiles(2)
gen p_mediana = .
replace p_mediana = 1 if mediana == 2
replace p_mediana = 0 if mediana == 1

xtile quartis = notag, nquantiles(4)
gen p_quartil75 = .
replace p_quartil75 = 1 if quartis == 4
replace p_quartil75 = 0 if quartis < 4

xtile decis = notag, nquantiles(10)
gen p_decis90 = .
replace p_decis90 = 1 if decis == 10
replace p_decis90 = 0 if decis < 10

xtile centis = notag, nquantiles(100)
gen p_centil99 = .
replace p_centil99 = 1 if centis == 100
replace p_centil99 = 0 if centis < 100

save 2009_banco_final.dta, replace


******************************************* 2010 ***********************************************************
************************************************************************************************************

use banco_filtro_2010.dta, clear

*variável mulher*

gen mulher = .
replace mulher = 1 if tp_sexo == "F"
replace mulher = 0 if tp_sexo == "M"

* variáveis cor*

gen branco = .
replace branco = 1 if tp_cor_raca == 1
replace branco = 0 if tp_cor_raca != 1
replace branco = . if tp_cor_raca == 0

gen pardo = .
replace pardo = 1 if tp_cor_raca == 3
replace pardo = 0 if tp_cor_raca != 3
replace pardo = . if tp_cor_raca == 0

gen preto = .
replace preto = 1 if tp_cor_raca == 2
replace preto = 0 if tp_cor_raca != 2
replace preto = . if tp_cor_raca == 0

gen amarelo = .
replace amarelo = 1 if tp_cor_raca == 4
replace amarelo = 0 if tp_cor_raca != 4
replace amarelo = . if tp_cor_raca == 0

gen indigena = .
replace indigena = 1 if tp_cor_raca == 5
replace indigena = 0 if tp_cor_raca != 5
replace indigena = . if tp_cor_raca == 0

*variáveis escolaridade*

gen n_estudo = .
replace n_estudo = 1 if q02 == "H"
replace n_estudo = 0 if q02 != "H"
replace n_estudo = . if q02 == "I"

gen fund_inc = .
replace fund_inc = 1 if q02 == "A"
replace fund_inc = 0 if q02 != "A"
replace fund_inc = . if q02 == "I"

gen fund_comp = .
replace fund_comp = 1 if q02 == "B"
replace fund_comp = 0 if q02 != "B"
replace fund_comp = . if q02 == "I"

gen med_comp = .
replace med_comp = 1 if q02 == "C"
replace med_comp = 0 if q02 != "C"
replace med_comp = . if q02 == "I"

gen sup_comp = .
replace sup_comp = 1 if q02 == "D" | q02 == "E" | q02 == "F" | q02 == "G"
replace sup_comp = 0 if q02 != "D" & q02 != "E" & q02 != "F" & q02 != "G"
replace sup_comp = . if q02 == "I"

* variável renda *

gen ate_1sm = .
replace ate_1sm = 1 if q04 == "A"
replace ate_1sm = 0 if q04 != "A"
replace ate_1sm = . if q04 == "H"

gen de_1sm_a_2sm = .
replace de_1sm_a_2sm = 1 if q04 == "B"
replace de_1sm_a_2sm = 0 if q04 != "B"
replace de_1sm_a_2sm= . if q04 == "H"


gen de_2sm_a_5sm = .
replace de_2sm_a_5sm = 1 if q04 == "C"
replace de_2sm_a_5sm = 0 if q04 != "C"
replace de_2sm_a_5sm= . if q04 == "H"

gen de_5sm_a_10sm = .
replace de_5sm_a_10sm = 1 if q04 == "D"
replace de_5sm_a_10sm = 0 if q04 != "D"
replace de_5sm_a_10sm= . if q04 == "H"

gen de_10sm_mais = .
replace de_10sm_mais = 1 if q04 == "E" | q04 == "F" | q04 == "G"
replace de_10sm_mais = 0 if q04 != "E" & q04 != "F" & q04 != "G"
replace de_10sm_mais= . if q04 == "H"

* NOTAS *

drop if nu_nt_cn == 0 | nu_nt_cn == . | nu_nt_ch == 0 | nu_nt_ch == . | nu_nt_lc == 0 | nu_nt_lc == . | nu_nt_mt == 0 | nu_nt_mt == . | nu_nota_redacao == 0 | nu_nota_redacao == .

gen notag = (nu_nt_cn + nu_nt_ch + nu_nt_lc + nu_nt_mt + nu_nota_redacao)/3

xtile mediana = notag, nquantiles(2)
gen p_mediana = .
replace p_mediana = 1 if mediana == 2
replace p_mediana = 0 if mediana == 1

xtile quartis = notag, nquantiles(4)
gen p_quartil75 = .
replace p_quartil75 = 1 if quartis == 4
replace p_quartil75 = 0 if quartis < 4

xtile decis = notag, nquantiles(10)
gen p_decis90 = .
replace p_decis90 = 1 if decis == 10
replace p_decis90 = 0 if decis < 10

xtile centis = notag, nquantiles(100)
gen p_centil99 = .
replace p_centil99 = 1 if centis == 100
replace p_centil99 = 0 if centis < 100

save 2010_banco_final.dta, replace


************************************************** 2011 ************************************************************
**********************************************************************************************************************


use banco_filtro_2011.dta, clear

*variável mulher*

gen mulher = .
replace mulher = 1 if tp_sexo == 1
replace mulher = 0 if tp_sexo == 0

* variáveis cor*

gen branco = .
replace branco = 1 if tp_cor_raca == 1
replace branco = 0 if tp_cor_raca != 1
replace branco = . if tp_cor_raca == 0

gen pardo = .
replace pardo = 1 if tp_cor_raca == 3
replace pardo = 0 if tp_cor_raca != 3
replace pardo = . if tp_cor_raca == 0

gen preto = .
replace preto = 1 if tp_cor_raca == 2
replace preto = 0 if tp_cor_raca != 2
replace preto = . if tp_cor_raca == 0

gen amarelo = .
replace amarelo = 1 if tp_cor_raca == 4
replace amarelo = 0 if tp_cor_raca != 4
replace amarelo = . if tp_cor_raca == 0

gen indigena = .
replace indigena = 1 if tp_cor_raca == 5
replace indigena = 0 if tp_cor_raca != 5
replace indigena = . if tp_cor_raca == 0

*variáveis escolaridade*

gen n_estudo = .
replace n_estudo = 1 if q02 == "A"
replace n_estudo = 0 if q02 != "A"
replace n_estudo = . if q02 == "I"

gen fund_inc = .
replace fund_inc = 1 if q02 == "B"
replace fund_inc = 0 if q02 != "B"
replace fund_inc = . if q02 == "I"

gen fund_comp = .
replace fund_comp = 1 if q02 == "C" | q02 == "D"
replace fund_comp = 0 if q02 != "C" & q02 != "D"
replace fund_comp = . if q02 == "I"

gen med_comp = .
replace med_comp = 1 if q02 == "E" | q02 == "F"
replace med_comp = 0 if q02 != "E" & q02 != "F"
replace med_comp = . if q02 == "I"

gen sup_comp = .
replace sup_comp = 1 if q02 == "G" | q02 == "H"
replace sup_comp = 0 if q02 != "G" & q02 != "H"
replace sup_comp = . if q02 == "I"

* variável renda *

gen ate_1sm = .
replace ate_1sm = 1 if q04 == "B"
replace ate_1sm = 0 if q04 != "B"
replace ate_1sm = . if q04 == "A"

gen de_1sm_a_2sm = .
replace de_1sm_a_2sm = 1 if q04 == "C" | q04 == "D"
replace de_1sm_a_2sm = 0 if q04 != "C" & q04 != "D"
replace de_1sm_a_2sm= . if q04 == "A"


gen de_2sm_a_5sm = .
replace de_2sm_a_5sm = 1 if q04 == "E"
replace de_2sm_a_5sm = 0 if q04 != "E"
replace de_2sm_a_5sm= . if q04 == "A"

gen de_5sm_a_10sm = .
replace de_5sm_a_10sm = 1 if q04 == "F" | q04 == "G"
replace de_5sm_a_10sm = 0 if q04 != "F" & q04 != "G"
replace de_5sm_a_10sm= . if q04 == "A"

gen de_10sm_mais = .
replace de_10sm_mais = 1 if q04 == "H" | q04 == "I" | q04 == "J" | q04 == "K"
replace de_10sm_mais = 0 if q04 != "H" & q04 != "I" & q04 != "J" & q04 != "K"
replace de_10sm_mais= . if q04 == "A"

* NOTAS *

drop if nu_nt_cn == 0 | nu_nt_cn == . | nu_nt_ch == 0 | nu_nt_ch == . | nu_nt_lc == 0 | nu_nt_lc == . | nu_nt_mt == 0 | nu_nt_mt == . | nu_nota_redacao == 0 | nu_nota_redacao == .

gen notag = (nu_nt_cn + nu_nt_ch + nu_nt_lc + nu_nt_mt + nu_nota_redacao)/3

xtile mediana = notag, nquantiles(2)
gen p_mediana = .
replace p_mediana = 1 if mediana == 2
replace p_mediana = 0 if mediana == 1

xtile quartis = notag, nquantiles(4)
gen p_quartil75 = .
replace p_quartil75 = 1 if quartis == 4
replace p_quartil75 = 0 if quartis < 4

xtile decis = notag, nquantiles(10)
gen p_decis90 = .
replace p_decis90 = 1 if decis == 10
replace p_decis90 = 0 if decis < 10

xtile centis = notag, nquantiles(100)
gen p_centil99 = .
replace p_centil99 = 1 if centis == 100
replace p_centil99 = 0 if centis < 100

save 2011_banco_final.dta, replace


*********************************************2012****************************************************
*****************************************************************************************************

use banco_filtro_2012.dta, clear

*variável mulher*

gen mulher = .
replace mulher = 1 if tp_sexo == 1
replace mulher = 0 if tp_sexo == 0

* variáveis cor*

gen branco = .
replace branco = 1 if tp_cor_raca == 1
replace branco = 0 if tp_cor_raca != 1
replace branco = . if tp_cor_raca == 0

gen pardo = .
replace pardo = 1 if tp_cor_raca == 3
replace pardo = 0 if tp_cor_raca != 3
replace pardo = . if tp_cor_raca == 0

gen preto = .
replace preto = 1 if tp_cor_raca == 2
replace preto = 0 if tp_cor_raca != 2
replace preto = . if tp_cor_raca == 0

gen amarelo = .
replace amarelo = 1 if tp_cor_raca == 4
replace amarelo = 0 if tp_cor_raca != 4
replace amarelo = . if tp_cor_raca == 0

gen indigena = .
replace indigena = 1 if tp_cor_raca == 5
replace indigena = 0 if tp_cor_raca != 5
replace indigena = . if tp_cor_raca == 0

*variáveis escolaridade*

gen n_estudo = .
replace n_estudo = 1 if q01 == "A"
replace n_estudo = 0 if q01 != "A"
replace n_estudo = . if q01 == "I"

gen fund_inc = .
replace fund_inc = 1 if q01 == "B"
replace fund_inc = 0 if q01 != "B"
replace fund_inc = . if q01 == "I"

gen fund_comp = .
replace fund_comp = 1 if q01 == "C" | q01 == "D"
replace fund_comp = 0 if q01 != "C" & q01 != "D"
replace fund_comp = . if q01 == "I"

gen med_comp = .
replace med_comp = 1 if q01 == "E" | q01 == "F"
replace med_comp = 0 if q01 != "E" & q01 != "F"
replace med_comp = . if q01 == "I"

gen sup_comp = .
replace sup_comp = 1 if q01 == "G" | q01 == "H"
replace sup_comp = 0 if q01 != "G" & q01 != "H"
replace sup_comp = . if q01 == "I"

* variável renda *

gen ate_1sm = .
replace ate_1sm = 1 if q03 == "B"
replace ate_1sm = 0 if q03 != "B"
replace ate_1sm = . if q03 == "A"

gen de_1sm_a_2sm = .
replace de_1sm_a_2sm = 1 if q03 == "C" | q03 == "D"
replace de_1sm_a_2sm = 0 if q03 != "C" & q03 != "D"
replace de_1sm_a_2sm= . if q03 == "A"


gen de_2sm_a_5sm = .
replace de_2sm_a_5sm = 1 if q03 == "E" | q03 == "F" | q03 == "G" | q03 == "H"
replace de_2sm_a_5sm = 0 if q03 != "E" & q03 != "F" & q03 != "G" & q03 != "H"
replace de_2sm_a_5sm= . if q03 == "A"

gen de_5sm_a_10sm = .
replace de_5sm_a_10sm = 1 if q03 == "I" | q03 == "J" | q03 == "K" | q03 == "L" | q03 == "M"
replace de_5sm_a_10sm = 0 if q03 != "I" & q03 != "J" & q03 != "K" & q03 != "L" & q03 != "M"
replace de_5sm_a_10sm= . if q03 == "A"

gen de_10sm_mais = .
replace de_10sm_mais = 1 if q03 == "N" | q03 == "O" | q03 == "P" | q03 == "Q"
replace de_10sm_mais = 0 if q03 != "N" & q03 != "O" & q03 != "P" & q03 != "Q"
replace de_10sm_mais= . if q03 == "A"

* NOTAS *

drop if nu_nt_cn == 0 | nu_nt_cn == . | nu_nt_ch == 0 | nu_nt_ch == . | nu_nt_lc == 0 | nu_nt_lc == . | nu_nt_mt == 0 | nu_nt_mt == . | nu_nota_redacao == 0 | nu_nota_redacao == .

gen notag = (nu_nt_cn + nu_nt_ch + nu_nt_lc + nu_nt_mt + nu_nota_redacao)/3

xtile mediana = notag, nquantiles(2)
gen p_mediana = .
replace p_mediana = 1 if mediana == 2
replace p_mediana = 0 if mediana == 1

xtile quartis = notag, nquantiles(4)
gen p_quartil75 = .
replace p_quartil75 = 1 if quartis == 4
replace p_quartil75 = 0 if quartis < 4

xtile decis = notag, nquantiles(10)
gen p_decis90 = .
replace p_decis90 = 1 if decis == 10
replace p_decis90 = 0 if decis < 10

xtile centis = notag, nquantiles(100)
gen p_centil99 = .
replace p_centil99 = 1 if centis == 100
replace p_centil99 = 0 if centis < 100

save 2012_banco_final.dta, replace


**************************************************2013************************************************
******************************************************************************************************

use banco_filtro_2013.dta, clear

*variável mulher*

gen mulher = .
replace mulher = 1 if tp_sexo == "F"
replace mulher = 0 if tp_sexo == "M"

* variáveis cor*

gen branco = .
replace branco = 1 if tp_cor_raca == 1
replace branco = 0 if tp_cor_raca != 1
replace branco = . if tp_cor_raca == 0

gen pardo = .
replace pardo = 1 if tp_cor_raca == 3
replace pardo = 0 if tp_cor_raca != 3
replace pardo = . if tp_cor_raca == 0

gen preto = .
replace preto = 1 if tp_cor_raca == 2
replace preto = 0 if tp_cor_raca != 2
replace preto = . if tp_cor_raca == 0

gen amarelo = .
replace amarelo = 1 if tp_cor_raca == 4
replace amarelo = 0 if tp_cor_raca != 4
replace amarelo = . if tp_cor_raca == 0

gen indigena = .
replace indigena = 1 if tp_cor_raca == 5
replace indigena = 0 if tp_cor_raca != 5
replace indigena = . if tp_cor_raca == 0

*variáveis escolaridade*

gen n_estudo = .
replace n_estudo = 1 if q001 == "A"
replace n_estudo = 0 if q001 != "A"
replace n_estudo = . if q001 == "I"

gen fund_inc = .
replace fund_inc = 1 if q001 == "B"
replace fund_inc = 0 if q001 != "B"
replace fund_inc = . if q001 == "I"

gen fund_comp = .
replace fund_comp = 1 if q001 == "C" | q001 == "D"
replace fund_comp = 0 if q001 != "C" & q001 != "D"
replace fund_comp = . if q001 == "I"

gen med_comp = .
replace med_comp = 1 if q001 == "E" | q001 == "F"
replace med_comp = 0 if q001 != "E" & q001 != "F"
replace med_comp = . if q001 == "I"

gen sup_comp = .
replace sup_comp = 1 if q001 == "G" | q001 == "H"
replace sup_comp = 0 if q001 != "G" & q001 != "H"
replace sup_comp = . if q001 == "I"

* variável renda *

gen ate_1sm = .
replace ate_1sm = 1 if q003 == "B"
replace ate_1sm = 0 if q003 != "B"
replace ate_1sm = . if q003 == "A"

gen de_1sm_a_2sm = .
replace de_1sm_a_2sm = 1 if q003 == "C" | q003 == "D"
replace de_1sm_a_2sm = 0 if q003 != "C" & q003 != "D"
replace de_1sm_a_2sm= . if q003 == "A"


gen de_2sm_a_5sm = .
replace de_2sm_a_5sm = 1 if q003 == "E" | q003 == "F" | q003 == "G" | q003 == "H"
replace de_2sm_a_5sm = 0 if q003 != "E" & q003 != "F" & q003 != "G" & q003 != "H"
replace de_2sm_a_5sm= . if q003 == "A"

gen de_5sm_a_10sm = .
replace de_5sm_a_10sm = 1 if q003 == "I" | q003 == "J" | q003 == "K" | q003 == "L" | q003 == "M"
replace de_5sm_a_10sm = 0 if q003 != "I" & q003 != "J" & q003 != "K" & q003 != "L" & q003 != "M"
replace de_5sm_a_10sm= . if q003 == "A"

gen de_10sm_mais = .
replace de_10sm_mais = 1 if q003 == "N" | q003 == "O" | q003 == "P" | q003 == "Q"
replace de_10sm_mais = 0 if q003 != "N" & q003 != "O" & q003 != "P" & q003 != "Q"
replace de_10sm_mais= . if q003 == "A"

* NOTAS *

drop if nota_cn == 0 | nota_cn == . | nota_ch == 0 | nota_ch == . | nota_lc == 0 | nota_lc == . | nota_mt == 0 | nota_mt == . | nu_nota_redacao == 0 | nu_nota_redacao == .

gen notag = (nota_cn + nota_ch + nota_lc + nota_mt + nu_nota_redacao)/3

xtile mediana = notag, nquantiles(2)
gen p_mediana = .
replace p_mediana = 1 if mediana == 2
replace p_mediana = 0 if mediana == 1

xtile quartis = notag, nquantiles(4)
gen p_quartil75 = .
replace p_quartil75 = 1 if quartis == 4
replace p_quartil75 = 0 if quartis < 4

xtile decis = notag, nquantiles(10)
gen p_decis90 = .
replace p_decis90 = 1 if decis == 10
replace p_decis90 = 0 if decis < 10

xtile centis = notag, nquantiles(100)
gen p_centil99 = .
replace p_centil99 = 1 if centis == 100
replace p_centil99 = 0 if centis < 100

save 2013_banco_final.dta, replace


****************************************************2014************************************************
*********************************************************************************************************

use banco_filtro_2014.dta, clear

*variável mulher*

gen mulher = .
replace mulher = 1 if tp_sexo == "F"
replace mulher = 0 if tp_sexo == "M"

* variáveis cor*

gen branco = .
replace branco = 1 if tp_cor_raca == 1
replace branco = 0 if tp_cor_raca != 1
replace branco = . if tp_cor_raca == 0

gen pardo = .
replace pardo = 1 if tp_cor_raca == 3
replace pardo = 0 if tp_cor_raca != 3
replace pardo = . if tp_cor_raca == 0

gen preto = .
replace preto = 1 if tp_cor_raca == 2
replace preto = 0 if tp_cor_raca != 2
replace preto = . if tp_cor_raca == 0

gen amarelo = .
replace amarelo = 1 if tp_cor_raca == 4
replace amarelo = 0 if tp_cor_raca != 4
replace amarelo = . if tp_cor_raca == 0

gen indigena = .
replace indigena = 1 if tp_cor_raca == 5
replace indigena = 0 if tp_cor_raca != 5
replace indigena = . if tp_cor_raca == 0

*variáveis escolaridade*

gen n_estudo = .
replace n_estudo = 1 if q001 == "A"
replace n_estudo = 0 if q001 != "A"
replace n_estudo = . if q001 == "I"

gen fund_inc = .
replace fund_inc = 1 if q001 == "B"
replace fund_inc = 0 if q001 != "B"
replace fund_inc = . if q001 == "I"

gen fund_comp = .
replace fund_comp = 1 if q001 == "C" | q001 == "D"
replace fund_comp = 0 if q001 != "C" & q001 != "D"
replace fund_comp = . if q001 == "I"

gen med_comp = .
replace med_comp = 1 if q001 == "E" | q001 == "F"
replace med_comp = 0 if q001 != "E" & q001 != "F"
replace med_comp = . if q001 == "I"

gen sup_comp = .
replace sup_comp = 1 if q001 == "G" | q001 == "H"
replace sup_comp = 0 if q001 != "G" & q001 != "H"
replace sup_comp = . if q001 == "I"

* variável renda *

gen ate_1sm = .
replace ate_1sm = 1 if q003 == "B"
replace ate_1sm = 0 if q003 != "B"
replace ate_1sm = . if q003 == "A"

gen de_1sm_a_2sm = .
replace de_1sm_a_2sm = 1 if q003 == "C" | q003 == "D"
replace de_1sm_a_2sm = 0 if q003 != "C" & q003 != "D"
replace de_1sm_a_2sm= . if q003 == "A"


gen de_2sm_a_5sm = .
replace de_2sm_a_5sm = 1 if q003 == "E" | q003 == "F" | q003 == "G" | q003 == "H"
replace de_2sm_a_5sm = 0 if q003 != "E" & q003 != "F" & q003 != "G" & q003 != "H"
replace de_2sm_a_5sm= . if q003 == "A"

gen de_5sm_a_10sm = .
replace de_5sm_a_10sm = 1 if q003 == "I" | q003 == "J" | q003 == "K" | q003 == "L" | q003 == "M"
replace de_5sm_a_10sm = 0 if q003 != "I" & q003 != "J" & q003 != "K" & q003 != "L" & q003 != "M"
replace de_5sm_a_10sm= . if q003 == "A"

gen de_10sm_mais = .
replace de_10sm_mais = 1 if q003 == "N" | q003 == "O" | q003 == "P" | q003 == "Q"
replace de_10sm_mais = 0 if q003 != "N" & q003 != "O" & q003 != "P" & q003 != "Q"
replace de_10sm_mais= . if q003 == "A"

* NOTAS *

drop if nota_cn == 0 | nota_cn == . | nota_ch == 0 | nota_ch == . | nota_lc == 0 | nota_lc == . | nota_mt == 0 | nota_mt == . | nu_nota_redacao == 0 | nu_nota_redacao == .

gen notag = (nota_cn + nota_ch + nota_lc + nota_mt + nu_nota_redacao)/3

xtile mediana = notag, nquantiles(2)
gen p_mediana = .
replace p_mediana = 1 if mediana == 2
replace p_mediana = 0 if mediana == 1

xtile quartis = notag, nquantiles(4)
gen p_quartil75 = .
replace p_quartil75 = 1 if quartis == 4
replace p_quartil75 = 0 if quartis < 4

xtile decis = notag, nquantiles(10)
gen p_decis90 = .
replace p_decis90 = 1 if decis == 10
replace p_decis90 = 0 if decis < 10

xtile centis = notag, nquantiles(100)
gen p_centil99 = .
replace p_centil99 = 1 if centis == 100
replace p_centil99 = 0 if centis < 100

save 2014_banco_final.dta, replace


*************************************************2015****************************************************
********************************************************************************************************

use banco_filtro_2015.dta, clear

*variável mulher*

gen mulher = .
replace mulher = 1 if tp_sexo == "F"
replace mulher = 0 if tp_sexo == "M"

* variáveis cor*

gen branco = .
replace branco = 1 if tp_cor_raca == 1
replace branco = 0 if tp_cor_raca != 1
replace branco = . if tp_cor_raca == 0 | tp_cor_raca == 6

gen pardo = .
replace pardo = 1 if tp_cor_raca == 3
replace pardo = 0 if tp_cor_raca != 3
replace pardo = . if tp_cor_raca == 0 | tp_cor_raca == 6

gen preto = .
replace preto = 1 if tp_cor_raca == 2
replace preto = 0 if tp_cor_raca != 2
replace preto = . if tp_cor_raca == 0 | tp_cor_raca == 6

gen amarelo = .
replace amarelo = 1 if tp_cor_raca == 4
replace amarelo = 0 if tp_cor_raca != 4
replace amarelo = . if tp_cor_raca == 0 | tp_cor_raca == 6

gen indigena = .
replace indigena = 1 if tp_cor_raca == 5
replace indigena = 0 if tp_cor_raca != 5
replace indigena = . if tp_cor_raca == 0 | tp_cor_raca == 6

*variáveis escolaridade*

gen n_estudo = .
replace n_estudo = 1 if q001 == "A"
replace n_estudo = 0 if q001 != "A"
replace n_estudo = . if q001 == "H"

gen fund_inc = .
replace fund_inc = 1 if q001 == "B" | q001 == "C"
replace fund_inc = 0 if q001 != "B" & q001 != "C"
replace fund_inc = . if q001 == "H"

gen fund_comp = .
replace fund_comp = 1 if q001 == "D"
replace fund_comp = 0 if q001 != "D"
replace fund_comp = . if q001 == "H"

gen med_comp = .
replace med_comp = 1 if q001 == "E"
replace med_comp = 0 if q001 != "E"
replace med_comp = . if q001 == "H"

gen sup_comp = .
replace sup_comp = 1 if q001 == "F" | q001 == "G"
replace sup_comp = 0 if q001 != "F" & q001 != "G"
replace sup_comp = . if q001 == "H"

* variável renda *

gen ate_1sm = .
replace ate_1sm = 1 if q006 == "B"
replace ate_1sm = 0 if q006 != "B"
replace ate_1sm = . if q006 == "A" | q006 == ""

gen de_1sm_a_2sm = .
replace de_1sm_a_2sm = 1 if q006 == "C" | q006 == "D"
replace de_1sm_a_2sm = 0 if q006 != "C" & q006 != "D"
replace de_1sm_a_2sm= . if q006 == "A" | q006 == ""


gen de_2sm_a_5sm = .
replace de_2sm_a_5sm = 1 if q006 == "E" | q006 == "F" | q006 == "G" | q006 == "H"
replace de_2sm_a_5sm = 0 if q006 != "E" & q006 != "F" & q006 != "G" & q006 != "H"
replace de_2sm_a_5sm= . if q006 == "A" | q006 == ""

gen de_5sm_a_10sm = .
replace de_5sm_a_10sm = 1 if q006 == "I" | q006 == "J" | q006 == "K" | q006 == "L" | q006 == "M"
replace de_5sm_a_10sm = 0 if q006 != "I" & q006 != "J" & q006 != "K" & q006 != "L" & q006 != "M"
replace de_5sm_a_10sm= . if q006 == "A" | q006 == ""

gen de_10sm_mais = .
replace de_10sm_mais = 1 if q006 == "N" | q006 == "O" | q006 == "P" | q006 == "Q"
replace de_10sm_mais = 0 if q006 != "N" & q006 != "O" & q006 != "P" & q006 != "Q"
replace de_10sm_mais= . if q006 == "A" | q006 == ""

* NOTAS *

drop if nu_nota_cn == 0 | nu_nota_cn == . | nu_nota_ch == 0 | nu_nota_ch == . | nu_nota_lc == 0 | nu_nota_lc == . | nu_nota_mt == 0 | nu_nota_mt == . | nu_nota_redacao == 0 | nu_nota_redacao == .

gen notag = (nu_nota_cn + nu_nota_ch + nu_nota_lc + nu_nota_mt + nu_nota_redacao)/3

xtile mediana = notag, nquantiles(2)
gen p_mediana = .
replace p_mediana = 1 if mediana == 2
replace p_mediana = 0 if mediana == 1

xtile quartis = notag, nquantiles(4)
gen p_quartil75 = .
replace p_quartil75 = 1 if quartis == 4
replace p_quartil75 = 0 if quartis < 4

xtile decis = notag, nquantiles(10)
gen p_decis90 = .
replace p_decis90 = 1 if decis == 10
replace p_decis90 = 0 if decis < 10

xtile centis = notag, nquantiles(100)
gen p_centil99 = .
replace p_centil99 = 1 if centis == 100
replace p_centil99 = 0 if centis < 100

save 2015_banco_final.dta, replace

*******************************************2016*********************************************
**********************************************************************************************

use banco_filtro_2016.dta, clear

*variável mulher*

gen mulher = .
replace mulher = 1 if tp_sexo == "F"
replace mulher = 0 if tp_sexo == "M"

* variáveis cor*

gen branco = .
replace branco = 1 if tp_cor_raca == 1
replace branco = 0 if tp_cor_raca != 1
replace branco = . if tp_cor_raca == 0 | tp_cor_raca == 6

gen pardo = .
replace pardo = 1 if tp_cor_raca == 3
replace pardo = 0 if tp_cor_raca != 3
replace pardo = . if tp_cor_raca == 0 | tp_cor_raca == 6

gen preto = .
replace preto = 1 if tp_cor_raca == 2
replace preto = 0 if tp_cor_raca != 2
replace preto = . if tp_cor_raca == 0 | tp_cor_raca == 6

gen amarelo = .
replace amarelo = 1 if tp_cor_raca == 4
replace amarelo = 0 if tp_cor_raca != 4
replace amarelo = . if tp_cor_raca == 0 | tp_cor_raca == 6

gen indigena = .
replace indigena = 1 if tp_cor_raca == 5
replace indigena = 0 if tp_cor_raca != 5
replace indigena = . if tp_cor_raca == 0 | tp_cor_raca == 6

*variáveis escolaridade*

gen n_estudo = .
replace n_estudo = 1 if q001 == "A"
replace n_estudo = 0 if q001 != "A"
replace n_estudo = . if q001 == "H"

gen fund_inc = .
replace fund_inc = 1 if q001 == "B" | q001 == "C"
replace fund_inc = 0 if q001 != "B" & q001 != "C"
replace fund_inc = . if q001 == "H"

gen fund_comp = .
replace fund_comp = 1 if q001 == "D"
replace fund_comp = 0 if q001 != "D"
replace fund_comp = . if q001 == "H"

gen med_comp = .
replace med_comp = 1 if q001 == "E"
replace med_comp = 0 if q001 != "E"
replace med_comp = . if q001 == "H"

gen sup_comp = .
replace sup_comp = 1 if q001 == "F" | q001 == "G"
replace sup_comp = 0 if q001 != "F" & q001 != "G"
replace sup_comp = . if q001 == "H"

* variável renda *

gen ate_1sm = .
replace ate_1sm = 1 if q006 == "B"
replace ate_1sm = 0 if q006 != "B"
replace ate_1sm = . if q006 == "A" | q006 == ""

gen de_1sm_a_2sm = .
replace de_1sm_a_2sm = 1 if q006 == "C" | q006 == "D"
replace de_1sm_a_2sm = 0 if q006 != "C" & q006 != "D"
replace de_1sm_a_2sm= . if q006 == "A" | q006 == ""


gen de_2sm_a_5sm = .
replace de_2sm_a_5sm = 1 if q006 == "E" | q006 == "F" | q006 == "G" | q006 == "H"
replace de_2sm_a_5sm = 0 if q006 != "E" & q006 != "F" & q006 != "G" & q006 != "H"
replace de_2sm_a_5sm= . if q006 == "A" | q006 == ""

gen de_5sm_a_10sm = .
replace de_5sm_a_10sm = 1 if q006 == "I" | q006 == "J" | q006 == "K" | q006 == "L" | q006 == "M"
replace de_5sm_a_10sm = 0 if q006 != "I" & q006 != "J" & q006 != "K" & q006 != "L" & q006 != "M"
replace de_5sm_a_10sm= . if q006 == "A" | q006 == ""

gen de_10sm_mais = .
replace de_10sm_mais = 1 if q006 == "N" | q006 == "O" | q006 == "P" | q006 == "Q"
replace de_10sm_mais = 0 if q006 != "N" & q006 != "O" & q006 != "P" & q006 != "Q"
replace de_10sm_mais= . if q006 == "A" | q006 == ""

* NOTAS *

drop if nu_nota_cn == 0 | nu_nota_cn == . | nu_nota_ch == 0 | nu_nota_ch == . | nu_nota_lc == 0 | nu_nota_lc == . | nu_nota_mt == 0 | nu_nota_mt == . | nu_nota_redacao == 0 | nu_nota_redacao == .

gen notag = (nu_nota_cn + nu_nota_ch + nu_nota_lc + nu_nota_mt + nu_nota_redacao)/3

xtile mediana = notag, nquantiles(2)
gen p_mediana = .
replace p_mediana = 1 if mediana == 2
replace p_mediana = 0 if mediana == 1

xtile quartis = notag, nquantiles(4)
gen p_quartil75 = .
replace p_quartil75 = 1 if quartis == 4
replace p_quartil75 = 0 if quartis < 4

xtile decis = notag, nquantiles(10)
gen p_decis90 = .
replace p_decis90 = 1 if decis == 10
replace p_decis90 = 0 if decis < 10

xtile centis = notag, nquantiles(100)
gen p_centil99 = .
replace p_centil99 = 1 if centis == 100
replace p_centil99 = 0 if centis < 100

save 2016_banco_final.dta, replace
