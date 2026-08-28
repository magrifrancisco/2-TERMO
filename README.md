# 2° Termo - Repositório de Atividades Acadêmicas

V2.0

## Descrição do projeto

Este repositório reúne as atividades, exercícios e projetos desenvolvidos durante o segundo termo do curso, abrangendo conteúdos de programação, desenvolvimento web e modelagem de dados. O objetivo é organizar os materiais das aulas e facilitar o acompanhamento das práticas realizadas em diferentes áreas do conhecimento.

## Tecnologias utilizadas

- JavaScript
- Node.js
- HTML5
- CSS
- Git e GitHub
- VS Code
- Pacote `readline-sync` para entrada de dados no terminal

## Estrutura de pastas

```text
2°TERMO/
├── README.md
├── package.json
├── BackEnd/
│   ├── package.json
│   ├── ext.js
│   ├── Laços/
│   │   ├── array.js
│   │   ├── array2.js
│   │   ├── ex5.js
│   │   └── texto_para_gerar_readme.txt
├── LIMA/
│   ├── 01-AULA/
│   │   └── index.html
│   ├── AULA02/
│   │   ├── index.html
│   │   ├── equipe.html
│   │   └── PROJETO/
│   │       ├── index.html
│   │       ├── cliente.html
│   │       ├── delivery.html
│   │       ├── estoque.html
│   │       ├── fidelidade.html
│   │       ├── funcionario.html
│   │       ├── pagamento.html
│   │       ├── pedidos.html
│   │       └── produto.html
│   └── AULA02.zip
├── BCD/
│   └── AULA03/
│       └── MODELO_RELACIONAMENTOS_CONCEITUAL/
│           ├── CONCEITUAL_1.brM
│           └── Modelo_Escola.brM
└── .git/
```

## Resumo dos exercícios por aula

### Backend / JavaScript

- `BackEnd/ext.js`: arquivo de apoio para estudos e testes de execução em Node.js.
- `BackEnd/Laços/array.js`: exercício com laços de repetição e contagem.
- `BackEnd/Laços/array2.js`: exemplo de acesso a elementos de array e impressão no console.
- `BackEnd/Laços/ex5.js`: sistema de controle de qualidade com leitura de pesos, cálculo de média e aprovação/reprovação do lote.

### LIMA / Aula 1

- `LIMA/01-AULA/index.html`: estrutura inicial de página HTML, demonstrando a criação da primeira página em sala.

### LIMA / Aula 2

- `LIMA/AULA02/index.html`: prática com tags HTML, listas de elementos semânticos, marcações e blocos de conteúdo.
- `LIMA/AULA02/PROJETO/index.html`: página inicial de um projeto fictício para cafeteria ou sistema de vendas.
- Arquivos adicionais em `LIMA/AULA02/PROJETO/`: páginas de cliente, produto, pedidos, estoque, funcionário, pagamento, fidelidade e entrega, compondo uma pequena interface web.

### BCD / Aula 3

- `BCD/AULA03/MODELO_RELACIONAMENTOS_CONCEITUAL/CONCEITUAL_1.brM`: modelo conceitual de relacionamento.
- `BCD/AULA03/MODELO_RELACIONAMENTOS_CONCEITUAL/Modelo_Escola.brM`: diagrama conceitual relacionado ao contexto escolar.

> O workspace contém conteúdos das aulas 1, 2 e 3, além de exercícios de backend. As aulas 4 e 5 não aparecem no material atual, mas a estrutura do repositório permite sua inclusão futura.

## Instruções para executar os arquivos com Node.js

Para executar scripts JavaScript no terminal, siga os passos abaixo:

1. Abra o terminal no diretório do projeto.
2. Acesse a pasta do backend:

```bash
cd BackEnd/Laços
```

3. Execute um dos arquivos disponíveis:

```bash
node array.js
node array2.js
node ex5.js
```

Se quiser testar a aplicação principal do backend, também pode acessar a pasta `BackEnd`:

```bash
cd BackEnd
node ext.js
```

Certifique-se de que o Node.js esteja instalado no computador. Caso necessário, verifique com:

```bash
node -v
```

## Instruções de Git

### Inicialização

```bash
git init
```

### Adicionar arquivos

```bash
git add .
```

### Registrar alteração

```bash
git commit -m "Adiciona atividades do 2° termo"
```

### Enviar para repositório remoto

```bash
git branch -M main
git remote add origin <URL_DO_REPOSITÓRIO>
git push -u origin main
```

### Atualizar alterações locais

```bash
git pull origin main
```

## Autor

Francisco Miguel Magri

## Observações finais

Este repositório serve como organização dos materiais de estudo e exercícios práticos realizados no segundo termo, combinando lógica de programação, desenvolvimento web e fundamentos de banco de dados.
