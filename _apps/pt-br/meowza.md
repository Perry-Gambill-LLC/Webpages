---
# Brazilian Portuguese translation of _apps/meowza.md. Every other setting
# (icon, App Store link, support email, ...) comes from the English page.
# source_hash records which version of the English page this translates;
# see "Translations" in README.md before changing it.
tagline: Converse com o Mr. Whiskers, um gato companheiro com IA, simpático e que se lembra das suas conversas.
description: Suporte e Política de Privacidade do app Meowza, da Perry & Gambill LLC.
privacy_effective_date: 3 de agosto de 2026
source_hash: 1baa80c483fd
---
{%- assign source = site.apps | where: "slug", page.slug | where: "lang", site.lang | first -%}
{%- assign email = source.support_email | default: site.email -%}

## 1. Introdução {#introduction}

Boas-vindas. Esta Política de Privacidade explica como a Perry & Gambill LLC ("nós" ou "nosso") coleta, usa, divulga e protege suas informações quando você usa o Meowza (o "App"), um companheiro de conversa com inteligência artificial. Leia esta política com atenção. Se você não concordar com os termos, pare de usar o App.

Reservamo-nos o direito de alterar esta Política de Privacidade a qualquer momento. Avisaremos sobre mudanças significativas atualizando a data de "Última atualização" acima e, quando for o caso, por meio de notificações no app ou por e-mail.

## 2. Informações que coletamos {#information-we-collect}

### 2.1 Informações que você fornece diretamente {#information-you-provide-directly}

- **Informações da conta:** nome, endereço de e-mail e credenciais de login no momento do cadastro.
- **Dados do perfil:** informações opcionais do perfil que você escolher fornecer, incluindo sua data de nascimento (usada para personalizar a experiência com seu companheiro, por exemplo, para reconhecer seu aniversário).
- **Mensagens do chat:** as mensagens que você envia ao companheiro de IA. Elas são armazenadas com criptografia em repouso AES-256-GCM e usadas para gerar as respostas da IA e manter a continuidade da conversa.
- **Comunicações:** feedback ou solicitações de suporte que você nos enviar.
- **Informações de pagamento:** se aplicável, nome para cobrança, endereço e dados da forma de pagamento (processados com segurança por processadores de pagamento terceirizados — não armazenamos números completos de cartão).

### 2.2 Informações coletadas automaticamente {#information-collected-automatically}

- **Dados de uso:** recursos acessados, ações realizadas, duração das sessões e frequência de uso.
- **Informações do dispositivo:** tipo de dispositivo, sistema operacional, tipo e versão do navegador e identificadores exclusivos do dispositivo.
- **Dados de registro:** endereço IP, data e hora de acesso, registros de erros e URLs de referência.
- **Cookies e tecnologias de rastreamento:** usamos cookies, web beacons e tecnologias semelhantes para manter sessões e analisar padrões de uso.

### 2.3 Informações de terceiros {#information-from-third-parties}

- **Provedores de OAuth:** se você iniciar sessão com a Apple, recebemos informações básicas do perfil (nome e e-mail), conforme permitido pelas suas configurações com esse provedor.
- **Parceiros de análise:** estatísticas de uso agregadas e anonimizadas de serviços de análise.

## 3. Como usamos suas informações {#how-we-use-your-information}

Usamos as informações que coletamos para:

- **Fornecer e operar** o App e seus recursos.
- **Autenticar** sua identidade e manter sessões seguras.
- **Gerar respostas da IA:** suas mensagens do chat e o contexto do seu perfil são enviados a um modelo de IA de terceiros (a API da OpenAI) para gerar as respostas do companheiro. O conteúdo das mensagens é transmitido com segurança e não é usado para treinar modelos de IA.
- **Manter a memória das conversas:** armazenamos um resumo compactado das conversas anteriores para que o companheiro se lembre do contexto entre as sessões. Esse resumo é criptografado em repouso.
- **Personalizar** sua experiência com base no seu perfil e no seu histórico de conversas.
- **Processar transações** e enviar as confirmações e recibos correspondentes.
- **Enviar notificações push** para avisar você quando seu companheiro responder.
- **Comunicar-nos** com você sobre atualizações, novos recursos, alertas de segurança e suporte.
- **Melhorar o App** por meio de análises, rastreamento de bugs e pesquisas com usuários.
- **Fazer cumprir nossos Termos de Serviço** e proteger a segurança e a integridade do App.
- **Cumprir obrigações legais** e responder a solicitações legítimas de autoridades governamentais.

Não vendemos suas informações pessoais a terceiros.

## 4. Bases legais para o tratamento (GDPR) {#legal-bases-for-processing-gdpr}

Se você estiver no Espaço Econômico Europeu (EEE) ou no Reino Unido, nossas bases legais para o tratamento dos seus dados pessoais são:

- **Necessidade contratual:** criação da conta e fornecimento das funcionalidades principais do app.
- **Interesses legítimos:** monitoramento de segurança, prevenção de fraudes e melhoria do produto.
- **Obrigação legal:** registros fiscais e resposta a solicitações legítimas.
- **Consentimento:** e-mails de marketing e análises opcionais.

