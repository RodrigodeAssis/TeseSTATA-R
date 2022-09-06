* ESTATÍSTICA DESCRITIVA *

clear

cd "C:\Users\Rodrigo\Documents\Rodrigo\Tese\Tese\Dados\ENEM\2012_2016"

use 2009_banco_final.dta, clear

tabstat notag mulher branco pardo preto amarelo indigena ate_1sm de_1sm_a_2sm de_2sm_a_5sm de_5sm_a_10sm de_10sm_mais n_estudo fund_inc fund_comp med_comp sup_comp, columns(statistics)

gen cor = .
replace cor = 1 if  branco == 1
replace cor = 2 if preto == 1
replace cor = 3 if pardo == 1
replace cor = 4 if amarelo == 1
replace cor = 5 if indigena == 1

tabstat notag, by (cor) s(mean sd min max)

tabstat notag, by (mulher) s(mean sd min max)

tabstat notag if mulher == 1, by (cor) s(mean sd min max)
tabstat notag if mulher == 0, by (cor) s(mean sd min max)

gen renda = .
replace renda = 1 if ate_1sm == 1
replace renda = 2 if de_1sm_a_2sm == 1
replace renda = 3 if de_2sm_a_5sm == 1
replace renda = 4 if de_5sm_a_10sm == 1
replace renda = 5 if de_10sm_mais == 1

tabstat notag, by (renda) s(mean sd min max)

gen escolaridade = .
replace escolaridade = 1 if n_estudo == 1
replace escolaridade = 2 if fund_inc == 1
replace escolaridade = 3 if fund_comp == 1
replace escolaridade = 4 if med_comp == 1
replace escolaridade = 5 if sup_comp == 1

tabstat notag, by (escolaridade) s(mean sd min max)

********************************* 2010 *******************************
**********************************************************************

use 2010_banco_final.dta, clear

 /* tabela 1 */
tabstat notag mulher branco pardo preto amarelo indigena ate_1sm de_1sm_a_2sm de_2sm_a_5sm de_5sm_a_10sm de_10sm_mais n_estudo fund_inc fund_comp med_comp sup_comp, columns(statistics)

gen cor = .
replace cor = 1 if  branco == 1
replace cor = 2 if preto == 1
replace cor = 3 if pardo == 1
replace cor = 4 if amarelo == 1
replace cor = 5 if indigena == 1

tabstat notag, by (cor) s(mean sd min max) /* tabela 2 */

tabstat notag, by (mulher) s(mean sd min max) /* tabela 3 */

tabstat notag if mulher == 1, by (cor) s(mean sd min max)  /* tabela 4 */
tabstat notag if mulher == 0, by (cor) s(mean sd min max)  /* tabela 5 */

gen renda = .
replace renda = 1 if ate_1sm == 1
replace renda = 2 if de_1sm_a_2sm == 1
replace renda = 3 if de_2sm_a_5sm == 1
replace renda = 4 if de_5sm_a_10sm == 1
replace renda = 5 if de_10sm_mais == 1

tabstat notag, by (renda) s(mean sd min max)  /* tabela 6 */

gen escolaridade = .
replace escolaridade = 1 if n_estudo == 1
replace escolaridade = 2 if fund_inc == 1
replace escolaridade = 3 if fund_comp == 1
replace escolaridade = 4 if med_comp == 1
replace escolaridade = 5 if sup_comp == 1

tabstat notag, by (escolaridade) s(mean sd min max)  /* tabela 7 */

***********************************************2011***********************************************88
*****************************************************************************************************

use 2011_banco_final.dta, clear

 /* tabela 1 */
tabstat notag mulher branco pardo preto amarelo indigena ate_1sm de_1sm_a_2sm de_2sm_a_5sm de_5sm_a_10sm de_10sm_mais n_estudo fund_inc fund_comp med_comp sup_comp, columns(statistics)

gen cor = .
replace cor = 1 if  branco == 1
replace cor = 2 if preto == 1
replace cor = 3 if pardo == 1
replace cor = 4 if amarelo == 1
replace cor = 5 if indigena == 1

tabstat notag, by (cor) s(mean sd min max) /* tabela 2 */

tabstat notag, by (mulher) s(mean sd min max) /* tabela 3 */

tabstat notag if mulher == 1, by (cor) s(mean sd min max)  /* tabela 4 */
tabstat notag if mulher == 0, by (cor) s(mean sd min max)  /* tabela 5 */

gen renda = .
replace renda = 1 if ate_1sm == 1
replace renda = 2 if de_1sm_a_2sm == 1
replace renda = 3 if de_2sm_a_5sm == 1
replace renda = 4 if de_5sm_a_10sm == 1
replace renda = 5 if de_10sm_mais == 1

