# ACBrPIXCD Demo

Sistema gestão de pagamentos PIX desenvolvido em Delphi utilizando os componentes ACBr (Automação Comercial Brasil).

## 📋 Sobre o Projeto

O ACBrPIXCD Demo é uma aplicação desktop que demonstra a integração com diversos PSPs (Provedores de Serviço de Pagamento) para gerenciamento completo de transações PIX, incluindo geração de cobranças, consultas, estornos.

## ✨ Funcionalidades

### 🔑 Gerenciamento de Chaves PIX
- Cadastro completo de chaves PIX (CPF, CNPJ, E-mail, Telefone, Chave Aleatória)
- Configuração individualizada de PSP por chave
- Edição e exclusão de chaves
- Visualização em grade com todos os dados

### 🏦 PSPs Suportados
- **Shipay**
- **Banco do Brasil**
- **Itaú**
- **Santander**
- **Sicredi**
- **Sicoob**
- **PagSeguro**
- **GerenciaNet**
- **Bradesco**
- **PIXPDV**
- **Inter**
- **Ailos**
- **Matera**
- **Cielo**
- **Mercado Pago**
- **Gate2All**
- **Banrisul**
- **C6 Bank**
- **AppLess**

### 💰 Gestão de Cobranças
- Geração de cobranças PIX com QR Code
- Definição de valor, nome e documento do pagador
- Exibição de QR Code para pagamento
- Cópia rápida do código PIX Copia e Cola
- Consulta automática de status do pagamento
- Cancelamento de cobranças

### 📊 Controle de Movimentos
- Visualização completa de todas as transações PIX
- Cadastro dos movimentos:
  - Dados da transação (TxID, E2E, Status)
  - Valores (original, pago, juros, multa, desconto)
  - Informações do pagador
  - Dados de devolução/estorno
  - Metadados e problemas
- Atualização em tempo real

### 🔄 Estorno/Devolução
- Estorno de transações
- Acompanhamento do status de devolução
- Histórico completo

### ⚙️ Configurações
- **Banco de Dados**: Configuração do Firebird (local ou remoto)
- **PSP por Chave**: Certificados digitais, tokens, credenciais
- **Ambiente**: Produção ou Homologação
- **Timeouts e parâmetros**: Configuráveis por PSP

## 🛠️ Tecnologias Utilizadas

- **Delphi** (VCL)
- **FireDAC** (Acesso a dados)
- **Firebird 2.5** (Banco de dados)
- **ACBr (Projeto ACBr)** - Componentes:
  - ACBrPixCD
  - ACBrOpenSSLUtils
  - Múltiplos PSPs (ACBrPSP*)
- **INI Files** (Configurações)

## 📦 Estrutura do Projeto

```
ACBrPIXCDDemo/
├── src/
│   ├── view/                    # Formulários da aplicação
│   │   ├── unt.view.principal   # Tela principal com menu
│   │   ├── untChavePix          # Listagem de chaves PIX
│   │   ├── untChavePixCadastro  # Cadastro/edição de chaves
│   │   ├── untGerarCobranca     # Geração de cobranças
│   │   ├── untExibirQrCodePIX   # Exibição de QR Code
│   │   ├── untCobranca          # Listagem de movimentos
│   │   ├── untExibirDevolucaoPIX # Estorno de transações
│   │   └── untConfigBancoDados  # Configuração do banco
│   └── data.module/
│       └── untDmConexao         # Módulo de conexão com BD
├── db/                          # Banco de dados Firebird
├── temp/                        # Arquivos temporários
├── log/                         # Logs de transações
└── config.ini                   # Configurações da aplicação
```

## 🗄️ Banco de Dados

### Tabelas Principais

**CHAVE_PIX** (31 campos)
- Dados básicos (razão social, endereço, tipo/chave)
- Configurações do PSP escolhido
- Credenciais e certificados (armazenados como BLOB)

**MOVIMENTO_PIX** (35 campos)
- Informações completas da transação
- Controle de status e valores
- Dados do pagador e devolução
- Metadados e rastreabilidade

## 🚀 Como Usar

### Pré-requisitos
- Delphi
- Firebird 2.5
- Componentes ACBr
- Credenciais válidas de um PSP

### Instalação

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/ACBrPIXCDDemo.git
```

2. Abra o projeto `ACBrPIXCDDemo.dproj` no Delphi

3. Configure o banco de dados:
   - Use o banco de exemplo em `db/ACBRPIXCDDEMO.FDB`

4. Compile e execute o projeto

### Configuração Inicial

1. **Configurar Banco de Dados**
   - Menu: Configurações → Banco de Dados
   - Informe: caminho do arquivo .fdb, servidor, porta, usuário e senha
   - Teste a conexão antes de salvar

2. **Cadastrar Chave PIX**
   - Menu: Chaves PIX
   - Clique em "Novo"
   - Preencha os dados básicos
   - Selecione o PSP e configure as credenciais
   - Configure certificados digitais (se necessário)

3. **Gerar Cobrança**
   - Menu: Gerar Cobrança
   - Selecione a chave PIX
   - Informe valor e dados do pagador
   - Clique em "Gerar QR Code"
   - Compartilhe o QR Code ou código Copia e Cola

## 📝 Configuração de PSPs

Cada PSP possui requisitos específicos

*Consulte a documentação de cada PSP para obter as credenciais necessárias.*

## 🔐 Segurança

- Credenciais armazenadas de forma segura no banco de dados
- Certificados digitais armazenados como BLOB
- Senhas protegidas
- Logs detalhados de todas as operações
- Arquivos temporários organizados por PSP

## 📁 Arquivos Gerados

### temp/pix/{psp}/
- Certificados extraídos (.key, .pem)
- QR Codes gerados

### log/pix/{psp}/
- Logs diários das operações (formato: YYYYMMDD.log)
- Requisições e respostas HTTP
- Erros e exceções

## 📄 Licença

Este projeto é licenciado sob os termos especificados no arquivo [LICENSE](LICENSE).

## 🔗 Links Úteis

- [Projeto ACBr](https://projetoacbr.com.br/)
- [Documentação ACBrPixCD](https://acbr.sourceforge.io/ACBrLib/ConfiguracoesdaBiblioteca23.html)
- [Especificação PIX - Banco Central](https://www.bcb.gov.br/estabilidadefinanceira/pix)

## 👥 Autores

Desenvolvido como demonstração das capacidades do componente ACBrPixCD.

**Nota**: Este é um projeto de demonstração. Para uso em produção, implemente medidas adicionais de segurança e valide todas as operações conforme as normas do Banco Central do Brasil.
