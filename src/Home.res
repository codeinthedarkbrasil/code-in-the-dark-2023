open AncestorCodeInTheDark

let s = React.string

Emotion.injectGlobal({
  "html, body, __#next": {
    "overflowX": "hidden",
    "overflowY": "auto",
    "padding": 0,
    "margin": 0,
    "height": "100%",
  },
  "*": {
    "boxSizing": "border-box",
    "fontFamily": "Montserrat",
    "scrollBehavior": "smooth",
  },
  "html": {
    "fontSize": "62.5%",
    "backgroundImage": "url('/noised-background.png')",
    "backgroundSize": "cover",
  },
})

module Button = {
  let button = Emotion.css({
    "borderRadius": 20,
    "padding": 16,
    "display": "flex",
    "alignItems": "center",
    "justifyContent": "center",
    "height": 40,
    "background": "transparent",
    "color": "white",
    "fontWeight": 700,
    "fontFamily": "Space Mono",
    "fontSize": 16,
    "letterSpacing": "-0.03em",
    "border": `solid 2px ${Theme.colors(#primary100)}`,
    "transition": "200ms ",
    "cursor": "pointer",
    "&:hover": {
      "background": Theme.colors(#primary100),
      "color": Theme.colors(#background),
    },
  })

  @react.component
  let make = React.forwardRef((~label, ~onClick=?, ~fontSize=[xs(16->#px)], innerRef) => {
    <Base
      ?onClick
      innerRef=?{innerRef->Js.Nullable.toOption->Belt.Option.map(ReactDOM.Ref.domRef)}
      fontSize
      className=button
      tag=#button>
      {label->s}
    </Base>
  })
}

module SectionTitle = {
  @react.component
  let make = (~children) => {
    <Typography
      mb=[xs(4.0)]
      fontSize=[xs(32->#px), sm(46->#px), md(88->#px)]
      color=[xs(#white)]
      fontWeight=[xs(#700)]
      m=[xs(0.0)]
      className={Emotion.css({"fontStyle": "italic"})}
      tag=#h1>
      {children}
    </Typography>
  }
}

module Link = {
  let link = (~underlined) =>
    Emotion.css({
      "fontFamily": "Space Mono",
      "fontWeight": 700,
      "letterSpacing": "-0.03em",
      "color": "white",
      "cursor": "pointer",
      "transition": "200ms color",
      "textDecoration": underlined ? "underline" : "none",
      "&:hover,&:focus": {
        "textDecoration": "underline",
        "color": Theme.colors(#primary100),
      },
    })

  @react.component
  let make = React.forwardRef((
    ~label,
    ~href=?,
    ~underlined=false,
    ~target=?,
    ~fontSize=[xs(16->#px)],
    ~onClick=?,
    innerRef,
  ) => {
    <Base
      ?onClick
      ?href
      ?target
      innerRef=?{innerRef->Js.Nullable.toOption->Belt.Option.map(ReactDOM.Ref.domRef)}
      tag=#a
      rel="noopener noreferrer"
      fontSize
      className={link(~underlined)}>
      {label->s}
    </Base>
  })
}

module MobileMenu = {
  open Radix

  let fadeIn = Emotion.keyframes({
    "from": {
      "opacity": 0,
      "top": 20,
    },
    "to": {
      "opacity": 1,
      "top": 0,
    },
  })

  let content = Emotion.css({
    "backgroundColor": Theme.colors(#background),
    "zIndex": 100,
    "width": "100%",
    "height": "100%",
    "position": "fixed",
    "top": 0,
    "left": 0,
    "animation": `${fadeIn} 250ms forwards`,
  })

  @react.component
  let make = (~trigger) => {
    <Dialog.Root>
      <Dialog.Trigger asChild=true> trigger </Dialog.Trigger>
      <Dialog.Content className=content>
        <Box position=[xs(#fixed)] top=[xs(24->#px)] right=[xs(24->#px)]>
          <Dialog.Close asChild=true> <Button label=`fechar` /> </Dialog.Close>
        </Box>
        <Stack
          height=[xs(100.0->#pct)]
          justifyContent=[xs(#center)]
          alignItems=[xs(#center)]
          gap=[xs(#one(3.0))]>
          <Dialog.Close asChild=true>
            <Link fontSize=[xs(24->#px)] label="FAQ" href="#faq" />
          </Dialog.Close>
          <Link fontSize=[xs(24->#px)] label=`MÍDIA KIT` href="midia-kit-link" target="_blank" />
          /*
           * Ainda não temos formulário de inscrição.
           * <Button fontSize=[xs(18->#px)] label=`CADASTRE-SE` />
           */
        </Stack>
      </Dialog.Content>
    </Dialog.Root>
  }
}

module Header = {
  @react.component
  let make = () => {
    <Box
      py=[xs(3.0), md(4.5)]
      tag=#header
      display=[xs(#flex)]
      alignItems=[xs(#"flex-start")]
      justifyContent=[xs(#"space-between")]
      width=[xs(100.0->#pct)]>
      <Box
        position=[xs(#relative)]
        width=[xs(72->#px), md(127->#px)]
        height=[xs(78->#px), md(139->#px)]>
        <Next.Image
          src="/logo.webp"
          layout=#fill
          quality=100.0
          priority=true
          alt=`Logo Code In The Dark Brasil`
        />
      </Box>
      <Hidden on=[xs(true), sm(false)]>
        <Stack direction=[xs(#horizontal)] gap=[xs(#one(4.0))] alignItems=[xs(#center)]>
          <Link label="faq" href="#faq" />
          <Link label=`mídia kit` href="midia-kit-link" target="_blank" />
          /*
           * Ainda não temos formulário de inscrição.
           * <Button label="cadastre-se" />
           */
        </Stack>
      </Hidden>
      <Hidden on=[sm(true)]> <MobileMenu trigger={<Button label="menu" />} /> </Hidden>
    </Box>
  }
}

module RoundedButton = {
  let button = Emotion.css({
    "borderRadius": "50%",
    "color": Theme.colors(#white),
    "fontFamily": "Space Mono",
    "fontWeight": 700,
    "border": `solid 2px ${Theme.colors(#primary100)}`,
    "background": "transparent",
    "transition": "200ms ",
    "cursor": "pointer",
    "textDecoration": "none",
    "display": "flex",
    "justifyContent": "center",
    "alignItems": "center",
    "&:hover": {
      "background": Theme.colors(#primary100),
      "color": Theme.colors(#background),
    },
  })
  @react.component
  let make = (~label, ~href=?) =>
    <Base
      ?href
      tag=#a
      rel="noopener noreferrer"
      height=[xs(124->#px), sm(142->#px), md(172->#px)]
      width=[xs(124->#px), sm(142->#px), md(172->#px)]
      fontSize=[xs(16->#px), md(20->#px)]
      className=button>
      {label->s}
    </Base>
}

module Hero = {
  let title = Emotion.css({
    "fontStyle": "italic",
  })

  @react.component
  let make = () => {
    <Box position=[xs(#relative)] display=[xs(#flex)] justifyContent=[xs(#center)]>
      <Typography
        maxW=[xs(356->#px), sm(512->#px), md(680->#px)]
        tag=#h1
        color=[xs(#white)]
        fontSize=[xs(39->#px), sm(62->#px), md(84->#px)]
        className=title>
        {`Então você acha que sabe front-end?`->s}
      </Typography>
      <Box
        position=[xs(#absolute)]
        bottom=[xs(-124->#px), md(-56->#px)]
        right=[xs(32->#px), sm(72->#px), lg(324->#px)]>
        <RoundedButton label=`Conheça` href="#como-funciona" />
      </Box>
    </Box>
  }
}
module HowItWorksTitle = {
  @react.component
  let make = () => {
    <Stack
      position=[lg(#sticky)] top=[lg(56->#px)] alignItems=[xs(#"flex-start")] gap=[xs(#one(3.0))]>
      <Stack gap=[xs(#one(1.0))]>
        <SectionTitle> {`Como`->s} <br /> {`Funciona?`->s} </SectionTitle>
        <Box maxW=[md(382->#px)]>
          <Typography
            lineHeight=[xs(2.4->#rem)]
            letterSpacing=[xs(0.13->#em)]
            fontSize=[xs(16->#px)]
            color=[xs(#gray100)]>
            {`Entenda como jogar o evento mais evento mais fixe de Front-end! `->s}
          </Typography>
        </Box>
      </Stack>
      /*
       * Ainda não temos formulário de inscrição.
       * <Button label=`Cadastre-se` />
       */
    </Stack>
  }
}

module HowItWorksStep = {
  let borderedText = Emotion.css({
    "color": Theme.colors(#background),
    "textShadow": `2px 0 ${Theme.colors(#primary100)}, -2px 0 ${Theme.colors(
        #primary100,
      )}, 0 2px ${Theme.colors(#primary100)}, 0 -2px ${Theme.colors(
        #primary100,
      )}, 1px 1px ${Theme.colors(#primary100)}, -1px -1px ${Theme.colors(
        #primary100,
      )}, 1px -1px ${Theme.colors(#primary100)}, -1px 1px ${Theme.colors(#primary100)}`,
  })

  @react.component
  let make = (~index, ~image, ~imageAlt, ~title, ~description) => {
    <Stack alignItems=[xs(#center)] gap=[xs(#one(1.0))]>
      <Typography
        m=[xs(0.0)]
        tag=#h1
        fontWeight=[xs(#700)]
        fontSize=[xs(72->#px), md(132->#px)]
        className=borderedText>
        {index->s}
      </Typography>
      <Box
        position=[xs(#relative)]
        width=[xs(320->#px), sm(424->#px), md(664->#px)]
        height=[xs(185->#px), sm(245->#px), md(384->#px)]>
        <Next.Image src=image layout=#fill quality=100.0 priority=true alt=imageAlt />
      </Box>
      <Stack transform=[xs(#translateY(-24->#px))] gap=[xs(#one(1.0))] alignItems=[xs(#center)]>
        <Typography
          textAlign=[xs(#center)]
          tag=#h2
          m=[xs(0.0)]
          bgColor=[xs(#white)]
          p=[xs(1.0)]
          fontWeight=[xs(#700)]
          letterSpacing=[xs(-0.05->#em)]
          fontSize=[xs(18->#px), md(30->#px)]
          color=[xs(#background)]>
          {title->s}
        </Typography>
        <Typography
          m=[xs(0.0)]
          textAlign=[xs(#center)]
          maxW=[xs(324->#px)]
          fontFamily=[xs(#custom(["Space Mono"]))]
          fontSize=[xs(16->#px)]
          color=[xs(#gray100)]
          tag=#p>
          {description->s}
        </Typography>
      </Stack>
    </Stack>
  }
}

module HowItWorks = {
  @react.component
  let make = () => {
    <Stack id="como-funciona" width=[xs(100.0->#pct)]>
      <HowItWorksTitle />
      <Stack
        gap=[xs(#one(8.0)), md(#one(14.0))]
        mt=[xs(6.0)]
        width=[xs(100.0->#pct)]
        alignItems=[xs(#center), lg(#"flex-end")]>
        <HowItWorksStep
          index=`01`
          imageAlt=`A imagem mostra um monitor com o editor do code in the dark aberto e ao fundo é possível ver os participantes da competição.`
          image=`/how-it-works-3.webp`
          title=`4 rounds de 15 minutos`
          description=`4 Players por ronda lutarão contra o relógio para chegar mais próximo do layout apresentado`
        />
        <HowItWorksStep
          index=`02`
          imageAlt=`A imagem mostra um monitor com o editor do code in the dark aberto e ao fundo é possível ver os participantes da competição. No fundo também há várias luzes de diversas cores.`
          image=`/how-it-works-2.webp`
          title=`HTML & CSS only!`
          description=`Com apenas uma imagem de referência, sua missão será produzir o HTML e CSS em 15 minutos`
        />
        <HowItWorksStep
          index=`03`
          imageAlt=`A imagem mostra um monitor com o editor do code in the dark aberto e ao fundo é possível ver os participantes da competição. No fundo também há várias luzes de diversas cores.`
          image=`/how-it-works-1.webp`
          title=`Sem previews`
          description=`Durante as rondas não é permitido ver no navegador como está ficando o layout muhahaaha!`
        />
      </Stack>
    </Stack>
  }
}

module FaqItem = {
  let slideDown = Emotion.keyframes({
    "from": {"height": 0},
    "to": {"height": "var(--radix-accordion-content-height)"},
  })

  let slideUp = Emotion.keyframes({
    "from": {"height": "var(--radix-accordion-content-height)"},
    "to": {"height": 0},
  })

  let item = Emotion.css({
    "borderTop": `solid 2px ${Theme.colors(#gray200)}`,
    "&:last-child": {
      "borderBottom": `solid 2px ${Theme.colors(#gray200)}`,
    },
    "paddingBottom": 24,
    "@media (min-width: 475px)": {
      "paddingBottom": 64,
    },
  })

  let trigger = Emotion.css({
    "border": 0,
    "paddingTop": 24,
    "width": "100%",
    "background": 0,
    "outline": 0,
    "textAlign": "left",
    "display": "flex",
    "gap": 16,
    "alignItems": "center",
    "justifyContent": "space-between",
    "color": Theme.colors(#gray100),
    "transition": "200ms color",
    "> span": {
      "position": "relative",
      "height": 24,
      "width": 24,
      "&:after,&:before": {
        "top": 0,
        "left": 0,
        "width": 3,
        "height": 24,
        "borderRadius": 2,
        "content": `""`,
        "position": "absolute",
        "background": Theme.colors(#gray200),
        "transition": "250ms transform, 200ms background",
      },
      "&:after": {
        "transform": "rotate(90deg)",
      },
    },
    "@media (min-width: 475px)": {
      "paddingTop": 64,
      "> span": {
        "height": 42,
        "width": 42,
      },
      "> span:after, > span:before": {
        "width": 3,
        "height": 42,
      },
    },
    "&[data-state='open']": {
      ">span:before": {
        "transition": "250ms transform",
        "transform": "rotate(90deg)",
      },
    },
    "&:hover, &:focus": {
      "> span:after, > span:before": {
        "transition": "250ms transform, 200ms background",
        "background": Theme.colors(#primary100),
      },
      "color": Theme.colors(#primary100),
    },
  })

  let content = Emotion.css({
    "overflow": "hidden",
    "&[data-state='open']": {
      "animation": `${slideDown} 300ms cubic-bezier(0.87, 0, 0.13, 1)`,
    },
    "&[data-state='closed']": {
      "animation": `${slideUp} 300ms cubic-bezier(0.87, 0, 0.13, 1)`,
    },
  })

  @react.component
  let make = (~title, ~children, ~id) => {
    open Radix

    <Accordion.Item value=id className=item>
      <Accordion.Header asChild=true>
        <div>
          <Accordion.Trigger className=trigger>
            <Typography
              tag=#p
              fontWeight=[xs(#400)]
              fontFamily=[xs(#custom(["Space Mono"]))]
              fontSize=[xs(20->#px)]
              letterSpacing=[xs(-0.03->#em)]>
              {title->s}
            </Typography>
            <Base tag=#span />
          </Accordion.Trigger>
        </div>
      </Accordion.Header>
      <Accordion.Content className=content> children </Accordion.Content>
    </Accordion.Item>
  }
}

module FaqAnswer = {
  @react.component
  let make = (~children) =>
    <Typography
      fontSize=[xs(16->#px)] color=[xs(#gray100)] fontFamily=[xs(#custom(["Space Mono"]))]>
      children
    </Typography>
}

module Faq = {
  @react.component
  let make = () => {
    open Radix

    <Stack id="faq" alignItems=[xs(#center)]>
      <Stack maxW=[xs(960->#px)] width=[xs(100.0->#pct)]>
        <SectionTitle> {`Tire suas dúvidas`->s} </SectionTitle>
        <Accordion.Root _type=#multiple>
          <FaqItem title=`Quem pode participar?` id="1">
            <FaqAnswer>
              {`Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,`->s}
            </FaqAnswer>
          </FaqItem>
          <FaqItem title=`Posso ir apenas para assistir?` id="2">
            <FaqAnswer>
              {`Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,`->s}
            </FaqAnswer>
          </FaqItem>
          <FaqItem title=`Como será feita a escolha dos participantes das rodadas?` id="3">
            <FaqAnswer>
              {`Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,`->s}
            </FaqAnswer>
          </FaqItem>
          <FaqItem title=`Posso usar meu editor de código habitual?` id="4">
            <FaqAnswer>
              {`Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,`->s}
            </FaqAnswer>
          </FaqItem>
          <FaqItem title=`Preciso levar o meu computador para participar?` id="5">
            <FaqAnswer>
              {`Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,`->s}
            </FaqAnswer>
          </FaqItem>
          <FaqItem
            title=`Posso usar alguma ferramenta de medição de pixels, de cor ou qualquer outra coisa parecida?`
            id="6">
            <FaqAnswer>
              {`Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,`->s}
            </FaqAnswer>
          </FaqItem>
          <FaqItem title=`Eu consigo ver o resultado do que eu estiver a fazer?` id="7">
            <FaqAnswer>
              {`Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,`->s}
            </FaqAnswer>
          </FaqItem>
          <FaqItem title=`Eu consigo ver o resultado do que eu estiver a fazer?` id="8">
            <FaqAnswer>
              {`Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,`->s}
            </FaqAnswer>
          </FaqItem>
          <FaqItem
            title=`O que é que o público vai fazer enquanto os competidores estiverem a desenvolver?`
            id="9">
            <FaqAnswer>
              {`Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,`->s}
            </FaqAnswer>
          </FaqItem>
          <FaqItem title=`Como foi a edição de Julho de 2018?` id="10">
            <FaqAnswer>
              {`Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,`->s}
            </FaqAnswer>
          </FaqItem>
        </Accordion.Root>
      </Stack>
    </Stack>
  }
}

module StaffMember = {
  let link = Emotion.css({
    "fontSize": 16,
    "fontWeight": 700,
    "color": Theme.colors(#gray200),
    "fontFamily": "Space Mono",
    "textDecoration": "none",
    "&:hover": {
      "color": Theme.colors(#primary100),
      "textDecoration": `underline ${Theme.colors(#primary100)}`,
    },
  })

  @react.component
  let make = (~name, ~pfp, ~twitter="", ~linkedin="") => {
    <Stack gap=[xs(#one(0.5))]>
      <Next.Image
        src=pfp layout=#fixed alt={`Foto do Membro ${name}`} width=224.0 height=232.0 quality=100.0
      />
      <Typography
        m=[xs(0.0)]
        tag=#p
        fontSize=[xs(18->#px)]
        color=[xs(#white)]
        fontWeight=[xs(#700)]
        fontFamily=[xs(#custom(["Space Mono"]))]>
        {name->s}
      </Typography>
      <a href=twitter rel="noopener noreferrer" target="_blank" className=link>
        {`@twitter?`->s}
      </a>
      <a href=linkedin rel="noopener noreferrer" target="_blank" className=link>
        {`@linkedin?`->s}
      </a>
    </Stack>
  }
}

module Staff = {
  @react.component
  let make = () => {
    <Stack alignItems=[xs(#center)] gap=[xs(#one(5.0))]>
      <SectionTitle> {`Staff`->s} </SectionTitle>
      <Stack gap=[xs(#one(3.0))] direction=[xs(#vertical), lg(#horizontal)]>
        <Stack direction=[xs(#vertical), sm(#horizontal)] gap=[xs(#one(3.0))]>
          <StaffMember name="Sergio Nascimento" twitter="https://twitter.com" pfp="/sergio.webp" />
          <StaffMember name="Vitor Mendrone" twitter="https://twitter.com" pfp="/mendrone.webp" />
        </Stack>
        <Stack direction=[xs(#vertical), sm(#horizontal)] gap=[xs(#one(3.0))]>
          <StaffMember name="Leandro Matos" twitter="https://twitter.com" pfp="/leandro.webp" />
          <StaffMember name=`Anah Assumpção` twitter="https://twitter.com" pfp="/anah.webp" />
        </Stack>
      </Stack>
    </Stack>
  }
}

module Sponsors = {
  @react.component
  let make = () => {
    <Stack alignItems=[xs(#center)] gap=[xs(#one(6.0))]>
      <SectionTitle> {`Patrocínio`->s} </SectionTitle>
      <Stack
        direction=[xs(#vertical), sm(#horizontal)]
        gap=[xs(#one(4.0)), md(#one(8.0))]
        alignItems=[xs(#center)]>
        <Box
          tag=#a
          rel="noopener noreferrer"
          ariaLabel=`Site da Juntos Somos Mais`
          href="https://www.juntossomosmais.com.br/"
          target="_blank"
          position=[xs(#relative)]
          width=[xs(224->#px), md(321->#px)]>
          <Next.Image
            src="/juntos-somos-mais.webp"
            layout=#responsive
            width=321.0
            height=88.0
            alt="Logo da empresa Juntos Somos Mais"
          />
        </Box>
      </Stack>
    </Stack>
  }
}

module Supporters = {
  @react.component
  let make = () => {
    <Stack alignItems=[xs(#center)] gap=[xs(#one(6.0))]>
      <SectionTitle> {`Apoio`->s} </SectionTitle>
      <Stack
        direction=[xs(#vertical), sm(#horizontal)]
        gap=[xs(#one(4.0)), md(#one(8.0))]
        alignItems=[xs(#center)]>
        <Box
          tag=#a
          rel="noopener noreferrer"
          ariaLabel=`Site da Comunidade ReScript Brasil`
          href="https://github.com/rescriptbr"
          target="_blank"
          position=[xs(#relative)]
          width=[xs(224->#px), md(321->#px)]>
          <Next.Image
            alt="Logo da comunidade ReScript Brasil"
            src="/rescript.webp"
            layout=#responsive
            width=302.0
            height=95.0
          />
        </Box>
      </Stack>
    </Stack>
  }
}

module Footer = {
  @react.component
  let make = () => {
    <Box
      mt=[xs(24.0), md(42.0)]
      bgPosition=[xs(#top)]
      bgSize=[xs(#cover)]
      bgImage=[xs(#url("/footer-cover.png"))]
      width=[xs(100.0->#pct)]
      tag=#footer>
      <Stack
        height=[xs(100.0->#pct)]
        pt=[xs(4.0), md(10.0)]
        alignItems=[xs(#center)]
        px=[xs(3.0), md(6.0)]
        width=[xs(100.0->#pct)]>
        <Stack
          minH=[xs(300->#px), md(600->#px)]
          pb=[xs(4.0)]
          direction=[xs(#vertical), md(#horizontal)]
          maxW=[xs(962->#px)]
          width=[xs(100.0->#pct)]
          justifyContent=[xs(#"space-between")]
          gap=[xs(#one(4.0))]
          display=[xs(#flex)]>
          <Stack gap=[xs(#one(4.0))]>
            <Link label=`Facebook` /> <Link label=`Instagram` /> <Link label=`Twitter` />
          </Stack>
          <Typography
            tag=#p
            m=[xs(0.0)]
            fontSize=[xs(16->#px)]
            color=[xs(#white)]
            fontFamily=[xs(#custom(["Space Mono"]))]>
            {`codeinthedark • brasil •  2023`->s}
          </Typography>
        </Stack>
      </Stack>
      <Stack
        mt=[xs(4.0)]
        pb=[xs(3.0)]
        width=[xs(100.0->#pct)]
        alignItems=[xs(#center)]
        justifyContent=[xs(#center)]
        direction=[xs(#vertical), md(#horizontal)]
        divider={<Hidden
          on=[xs(true), md(false)] tag=#span color=[xs(#white)] fontSize=[xs(24->#px)]>
          {`•`->s}
        </Hidden>}
        gap=[xs(#one(2.0))]>
        <Typography
          tag=#p
          textAlign=[xs(#center)]
          m=[xs(0.0)]
          fontSize=[xs(16->#px)]
          color=[xs(#white)]
          fontFamily=[xs(#custom(["Space Mono"]))]>
          {`Feito com `->s}
          <Link underlined=true label=`ReScript` href="https://rescript-lang.org" />
          {` pela `->s}
          <Link underlined=true label=`ReScript Brasil` />
        </Typography>
        <Typography
          tag=#p
          textAlign=[xs(#center)]
          m=[xs(0.0)]
          fontSize=[xs(16->#px)]
          color=[xs(#white)]
          fontFamily=[xs(#custom(["Space Mono"]))]>
          {`Design por `->s}
          <Link
            underlined=true
            label=`Anah Assumpção`
            href="https://www.behance.net/anacomh"
            target="_blank"
          />
        </Typography>
      </Stack>
    </Box>
  }
}

module Counter = {
  let container = Emotion.css({
    "width": "100%",
    "position": "relative",
    "height": "50px",
    "borderTop": `solid 1px ${Theme.colors(#white)}`,
    "borderBottom": `solid 1px ${Theme.colors(#white)}`,
  })

  @react.component
  let make = () => {
    <Box
      className=container
      mt=[xs(20.0)]
      display=[xs(#flex)]
      overflow=[xs(#auto)]
      width=[xs(100.0->#pct)]
    />
  }
}

let default = () => {
  <>
    <Next.Head>
      <title> {`Code In The Dark - Edição Brasil 2023`->s} </title>
      <meta name="image" content="/og-image.png" />
      <meta name="twitter:image" content=`https://codeinthedark.com.br/og-image.png` />
      <meta name="twitter:creator" content="@CodeintheDarkBR" />
      <meta name="twitter:title" content=`Code In The Dark` />
      <meta
        name="twitter:description"
        content=`Então você acha que sabe front-end? Imagine uma competição assim: Vários desenvolvedores(as) front-end precisam codificar uma página em apenas 15 minutos... Até aí o desafio já é enorme, concorda? Agora adicione o fato de que eles(as) não podem ver o resultado da página no browser, somente o código fonte, usando apenas HTML e CSS: Esse é o Code in the Dark!`
      />
      <meta name="twitter:card" content="summary_large_image" />
      <meta name="twitter:site" content=`https://codeinthedark.com.br` />
    </Next.Head>
    <Stack pt=[xs(2.0), md(4.0), lg(8.0)] display=[xs(#flex)] alignItems=[xs(#center)]>
      <Stack
        px=[xs(3.0), md(6.0)] maxW=[xs(1512->#px)] width=[xs(100.0->#pct)] position=[xs(#relative)]>
        <Header />
        <Stack gap=[xs(32.0->#one), lg(56.0->#one)]>
          <Hero />
          <Box position=[xs(#absolute)] left=[xs(#zero)] bottom=[xs(-32->#px)]> <Counter /> </Box>
          <HowItWorks />
          <Faq />
          // Ainda não temos a seção "Vamos jogar?"
          <Staff />
          <Sponsors />
          <Supporters />
        </Stack>
      </Stack>
      <Footer />
    </Stack>
  </>
}