tabstat notag, by (renda) s(mean sd min max)  /* tabela 6 */

gen escolaridade = .
replace escolaridade = 1 if n_estudo == 1
replace escolaridade = 2 if fund_inc == 1
replace escolaridade = 3 if fund_comp == 1
replace escolaridade = 4 if med_comp == 1
replace escolaridade = 5 if sup_comp == 1

tabstat notag, by (escolaridade) s(mean sd min max)  /* tabela 7 */

***********************************************2012***********************************************88
*****************************************************************************************************

use 2012_banco_final.dta, clear

 /* tabela 1 */
tabstat notag mulher branco pardo preto amarelo indigena ate_1sm de_1sm_a_2sm de_2sm_a_5sm de_5sm_a_10sm de_10sm_mais n_estudo fund_inc fund_comp med_comp sup_comp, columns(statistics)

gen cor = .
replace cor = 1 if  branco == 1
replace cor = 2 if preto == 1
replace cor = 3 if pardo == 1
replace cor = 4 if amarelo == 1
replace cor = 5 if indigena == 1

tabstat notag, by (cor) s(mean sd min max) /* tabela 2 */

tabstat notag, by (mulher) s(mean sd min max) /* tabela 3 */

tabstat notag if mulher == 1, by (cor) s(mean sd min max)  /* tabela 4 */
tabstat notag if mulher == 0, by (cor) s(mean sd min max)  /* tabela 5 */

gen renda = .
replace renda = 1 if ate_1sm == 1
replace renda = 2 if de_1sm_a_2sm == 1
replace renda = 3 if de_2sm_a_5sm == 1
replace renda = 4 if de_5sm_a_10sm == 1
replace renda = 5 if de_10sm_mais == 1

tabstat notag, by (renda) s(mean sd min max)  /* tabela 6 */

gen escolaridade = .
replace escolaridade = 1 if n_estudo == 1
replace escolaridade = 2 if fund_inc == 1
replace escolaridade = 3 if fund_comp == 1
replace escolaridade = 4 if med_comp == 1
replace escolaridade = 5 if sup_comp == 1

tabstat notag, by (escolaridade) s(mean sd min max)  /* tabela 7 */

***********************************************2013***********************************************88
*****************************************************************************************************

use 2013_banco_final.dta, clear

 /* tabela 1 */
tabstat notag mulher branco pardo preto amarelo indigena ate_1sm de_1sm_a_2sm de_2sm_a_5sm de_5sm_a_10sm de_10sm_mais n_estudo fund_inc fund_comp med_comp sup_comp, columns(statistics)

gen cor = .
replace cor = 1 if  branco == 1
replace cor = 2 if preto == 1
replace cor = 3 if pardo == 1
replace cor = 4 if amarelo == 1
replace cor = 5 if indigena == 1

tabstat notag, by (cor) s(mean sd min max) /* tabela 2 */

tabstat notag, by (mulher) s(mean sd min max) /* tabela 3 */

tabstat notag if mulher == 1, by (cor) s(mean sd min max)  /* tabela 4 */
tabstat notag if mulher == 0, by (cor) s(mean sd min max)  /* tabela 5 */

gen renda = .
replace renda = 1 if ate_1sm == 1
replace renda = 2 if de_1sm_a_2sm == 1
replace renda = 3 if de_2sm_a_5sm == 1
replace renda = 4 if de_5sm_a_10sm == 1
replace renda = 5 if de_10sm_mais == 1

tabstat notag, by (renda) s(mean sd min max)  /* tabela 6 */

gen escolaridade = .
replace escolaridade = 1 if n_estudo == 1
replace escolaridade = 2 if fund_inc == 1
replace escolaridade = 3 if fund_comp == 1
replace escolaridade = 4 if med_comp == 1
replace escolaridade = 5 if sup_comp == 1

tabstat notag, by (escolaridade) s(mean sd min max)  /* tabela 7 */

***********************************************2014*************************************************
*****************************************************************************************************

use 2014_banco_final.dta, clear

 /* tabela 1 */
tabstat notag mulher branco pardo preto amarelo indigena ate_1sm de_1sm_a_2sm de_2sm_a_5sm de_5sm_a_10sm de_10sm_mais n_estudo fund_inc fund_comp med_comp sup_comp, columns(statistics)

gen cor = .
replace cor = 1 if  branco == 1
replace cor = 2 if preto == 1
replace cor = 3 if pardo == 1
replace cor = 4 if amarelo == 1
replace cor = 5 if indigena == 1

