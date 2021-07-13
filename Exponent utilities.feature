Feature: Exponent utilities


Scenario: Calculating Exponent

While I verify number $counter is less than or equal to $exponent
	Then I multiply variable "result" by $base
    And I increase variable "counter" by 1
    Then I echo $result
EndWhile