# Relatrio_codeReview
# Pontos Positivos

Estrutura modular bem definida, separando recursos, keywords e testes.

Uso de RequestsLibrary adequado para sessões e chamadas HTTP.

Boa prática de centralizar variáveis (BASE_URL, USERNAME, PASSWORD) em resource.robot.

Keyword Gerar Token armazena o token em variável de suíte, permitindo reuso em diferentes testes.

Casos de teste possuem nomes descritivos e objetivos.

Uso de Log To Console para exibir respostas e facilitar a depuração.

# Pontos de Melhoria

*Validação limitada*

Apenas o status_code é verificado. Não há checagem dos campos retornados no JSON, o que reduz a confiabilidade dos testes.

*Sessões duplicadas*

A sessão Criar Sessao Booker é recriada em cada teste. Poderia ser configurada no Suite Setup.

*Dados sensíveis*

Credenciais (USERNAME e PASSWORD) estão fixas em resource.robot. Melhor prática seria parametrizá-las via variáveis de ambiente ou arquivo externo.

*Dados estáticos*

O teste Criar Nova Reserva usa valores fixos (nome, datas, preço). Isso dificulta a execução repetida sem colisões de dados.

*Consistência no corpo da requisição*

No campo bookingdates, foi usada uma string JSON em vez de um dicionário aninhado. Isso pode causar inconsistências.

*Teste incompleto*

O caso de teste Atualizar Reserva em bookings.robot não está finalizado.

# Sugestões de Melhoria

Criar Keywords personalizadas para operações comuns como “Criar Reserva”, “Validar Reserva”, “Deletar Reserva”.

Implementar validação de contratos, verificando campos específicos no JSON de resposta (firstname, lastname, bookingdates).

Configurar Suite Setup para criar sessão e autenticar uma vez, evitando repetição.

Parametrizar credenciais e dados de teste em variáveis externas ou arquivos .env.

Usar dados dinâmicos (gerar nomes e datas automaticamente) para maior robustez.

Finalizar o caso Atualizar Reserva e incluir cenários adicionais (ex.: deleção e busca de reservas por ID).

Refatorar o corpo das requisições, substituindo strings JSON por dicionários aninhados.
