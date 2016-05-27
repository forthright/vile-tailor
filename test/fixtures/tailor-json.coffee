module.exports = {
  "files": [
    {
      "path": "/main.swift",
      "violations": [
        {
          "severity": "warning",
          "rule": "constant-naming",
          "message": "Issue with no line info"
        }
      ],
      "parsed": true
    }
    {
      "path": "/main.swift",
      "violations": [
        {
          "severity": "warning",
          "rule": "constant-naming",
          "location": {
            "line": 1,
            "column": 5
          },
          "message": "Global Constant should be either lowerCamelCase or UpperCamelCase"
        }
      ],
      "parsed": true
    }
    {
      "path": "/foo.swift",
      "violations": [
        {
          "severity": "error",
          "rule": "something-bad",
          "location": {
            "line": 2,
            "column": 2
          },
          "message": "A bad messag"
        }
      ],
      "parsed": true
    }
  ],
  "summary": {
    "violations": 2,
    "warnings": 1,
    "analyzed": 2,
    "errors": 1,
    "skipped": 0
  }
}
