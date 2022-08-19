module Colors = {
  type t = [
    | #background
    | #primary100
    | #white
    | #gray100
    | #gray200
  ]

  let colors = (token: t) =>
    switch token {
    | #background => #hex("#000000")
    | #primary100 => #hex("#58CB90")
    | #white => #hex("#FFF")
    | #gray100 => #hex("#CFD0D1")
    | #gray200 => #hex("#5B5C5F")
    }

  let make = token => token->colors->Ancestor_Css.Color.toString
}

let colors = Colors.make
