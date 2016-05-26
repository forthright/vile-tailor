module.exports = [
  {
    path: "/main.swift",
    message: "Global Constant should be either lowerCamelCase or UpperCamelCase",
    type: "maintainability",
    signature: "tailor::constant-naming",
    where: {
      start: {
        line: 1,
        character: 5
      }
    }
  }
  {
    path: "/foo.swift",
    message: "A bad messag",
    type: "error",
    signature: "tailor::something-bad",
    where: {
      start: {
        line: 2,
        character: 2
      }
    }
  }
]

