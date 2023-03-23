# BrightScript XML to Associative Array converter


## Source XML

```
<?xml version="1.0"?>
<Tests xmlns="http://www.adatum.com">
  <Test TestId="0001" TestType="CMD">
    <Name>Convert number to string</Name>
    <CommandLine>Examp1.EXE</CommandLine>
    <Input>1</Input>
    <Output>One</Output>
  </Test>
  <Test TestId="0002" TestType="CMD">
    <Name>Find succeeding characters</Name>
    <CommandLine>Examp2.EXE</CommandLine>
    <Input>abc</Input>
    <Output>def</Output>
  </Test>
  <Test TestId="0003" TestType="GUI">
    <Name>Convert multiple numbers to strings</Name>
    <CommandLine>Examp2.EXE /Verbose</CommandLine>
    <Input>123</Input>
    <Output>One Two Three</Output>
  </Test>
  <Test TestId="0004" TestType="GUI">
    <Name>Find correlated key</Name>
    <CommandLine>Examp3.EXE</CommandLine>
    <Input>a1</Input>
    <Output>b1</Output>
  </Test>
  <Test TestId="0005" TestType="GUI">
    <Name>Count characters</Name>
    <CommandLine>FinalExamp.EXE</CommandLine>
    <Input>This is a test</Input>
    <Output>14</Output>
  </Test>
  <Test TestId="0006" TestType="GUI">
    <Name>Another Test</Name>
    <CommandLine>Examp2.EXE</CommandLine>
    <Input>Test Input</Input>
    <Output>10</Output>
  </Test>
</Tests>
```

## Resulting JSON

```
{
    "Tests": {
        "Test": [
            {
                "CommandLine": "Examp1.EXE",
                "Input": "1",
                "Name": "Convert number to string",
                "Output": "One",
                "TestId": "0001",
                "TestType": "CMD"
            },
            {
                "CommandLine": "Examp2.EXE",
                "Input": "abc",
                "Name": "Find succeeding characters",
                "Output": "def",
                "TestId": "0002",
                "TestType": "CMD"
            },
            {
                "CommandLine": "Examp2.EXE /Verbose",
                "Input": "123",
                "Name": "Convert multiple numbers to strings",
                "Output": "One Two Three",
                "TestId": "0003",
                "TestType": "GUI"
            },
            {
                "CommandLine": "Examp3.EXE",
                "Input": "a1",
                "Name": "Find correlated key",
                "Output": "b1",
                "TestId": "0004",
                "TestType": "GUI"
            },
            {
                "CommandLine": "FinalExamp.EXE",
                "Input": "This is a test",
                "Name": "Count characters",
                "Output": "14",
                "TestId": "0005",
                "TestType": "GUI"
            },
            {
                "CommandLine": "Examp2.EXE",
                "Input": "Test Input",
                "Name": "Another Test",
                "Output": "10",
                "TestId": "0006",
                "TestType": "GUI"
            }
        ],
        "xmlns": "http://www.adatum.com"
    }
}
```