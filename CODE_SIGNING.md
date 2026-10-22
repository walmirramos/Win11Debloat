# Code signing policy

## Estado atual

**Os executáveis publicados atualmente não possuem assinatura digital.** A candidatura à SignPath Foundation está em análise. Não há certificado, integração ativa ou aprovação de assinatura confirmada. A automação gera somente pacotes sem assinatura; ela não substitui os arquivos das Releases automaticamente.

## Responsabilidades

- **Mantenedor, autor e revisor:** Walmir Ramos (Dubbox), [@walmirramos](https://github.com/walmirramos).
- **Aprovador previsto para futuras assinaturas:** Walmir Ramos (Dubbox). A configuração efetiva dependerá da aprovação e das exigências do provedor.
- Alterações recebidas por pull request devem ser revisadas pelo mantenedor antes de entrar na versão destinada à assinatura.

## Origem dos arquivos

O workflow [Build portable EXE](https://github.com/walmirramos/Win11Debloat/blob/traducao-pt-br/.github/workflows/build-portable.yml) executa os testes, compila o iniciador a partir de `Launcher/Launcher.cs` e gera o pacote portátil. O arquivo `SOURCE.json` dentro do ZIP registra o commit dos fontes, a versão e o SHA-256 do executável. Um arquivo separado registra os hashes do ZIP e do EXE. A geração exige uma cópia dos fontes sem alterações pendentes de commit.

A compilação e a publicação são etapas separadas. Os artefatos do GitHub Actions expiram após 30 dias; downloads públicos estáveis continuam em Releases. A execução da automação não aplica ajustes no Windows nem inicia a interface do programa.

## Integração futura

Se a candidatura for aprovada, a integração deverá verificar a origem do artefato e exigir aprovação manual de cada solicitação de assinatura. As contas envolvidas devem atender aos requisitos de autenticação de dois fatores do GitHub e da SignPath. Credenciais não devem ser incluídas nos fontes, nos pacotes ou nos logs.

As condições específicas para forks precisam ser confirmadas com a SignPath. Não se presume que a aprovação esteja garantida. A atribuição exigida pelo provedor será adicionada após a ativação do serviço. O projeto continua respeitando sua licença e os avisos de direitos autorais.

## Privacidade

Consulte a [política de privacidade](PRIVACY.md). A assinatura digital, quando disponível, atesta a identidade do editor e a integridade do arquivo; não garante que todo antivírus aceitará o programa.
