include Ancestor.Make({
  type breakpoints<'a> = [#xs('a) | #sm('a) | #md('a) | #lg('a) | #xl('a)]
  let sizeByBreakpoints = values =>
    switch values {
    | #xs(_) => 0
    | #sm(_) => 475
    | #md(_) => 920
    | #lg(_) => 1280
    | #xl(_) => 1920
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #xs(v) => v
    | #sm(v) => v
    | #md(v) => v
    | #lg(v) => v
    | #xl(v) => v
    }

  type colors = Theme.Colors.t
  let colors = Theme.Colors.colors

  type spacing = float
  let spacing = spacing => #pxFloat(spacing *. 8.0)

  type radius = float
  let radius = radius => #pxFloat(radius *. 8.0)

  type zIndex = int
  let zIndex = v => v

  let css = Ancestor_Emotion.css
})

let xs = v => #xs(v)
let sm = v => #sm(v)
let md = v => #md(v)
let lg = v => #lg(v)
let xl = v => #xl(v)
