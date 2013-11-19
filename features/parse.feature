Feature: Parse input addresses
In order to find the correct place on the map 
Users should be able to enter addresses in various formats 

    Scenario: zip, city
        When the address is parsed we should get
            | input            | street | nr | zip  | city        |
            | 1180 København K |        |    | 1180 | København K |
            | 8600 Aarhus      |        |    | 8600 | Aarhus      |

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

    Scenario: Street, nr, city
        When the address is parsed we should get
        | input                | street   | nr  | zip | city  |
        | Bredgade 35C Valby   | Bredgade | 35C |     | Valby |
        | Bredgade, 35C Valby  | Bredgade | 35C |     | Valby |
        | Bredgade, 35C, Valby | Bredgade | 35C |     | Valby |
        | Bredgade, 35C, Valby | Bredgade | 35C |     | Valby |

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
        | Bredgade, Kgs. Lyngby    | Bredgade |    |     | Kgs. Lyngby    |

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

    Scenario: Expand kbh
        When the address is parsed we should get
        | input                    | street   | nr  | zip  | city         |
        | Bredgade 35C Kbh         | Bredgade | 35C |      | København    |
        | Bredgade, 35C kbh N      | Bredgade | 35C |      | København N  |
        | Bredgade, 35C, KBH. V    | Bredgade | 35C |      | København V  |
        | Bredgade, 35C, KBH.S     | Bredgade | 35C |      | København S  |
        | Bredgade 35C Akbhøj      | Bredgade | 35C |      | Akbhøj       |
        | Bredgade, 35C Kbhøj      | Bredgade | 35C |      | Kbhøj        |
        | Bredgade, 35C, Kokbh     | Bredgade | 35C |      | Kokbh        |
        | Bredgade 35C Cph         | Bredgade | 35C |      | København    |
        | Bredgade, 35C Cph N      | Bredgade | 35C |      | København N  |
        | Bredgade, 35C, CPH. V    | Bredgade | 35C |      | København V  |
        | Bredgade, 35C, CPH.S     | Bredgade | 35C |      | København S  |
        | Bredgade 35C Acphøj      | Bredgade | 35C |      | Acphøj       |
        | Bredgade, 35C Cphøj      | Bredgade | 35C |      | Cphøj        |
        | Bredgade, 35C, Kocph     | Bredgade | 35C |      | Kocph        |
        | Bredgade 35C 1571 Kbh NV | Bredgade | 35C | 1571 | København NV |
        | Bredgade 35C 1571 Cph K  | Bredgade | 35C | 1571 | København K  |
