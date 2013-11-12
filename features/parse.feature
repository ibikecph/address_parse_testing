Feature: Parse input addresses
In order to find the correct place on the map 
Users should be able to enter addresses in various formats 

    Scenario: Street
        When the address is parsed we should get
            | input      | street     | nr | zip | city |
            | Bredgade   | Bredgade   |    |     |      |
            | Lille Torv | Lille Torv |    |     |      |

    Scenario: Street with special characters 
        When the address is parsed we should get
            | input             | street            | nr | zip | city |
            | Skt. Hans Torv    | Skt. Hans Torv    |    |     |      |
            | Christian X's Vej | Christian X's Vej |    |     |      |

    Scenario: Street, nr
        When the address is parsed we should get
            | input            | street      | nr   | zip | city |
            | Bredgade 1       | Bredgade    | 1    |     |      |
            | Bredgade 90      | Bredgade    | 90   |     |      |
            | Bredgade 345     | Bredgade    | 345  |     |      |
            | Bredgade 1A      | Bredgade    | 1A   |     |      |
            | Bredgade 90C     | Bredgade    | 90C  |     |      |
            | Bredgade 345Z    | Bredgade    | 345Z |     |      |
            | Yrsas Plads 7    | Yrsas Plads | 7    |     |      |
            | Yrsas Plads 12   | Yrsas Plads | 12   |     |      |
            | Yrsas Plads 921  | Yrsas Plads | 921  |     |      |
            | Yrsas Plads 7D   | Yrsas Plads | 7D   |     |      |
            | Yrsas Plads 12K  | Yrsas Plads | 12K  |     |      |
            | Yrsas Plads 921B | Yrsas Plads | 921B |     |      |

    Scenario: Street, nr with letter
        When the address is parsed we should get
        | input             | street      | nr   | zip | city |
        | Bredgade, 1       | Bredgade    | 1    |     |      |
        | Bredgade, 90      | Bredgade    | 90   |     |      |
        | Bredgade, 345     | Bredgade    | 345  |     |      |
        | Bredgade, 1A      | Bredgade    | 1A   |     |      |
        | Bredgade, 90C     | Bredgade    | 90C  |     |      |
        | Bredgade, 345Z    | Bredgade    | 345Z |     |      |
        | Yrsas Plads, 7    | Yrsas Plads | 7    |     |      |
        | Yrsas Plads, 12   | Yrsas Plads | 12   |     |      |
        | Yrsas Plads, 921  | Yrsas Plads | 921  |     |      |
        | Yrsas Plads, 7D   | Yrsas Plads | 7D   |     |      |
        | Yrsas Plads, 12K  | Yrsas Plads | 12K  |     |      |
        | Yrsas Plads, 921B | Yrsas Plads | 921B |     |      |

    Scenario: Street, city, zip
        When the address is parsed we should get
        | input                 | street   | nr | zip  | city  |
        | Bredgade, 2300 Valby  | Bredgade |    | 2300 | Valby |
        | Bredgade, 2300, Valby | Bredgade |    | 2300 | Valby |
        | Bredgade, Valby 2300  | Bredgade |    | 2300 | Valby |
        | Bredgade, Valby, 2300 | Bredgade |    | 2300 | Valby |
        | Bredgade 2300 Valby   | Bredgade |    | 2300 | Valby |
        | Bredgade 2300, Valby  | Bredgade |    | 2300 | Valby |

    Scenario: Street, city
        When the address is parsed we should get
        | input                    | street   | nr | zip | city           |
        | Bredgade, Valby          | Bredgade |    |     | Valby          |
        | Bredgade, Kongens Lyngby | Bredgade |    |     | Kongens Lyngby |

    Scenario: Street, nr, city, zip
        When the address is parsed we should get
        | input                     | street   | nr | zip  | city  |
        | Bredgade 67, 2300 Valby   | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67, 2300, Valby  | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67, Valby 2300   | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67, Valby, 2300  | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67 2300 Valby    | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67 2300, Valby   | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67 Valby 2300    | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67 Valby, 2300   | Bredgade | 67 | 2300 | Valby |
        | Bredgade, 67, 2300 Valby  | Bredgade | 67 | 2300 | Valby |
        | Bredgade, 67, 2300, Valby | Bredgade | 67 | 2300 | Valby |
        | Bredgade, 67, Valby 2300  | Bredgade | 67 | 2300 | Valby |
        | Bredgade, 67, Valby, 2300 | Bredgade | 67 | 2300 | Valby |
        | Bredgade, 67 2300 Valby   | Bredgade | 67 | 2300 | Valby |
        | Bredgade, 67 2300, Valby  | Bredgade | 67 | 2300 | Valby |
        | Bredgade, 67 Valby 2300   | Bredgade | 67 | 2300 | Valby |
        | Bredgade, 67 Valby, 2300  | Bredgade | 67 | 2300 | Valby |

    Scenario: Handle trailing noise
        When the address is parsed we should get
        | input                         | street   | nr | zip  | city  |
        | Bredgade 67, 2300 Valby       | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67, 2300, Valby,     | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67, Valby 2300,,     | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67, Valby, 2300, , , | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67 2300 Valby        | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67 Valby 2300,,      | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67 Valby 2300, , ,   | Bredgade | 67 | 2300 | Valby |

    Scenario: Ignore additional items
        When the address is parsed we should get
        | input                                                | street   | nr | zip  | city  |
        | Bredgade, 67, 2300, Valby, Sjælland                  | Bredgade | 67 | 2300 | Valby |
        | Bredgade, 67, 2300, Valby, Sjælland, Denmark         | Bredgade | 67 | 2300 | Valby |
        | Bredgade, 67, 2300, Valby, Sjælland, Denmark, Europe | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67, 2300, Valby, Sjælland                   | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67, 2300, Valby, Sjælland, Denmark          | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67, 2300, Valby, Sjælland, Denmark, Europe  | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67 2300 Valby, Sjælland                     | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67 2300 Valby, Sjælland, Denmark            | Bredgade | 67 | 2300 | Valby |
        | Bredgade 67 2300 Valby, Sjælland, Denmark, Europe    | Bredgade | 67 | 2300 | Valby |