tabstat notag, by (cor) s(mean sd min max) /* tabela 2 */

tabstat notag, by (mulher) s(mean sd min max) /* tabela 3 */

tabstat notag if mulher == 1, by (cor) s(mean sd min max)  /* tabela 4 */
tabstat notag if mulher == 0, by (cor) s(mean sd min max)  /* tabela 5 */

gen renda = .
replace renda = 1 if ate_1sm == 1
replace renda = 2 if de_1sm_a_2sm == 1
replace renda = 3 if de_2sm_a_5sm == 1
replace renda = 4 if de_5sm_a_10sm == 1
replace renda = 5 if de_10sm_mais == 1

tabstat notag, by (renda) s(mean sd min max)  /* tabela 6 */

gen escolaridade = .
replace escolaridade = 1 if n_estudo == 1
replace escolaridade = 2 if fund_inc == 1
replace escolaridade = 3 if fund_comp == 1
replace escolaridade = 4 if med_comp == 1
replace escolaridade = 5 if sup_comp == 1

tabstat notag, by (escolaridade) s(mean sd min max)  /* tabela 7 */

***********************************************2015*************************************************
*****************************************************************************************************

use 2015_banco_final.dta, clear

 /* tabela 1 */
tabstat notag mulher branco pardo preto amarelo indigena ate_1sm de_1sm_a_2sm de_2sm_a_5sm de_5sm_a_10sm de_10sm_mais n_estudo fund_inc fund_comp med_comp sup_comp, columns(statistics)

gen cor = .
replace cor = 1 if  branco == 1
replace cor = 2 if preto == 1
replace cor = 3 if pardo == 1
replace cor = 4 if amarelo == 1
replace cor = 5 if indigena == 1

tabstat notag, by (cor) s(mean sd min max) /* tabela 2 */

tabstat notag, by (mulher) s(mean sd min max) /* tabela 3 */

tabstat notag if mulher == 1, by (cor) s(mean sd min max)  /* tabela 4 */
tabstat notag if mulher == 0, by (cor) s(mean sd min max)  /* tabela 5 */

gen renda = .
replace renda = 1 if ate_1sm == 1
replace renda = 2 if de_1sm_a_2sm == 1
replace renda = 3 if de_2sm_a_5sm == 1
replace renda = 4 if de_5sm_a_10sm == 1
replace renda = 5 if de_10sm_mais == 1

tabstat notag, by (renda) s(mean sd min max)  /* tabela 6 */

gen escolaridade = .
replace escolaridade = 1 if n_estudo == 1
replace escolaridade = 2 if fund_inc == 1
replace escolaridade = 3 if fund_comp == 1
replace escolaridade = 4 if med_comp == 1
replace escolaridade = 5 if sup_comp == 1

tabstat notag, by (escolaridade) s(mean sd min max)  /* tabela 7 */

***********************************************2016*************************************************
*****************************************************************************************************

use 2016_banco_final.dta, clear

 /* tabela 1 */
tabstat notag mulher branco pardo preto amarelo indigena ate_1sm de_1sm_a_2sm de_2sm_a_5sm de_5sm_a_10sm de_10sm_mais n_estudo fund_inc fund_comp med_comp sup_comp, columns(statistics)

gen cor = .
replace cor = 1 if  branco == 1
replace cor = 2 if preto == 1
replace cor = 3 if pardo == 1
replace cor = 4 if amarelo == 1
replace cor = 5 if indigena == 1

tabstat notag, by (cor) s(mean sd min max) /* tabela 2 */

tabstat notag, by (mulher) s(mean sd min max) /* tabela 3 */

tabstat notag if mulher == 1, by (cor) s(mean sd min max)  /* tabela 4 */
tabstat notag if mulher == 0, by (cor) s(mean sd min max)  /* tabela 5 */

gen renda = .
replace renda = 1 if ate_1sm == 1
replace renda = 2 if de_1sm_a_2sm == 1
replace renda = 3 if de_2sm_a_5sm == 1
replace renda = 4 if de_5sm_a_10sm == 1
replace renda = 5 if de_10sm_mais == 1

tabstat notag, by (renda) s(mean sd min max)  /* tabela 6 */

gen escolaridade = .
replace escolaridade = 1 if n_estudo == 1
replace escolaridade = 2 if fund_inc == 1
replace escolaridade = 3 if fund_comp == 1
replace escolaridade = 4 if med_comp == 1
replace escolaridade = 5 if sup_comp == 1

tabstat notag, by (escolaridade) s(mean sd min max)  /* tabela 7 */
