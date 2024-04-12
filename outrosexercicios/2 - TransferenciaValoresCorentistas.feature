Funcionalidade: Transferência de valores entre correntistas

Como um correntista do banco
Gostaria de informar os dados para uma transferencia bancária
Para efetivar a tranferencia do valor desejado para o correntista de destino

Esquema do Cenário: Validar dados da transferência
    Dado que informo o banco <banco>, agência <agencia>, conta <conta>, valor <valor> e data <data_efetivacao>
    Quando clico no botão "Transferir" para efetivar a transferência
    Então os dados deven verificados 
    E deve ser retornado o status HTTP <status> 
    E a mensagem de retorno <msg_validacao>

Exemplos:
    | banco | agencia | conta   | valor  | data_efetivacao | status | msg_validacao                                                 |
    | 341   | 3048    | 00235-4 | 100,00 | HOJE            | 200    | OK                                                            |
    |       | 3048    | 00235-4 | 100,00 | HOJE            | 404    | O banco de destino deve ser informado                         |
    | 341   |         | 00235-4 | 100,00 | HOJE            | 404    | A agência de destino deve ser informada                       |
    | 341   | 3048    |         | 100,00 | HOJE            | 404    | A conta de destino deve ser informada                         |
    | 341   | 3048    | 00235-4 |   0,00 | HOJE            | 404    | O valor deve ser informado                                    |   
    | 341   | 3048    | 00235-4 |  -1,00 | HOJE            | 404    | O valor deve ser válido                                       |   
    | 341   | 3048    | 00235-4 | 100,00 | 30/02/2024      | 404    | A data para transferência deve ser válida                     |   
    | 341   | 3048    | 00235-4 | 100,00 | ONTEM           | 404    | Data para a transferência deve ser o dia de hoje ou superior  |


Esquema do Cenário: Realizar transferência de valor com sucesso para o correntista de destino no mesmo dia
    Dado que informo dados de um correntista de destino válido para o <banco>, agência <agencia>, conta <conta> com saldo <saldo>
    E informo para transferir o valor <valor> na data <data_efetivacao>
    Quando clico no botão "Transferir" para efetivar a transferência
    Então a transferência deve ser efetivada corretamente

Exemplos:
    | banco | agencia | conta   | saldo   | valor  | data_efetivacao | 
    | 341   | 3048    | 00235-4 | 200,00  | 100,00 | HOJE            | 
    | 001   | 0234    | 12345-3 | 200,00  | 199,99 | HOJE            | 
    | 237   | 4321    | 00987-6 | 200,00  |   0,01 | HOJE            | 


Esquema do Cenário: Agendar com sucesso a transferência de valor para o correntista de destino em data posterior ao dia de hoje
    Dado que informo dados de um correntista de destino válido para o <banco>, agência <agencia>, conta <conta> com saldo <saldo>
    E informo para transferir o valor <valor> na data <data_efetivacao>
    Quando clico no botão "Transferir" para efetivar a transferência
    Então a transferência deve ser agendada corretamente
    E deve ser exibido para o cliente um aviso do agendamento

Exemplos:
    | banco | agencia | conta   | saldo   | valor  | data_efetivacao                   | 
    | 341   | 3048    | 00235-4 | 200,00  | 100,00 | AMANHÃ                            | 
    | 001   | 0234    | 12345-3 | 200,00  |  80,00 | SEGUNDA-FEIRA DA SEMANA SEGUINTE  | 
    | 237   | 4321    | 00987-6 | 200,00  |  40,00 | AMANHÃ                            | 


Esquema do Cenário: Validar saldo da conta corrente de origem 
    Dado que informo dados de um correntista de destino válido para o <banco>, agência <agencia>, conta <conta> 
    E possuo saldo <saldo>
    E informo para transferir o valor <valor> na data <data_efetivacao>
    Quando clico no botão "Transferir" para efetivar a transferência
    Então deve ser exibida a mensagem de que não há saldo suficiente para efetivar a transferência

Exemplos:
    | banco | agencia | conta   | saldo   | valor  | data_efetivacao | 
    | 341   | 3048    | 00235-4 | 200,00  | 300,00 | HOJE            | 
    | 001   | 0234    | 12345-3 | 100,00  | 100,01 | HOJE            | 
    | 237   | 4321    | 00987-6 |   0,00  |   1,00 | HOJE            | 
    | 341   | 3048    | 00765-1 | -10,00  |   0,01 | HOJE            | 
