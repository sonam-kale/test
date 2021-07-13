Feature: My Feature

Scenario:Calulating Number of Stairs 
Given I assign values in row 2 from "Dataset\data.csv" to variables
Then I echo $floor
And I convert string variable "floor" to INTEGER variable "floor"
When I multiply variable "floor" by 12
    Then I echo "My home has " $floor "stairs!"
    

    