Você pode retirar seu consentimento a qualquer momento nos casos em que nos baseamos nele, sem afetar a licitude do tratamento realizado anteriormente.

## 5. Compartilhamento das suas informações {#sharing-your-information}

Podemos compartilhar suas informações com:

- **Prestadores de serviços:** fornecedores terceirizados de confiança que nos ajudam a operar o App, incluindo a Amazon Web Services (infraestrutura em nuvem e notificações push pelo Amazon SNS), a OpenAI (inferência de modelos de IA), a Apple (autenticação e processamento de pagamentos) e provedores de análise. Essas partes são obrigadas por contrato a proteger seus dados. As mensagens do chat são transmitidas à OpenAI exclusivamente para gerar respostas da IA e, conforme nosso contrato de serviço, não são retidas pela OpenAI para fins de treinamento de modelos.
- **Transferências empresariais:** em caso de fusão, aquisição ou venda de ativos, seus dados poderão ser transferidos. Avisaremos você antes que seus dados fiquem sujeitos a uma política de privacidade diferente.
- **Exigências legais:** quando exigido por lei, ordem judicial ou autoridade governamental, ou para proteger os direitos, a propriedade ou a segurança dos nossos usuários ou do público.
- **Com seu consentimento:** em quaisquer outras circunstâncias em que você tenha autorizado expressamente a divulgação.

## 6. Retenção de dados {#data-retention}

Mantemos suas informações pessoais enquanto sua conta estiver ativa ou conforme necessário para prestar os serviços. Você pode solicitar a exclusão da sua conta a qualquer momento (veja a Seção 8). Após a exclusão, poderemos manter determinados dados de forma anonimizada ou agregada, ou quando exigido por lei, por um período de no máximo **90 dias** a partir da sua solicitação.

## 7. Segurança dos dados {#data-security}

Adotamos medidas técnicas e organizacionais padrão do setor para proteger suas informações, incluindo:

- Criptografia dos dados em trânsito (TLS/HTTPS) e em repouso (criptografia de envelope AES-256-GCM via AWS KMS para todas as mensagens do chat e resumos de conversas).
- Controles de acesso que limitam o acesso aos dados apenas a pessoas autorizadas.
- Auditorias de segurança e avaliações de vulnerabilidades regulares.

Nenhum método de transmissão pela internet ou de armazenamento eletrônico é 100% seguro. Embora nos esforcemos para usar meios comercialmente aceitáveis para proteger seus dados, não podemos garantir segurança absoluta.

## 8. Seus direitos e escolhas {#your-rights-and-choices}

Dependendo de onde você estiver, você pode ter os seguintes direitos:

- **Acesso:** solicitar uma cópia dos dados pessoais que mantemos sobre você.
- **Correção:** solicitar a correção de dados inexatos ou incompletos.
- **Exclusão:** solicitar a exclusão dos seus dados pessoais ("direito ao esquecimento").
- **Portabilidade:** receber seus dados em um formato estruturado e legível por máquina.
- **Oposição:** opor-se ao tratamento baseado em interesses legítimos.
- **Restrição:** solicitar que limitemos o tratamento dos seus dados em determinadas circunstâncias.
- **Cancelamento de marketing:** cancelar a inscrição em e-mails promocionais pelo link presente em qualquer um deles ou nas configurações da sua conta.

Para exercer qualquer um desses direitos, entre em contato pelo endereço indicado na Seção 11. Responderemos em até **30 dias**.

## 9. Privacidade de crianças {#childrens-privacy}

O App não é direcionado a crianças menores de **13** anos (ou **16** no EEE). Não coletamos intencionalmente informações pessoais de crianças. Se tomarmos conhecimento de que coletamos inadvertidamente dados de uma criança abaixo da idade aplicável, tomaremos medidas para excluí-los prontamente. Se você acredita que uma criança nos forneceu informações pessoais, entre em contato conosco imediatamente.

## 10. Links e serviços de terceiros {#third-party-links-and-services}

O App pode conter links para sites de terceiros ou se integrar a serviços de terceiros. Esta Política de Privacidade não se aplica a esses serviços externos. Recomendamos que você leia as políticas de privacidade de quaisquer serviços de terceiros que acessar pelo App.

## 11. Fale conosco {#contact-us}

Se você tiver dúvidas, preocupações ou solicitações sobre esta Política de Privacidade, entre em contato pelo e-mail [{{ email }}](mailto:{{ email }}).

Se você estiver no EEE e achar que não tratamos suas preocupações adequadamente, você tem o direito de apresentar uma reclamação à autoridade local de proteção de dados.

## 12. Alterações nesta política {#changes-to-this-policy}

Podemos atualizar esta Política de Privacidade periodicamente. Quando isso acontecer, revisaremos a data de "Última atualização" no topo desta página. Em caso de alterações relevantes, daremos um aviso mais visível (como um banner no app ou uma notificação por e-mail). Ao continuar usando o App depois que as alterações entrarem em vigor, você aceita a política revisada.

*Esta Política de Privacidade foi atualizada pela última vez em 17 de maio de 2026.*
