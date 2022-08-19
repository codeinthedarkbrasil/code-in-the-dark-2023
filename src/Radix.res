module Dialog = {
  module Root = {
    @react.component @module("@radix-ui/react-dialog")
    external make: (
      ~children: React.element,
      ~onOpenChange: bool => unit=?,
      ~_open: bool=?,
    ) => React.element = "Root"
  }

  module Trigger = {
    @react.component @module("@radix-ui/react-dialog")
    external make: (
      ~children: React.element,
      ~asChild: bool=?,
      ~onClick: unit => unit=?,
    ) => React.element = "Trigger"
  }

  module Portal = {
    @react.component @module("@radix-ui/react-dialog")
    external make: (~children: React.element) => React.element = "Portal"
  }

  module Overlay = {
    @react.component @module("@radix-ui/react-dialog")
    external make: (~className: string=?, ~children: React.element) => React.element = "Content"
  }

  module Content = {
    @react.component @module("@radix-ui/react-dialog")
    external make: (
      ~asChild: bool=?,
      ~className: string=?,
      ~children: React.element,
    ) => React.element = "Content"
  }

  module Title = {
    @react.component @module("@radix-ui/react-dialog")
    external make: (
      ~children: React.element,
      ~className: string=?,
      ~asChild: bool=?,
    ) => React.element = "Title"
  }

  module Description = {
    @react.component @module("@radix-ui/react-dialog")
    external make: (~children: React.element, ~asChild: bool=?) => React.element = "Description"
  }

  module Close = {
    @react.component @module("@radix-ui/react-dialog")
    external make: (~children: React.element=?, ~asChild: bool=?) => React.element = "Close"
  }
}

module Accordion = {
  module Root = {
    @react.component @module("@radix-ui/react-accordion")
    external make: (
      ~children: React.element,
      ~_type: [#single | #multiple],
      ~value: string=?,
      ~collapsible: bool=?,
      ~defaultValue: string=?,
    ) => React.element = "Root"
  }

  module Item = {
    @react.component @module("@radix-ui/react-accordion")
    external make: (
      ~children: React.element,
      ~className: string=?,
      ~value: string,
    ) => React.element = "Item"
  }

  module Header = {
    @react.component @module("@radix-ui/react-accordion")
    external make: (~children: React.element, ~className: string=?) => React.element = "Header"
  }

  module Trigger = {
    @react.component @module("@radix-ui/react-accordion")
    external make: (
      ~asChild: bool=?,
      ~className: string=?,
      ~children: React.element,
    ) => React.element = "Trigger"
  }

  module Content = {
    @react.component @module("@radix-ui/react-accordion")
    external make: (
      ~asChild: bool=?,
      ~className: string=?,
      ~children: React.element,
    ) => React.element = "Content"
  }
}
