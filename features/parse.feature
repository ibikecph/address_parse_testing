ruby: warning: -K is specified; it is for 1.8 compatibility and may cause odd behavior
ruby: warning: -K is specified; it is for 1.8 compatibility and may cause odd behavior
Feature: Parse input addresses
In order to find the correct place on the map 
Users should be able to enter addresses in various formats 

    Scenario: Street only
        When the address is parsed we should get
            | input            | street           | nr | zip | city |
            | Bredgade         | Bredgade         |    |     |      |
            | Stor Kongenagade | Stor Kongenagade |    |     |      |


    Scenario: Street only, but with special characters 
        When the address is parsed we should get
            | input             | street            | nr | zip | city |
            | Skt. Hans Torv    | Skt. Hans Torv    |    |     |      |
            | Christian X's Vej | Christian X's Vej |    |     |      |
