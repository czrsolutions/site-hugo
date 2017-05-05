+++
title = "A experiência de construir um app usando React Native"
date = "2017-05-03T13:47:08+02:00"
author = "Cibele Reis"
tags = ["react-native"]
categories = ["programming"]
banner = "img/posts/react.png"
+++

O React Native é um projeto que foi desenvolvido pelos engenheiros do Facebook e
tem como lema "learn once, write anywhere", ou seja, é uma ferramenta que permite
o desenvolvimento de aplicativos nativos (Android e iOS) utilizando uma só linguagem.

Diferente dos frameworks para construir aplicativos híbridos (ex. Cordova), o React
Native, apesar de permitir o reuso do mesmo codebase para plataformas diferentes, não
se propõe ao "write once, run everywhere" pois cada plataforma possui características
que devem ser respeitadas.


## As vantagens do React Native

**1. É Nativo**

O React Native roda em uma thread JavaScript que se comunica com componentes nativos
 em tempo de execução, portanto os aplicativos desenvolvidos com esse framework
 apresentam uma excelente performance no Android e iOS e passam a sensação de nativos.

**2. Desenvolvimento Eficiente**

As alterações que você realizar no código serão visualizadas imediatamente. Isso significa
que não haverá mais espera até que seu código compile e seu aplicativo reinicie após cada
mudança que você realize!

**3. Fácil de Aprender**

Se você já é familiarizado(a) com JavaScript, a curva de aprendizado será muito menor.
Além disso, a documentação na internet é vasta e muito provavelmente você encontrará as
soluções para os problemas que vier a enfrentar.

**4. Comunidade Ativa**

Como grande parte do código do seu aplicativo em React Native será em JavaScript, você
poderá desfrutar de diversos tutoriais, documentações e exemplos disponibilizados pela comunidade.


## A minha experiência com React Native

Até eu começar a usar o React Native, ainda não havia tido a oportunidade de fazer um aplicativo.
Além disso, meu background era de backend Web e eu não possuia muita experiência com JavaScript ou
qualquer um de seus frameworks. Sendo assim, não vou comparar o React Native com outras tecnologias, mas
vou passar as impressões que ficaram.

Primeiramente, o React Native, assim como o React, possui uma maneira particular de trabalhar com o estado
da aplicação e eu levei algum tempo para me adaptar a isso. O framework trabalha com componentes
declarativos, ou seja, com a definição de como uma tela deve parecer dado um determinado estado.
O controle dos estados é realizado através dos tipos de dado "state" e "props" e o próprio React Native
verifica as alterações desses tipos de dados e rerenderiza os componentes de maneira muito eficiente.

O "state" armazena os dados que se alteram durante o lifetime de um componente, já o "props" tem seu valor
 atribuido pelo componente pai e não muda durante o lifetime. Sendo assim, o "state"
  deve ser inicializado no construtor e sempre que for alterá-lo,
você deve utilizar o "setState".

Por exemplo:

    import React, { Component } from 'react';
    import { AppRegistry, Text, View } from 'react-native';

    //Componente que pisca
    class TextoQuePisca extends Component {
      constructor(props) {
        super(props);
        this.state = {mostraTexto: true};

        // Alterna "mostraTexto" a cada segundo
        setInterval(() => {
          this.setState({ mostraTexto: !this.state.mostraTexto });
        }, 1000);
      }

      render() {
        let display = this.state.mostraTexto ? this.props.texto : ' ';
        return (
          <Text>{display}</Text>
        );
      }
    }

    class MeuApp extends Component {
      render() {
        return (
          <View>
            <TextoQuePisca texto='Esse texto pisca' />
            <TextoQuePisca texto='e esse também' />
          </View>
        );
      }
    }

    AppRegistry.registerComponent('MeuApp', () => MeuApp);

Note que toda vez que o "setState" for chamado e houver alterações no estado, o componente é renderizado novamente.
Você jamais utilizará o "setState" dentro da função de renderização de um componente.
Em uma aplicação de verdade, por exemplo, ele será chamado cada vez que um dado novo chegar ou com inputs de usuário.

Uma opção que fiz, e é conhecida como boa prática, foi utilizar funções no lugar de classes sempre que não era necessário
controlar o estado do componente (prática conhecida por "stateless functional component"). Isso tornou o app mais modular e fácil de ser testado.
Um exemplo dessa prática seria:

    import React, { Component } from 'react';
    import { AppRegistry, Text, View } from 'react-native';

    //Componente funcional
    const Exemplo = props => {
      return(
        <Text>
            {props.texto}
        </Text>
      )
    }

    class MeuApp extends Component {
      render() {
        return (
          <View>
            <Exemplo texto = 'Exemplo de componente funcional.'/>
          </View>
        );
      }
    }

    AppRegistry.registerComponent('MeuApp', () => MeuApp);

A aplicação que desenvolvi utilizando React Native possuia 5 telas simples, portanto não exigia a utilização de
bibliotecas como Redux para o gerenciamento do estado. Além disso, como já estava aprendendo uma nova tecnologia,
tive receio de gerar um overhead incluindo o Redux.

Tendo o conceito do estado bem entendido, o restante do desenvolvimento foi mais tranquilo. Consegui terminar o
aplicativo e colocá-lo na playstore em uma semana e acredito que isso tenha sido impulsionado pelo "Hot Reloading" que a ferramenta oferece.

Desenhar as telas e testar o que estava sendo desenvolvido foi muito eficiente, pois basta salvar as alterações
do código que o aplicativo é instantaneamente recarregado. Além disso, por ter uma comunidade muito ativa, não
foi um problema encontrar documentações ou bibliotecas para tudo que precisei.

Como dito anteriormente, o aplicativo foi desenvolvido apenas para Android, entretanto caso seja
necessário distribuí-lo também para o iOS, não será um problema, visto que  mais de 80% do código
pode ser utilizado para as duas plataformas.

E então, o que ficou? Como não tenho como comparar o React Native com outros frameworks, a sensação que
fica é a de que ele é uma ferramenta muito potente que veio para melhorar a experiência do desenvolvedor
e também do usuário final. O framework respeita o ecossistema nativo de cada plataforma, mas sem perder a
possibilidade de escrever trechos de código que funcionem para todas, e isso é sensacional para o gerenciamento
do projeto visto que não é necessário manter mais de uma equipe para a entrega de aplicativos que pareçam nativos
em mais de uma plataforma.
